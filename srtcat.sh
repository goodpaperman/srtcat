#! /bin/sh

CONCATE_RESULT=";"

function usage()
{
    echo "Usage: srtcat [-t timespan] file1 file2 ..."
}

# @brief: add hour:min:sec,msec to another 
# @param: hour1
# @param: min1
# @param: sec1
# @param: msec1
# @param: hour2
# @param: min2
# @param: sec2
# @param: msec2
# @return: new time str after add
function time_add()
{
    local h1=$1
    local m1=$2
    local s1=$3
    local ms1=$4
    local h2=$5
    local m2=$6
    local s2=$7
    local ms2=$8
    local h3=0
    local m3=0
    local s3=0
    local ms3=0

    ms3=$((ms1+ms2))
    if [ ${ms3} -ge 1000 ]; then 
        s3=$((ms3/1000))
        ms3=$((ms3%1000))
    fi

    s3=$((s1+s2+s3))
    if [ ${s3} -ge 60 ]; then 
        m3=$((s3/60))
        s3=$((s3%60)) 
    fi

    m3=$((m1+m2+m3))
    if [ ${m3} -ge 60 ]; then 
        h3=$((m3/60))
        m3=$((m3%60))
    fi

    h3=$((h1+h2+h3))
    # can exceed 99 now
    # if [ ${h3} -gt 99 ]; then 
    #     echo "hour (${h3}) exceed 99!" 1>&2
    # fi

    # return "curr_hour=${h3};curr_min=${m3};curr_sec=${s3};curr_msec=${ms3}"
    echo "time add: ${h1}:${m1}:${s1},${ms1} + ${h2}:${m2}:${s2},${ms2} = ${h3}:${m3}:${s3},${ms3}" 1>&2
    # echo "${h3}:${m3}:${s3},${ms3}"
    printf "%02d:%02d:%02d,%03d\n" ${h3} ${m3} ${s3} ${ms3}
}

# @brief: srt single file concating, dumping to stdin
# @param: hour base
# @param: min base
# @param: sec base
# @param: msec base
# @param: time span between file (in msec)
# @param: base ordinal, 0 means first file
# @param: srt file
# @return: new time & new ordinal
function concate_file()
{
    local hour_base=$1
    local min_base=$2
    local sec_base=$3
    local msec_base=$4
    local time_span=$5
    local ord_base=$6
    local file=$7
    local curr_ord=0
    local curr_srt=""
    # start time
    local hour1=0
    local min1=0
    local sec1=0
    local msec1=0
    # end time
    local hour2=0
    local min2=0
    local sec2=0
    local msec2=0

    local line=""
    local n=0 
    local m=0
    local val=""
    local tmp=""

    echo "base time: ${hour_base}:${min_base}:${sec_base},${msec_base}; base ord: ${ord_base}" 1>&2
    if [ ${hour_base} -eq 0 -a ${min_base} -eq 0 -a ${sec_base} -eq 0 -a ${msec_base} -eq 0 ]; then 
        if [ ${ord_base} -gt 0 ]; then 
            echo "all zero time but ordinal > 0, fatal error" 1>&2
            exit 1
        fi
    fi

    while read line; do
        line=$(echo "${line}" | tr -d '\r')
        # echo "line=${line}" 1>&2
        m=$((n%4))
        case $m in
            0)
                # ordinal
                curr_ord=$((line+ord_base))
                echo "${curr_ord}"
                ;;
            1)
                # time range
                if [ ${ord_base} -eq 0 ]; then 
                    echo "${line}"
                    # to determine last end time later
                    val="${line##*--> }"
                else 
                    # 00:01:02,003 --> 04:05:06,007 after break:
                    #  1  2  3  4  56   7  8  9  10 
                    # note add $X/1 to remove leading 0s
                    val=$(echo "${line}" | awk -F':|,|-|>' '{print "hour1="$1/1";min1="$2/1";sec1="$3/1";msec1="$4/1";hour2="$7/1";min2="$8/1";sec2="$9/1";msec2="$10/1";"}')
                    eval "${val}"
                    tmp=$(time_add "${hour1}" "${min1}" "${sec1}" "${msec1}" "${hour_base}" "${min_base}" "${sec_base}" "${msec_base}")
                    val=$(time_add "${hour2}" "${min2}" "${sec2}" "${msec2}" "${hour_base}" "${min_base}" "${sec_base}" "${msec_base}")
                    echo "${tmp} --> ${val}"
                fi 
                ;;
            2)
                # srt
                echo "${line}"
                ;;
            3)
                # empty line
                if [ -n "${line}" ]; then 
                    echo "should be empty line, fatal error! ${line}" 1>&2
                    exit 1
                fi
                echo ""
                ;;
            *)
                echo "invalid result: $m, fatal error!" 1>&2
                exit 1
                ;;
        esac
        n=$((n+1))
    done < ${file}

    if [ $m -ne 3 ]; then 
        if [ $m -eq 2 ]; then 
            echo "sub record index $m, supplement a carrier return" 1>&2
            # lack a \n
            echo ""
        else 
            echo "srt record not complete, sub record index $m != 3, fatal error!" 1>&2
            exit 1
        fi
    fi

    # first parse the last end time after added with base time
    tmp=$(echo "${val}" | awk -F':|,' '{print "hour2="$1/1";min2="$2/1";sec2="$3/1";msec2="$4/1";"}')
    eval "${tmp}"

    # add timespan milli-seconds into end time..
    val=$(time_add "${hour2}" "${min2}" "${sec2}" "${msec2}" "0" "0" "0" "${time_span}")

    # 00:01:02,003 after break:
    #  1  2  3  4  
    tmp=$(echo "${val}" | awk -F':|,' '{print "hour1="$1/1";min1="$2/1";sec1="$3/1";msec1="$4/1";"}')
    eval "${tmp}"

    CONCATE_RESULT="start_hour=${hour1};start_min=${min1};start_sec=${sec1};start_msec=${msec1};start_ord=${curr_ord};"
}

# @brief: srt main
# @param: srt files...
# @retval: 0 - success
# @retval: 1 - error
function main()
{
    local timespan=1000  # unit in msec
    while getopts "t:" opt
    do
        case ${opt} in
            t)
                timespan=${OPTARG}
                # debug log goes to stderr
                echo "timespan between file is: ${timespan} ms" 1>&2
                ;;
            ?)
                echo "unknown option at ${OPTIND}"
                usage
                exit 1
                ;;
        esac
    done

    # after shift, file1/file2.. can access by $1/$2 directly..
    shift $(($OPTIND-1))
    if [ $# -lt 1 ]; then 
        usage
        exit 1
    fi

    local start_hour=0
    local start_min=0
    local start_sec=0
    local start_msec=0
    local start_ord=0
    local res=""
    for arg in "$@"
    do
        # debug log goes to stderr
        echo "handle file ${arg}" 1>&2
        concate_file "${start_hour}" "${start_min}" "${start_sec}" "${start_msec}" "${timespan}" "${start_ord}" "${arg}"
        # return: start_sec=xxx;start_msec=xxx;start_ord=xxx
        # echo "${CONCATE_RESULT}" 1>&2
        eval "${CONCATE_RESULT}"
        # debug log goes to stderr
        echo "last time: ${start_hour}:${start_min}:${start_sec},${start_msec}; last ord: ${start_ord}" 1>&2
    done
}

main "$@"
