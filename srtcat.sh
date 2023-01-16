#! /bin/sh

function usage()
{
    echo "Usage: srtcat [-t seprate] file1 file2 ..."
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
    if [ ${ms3} -gt 1000 ]; then 
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
    # return "curr_hour=${h3};curr_min=${m3};curr_sec=${s3};curr_msec=${ms3}"
    echo "${h3}:${m3}:${s3},${ms3}"
}

# @brief: srt single file concating, dumping to stdin
# @param: start hour
# @param: start min
# @param: start sec
# @param: start msec
# @param: time separate between file (in sec)
# @param: start ordinal, 0 means first file
# @param: srt file
# @return: new time & new ordinal
function concate_file()
{
    local start_hour=$1
    local start_min=$2
    local start_sec=$3
    local start_msec=$4
    local separate=$5
    local start_ord=$6
    local file=$7
    local curr_ord=0
    local curr_hour=0
    local curr_min=0
    local curr_sec=0
    local curr_msec=0
    local curr_srt=""
    local line=""
    local n=0 
    local m=0
    local val=""
    local tmp=""

    while read line; do
        m=$((n%4))
        # case $m in
        #    0)
        if [ $m -eq 0 ]; then
                # ordinal
                curr_ord=$((${line}+${start_ord}))
                echo "${curr_ord}"
                #;;
        elif [ $m -eq 1 ]; then 
        #    1)
                # time range
                #    start time
                curr_hour=$(echo "${line}" | cut -b 1-2)
                curr_min=$(echo "${line}" | cut -b 4-5)
                curr_sec=$(echo "${line}" | cut -b 7-8)
                curr_msec=$(echo "${line}" | cut -b 10-12)
                val=$(time_add "${curr_hour}" "${curr_min}" "${curr_sec}" "${curr_msec}" "${start_hour}" "${start_min}" "${start_sec}" "${start_msec}")
                # eval "${val}"
                # tmp="${curr_hour}:${curr_min}:${curr_sec},${curr_msec} ---> "
                tmp="${val}"
                #    end time
                curr_hour=$(echo "${line}" | cut -b 1-2)
                curr_min=$(echo "${line}" | cut -b 4-5)
                curr_sec=$(echo "${line}" | cut -b 7-8)
                curr_msec=$(echo "${line}" | cut -b 10-12)
                val=$(time_add "${curr_hour}" "${curr_min}" "${curr_sec}" "${curr_msec}" "${start_hour}" "${start_min}" "${start_sec}" "${start_msec}")
                # eval "${val}"
                # tmp="${tmp}${curr_hour}:${curr_min}:${curr_sec},${curr_msec}"
                tmp="${tmp} ---> ${val}"
                echo "${tmp}"
                #;;
        #     2)
        elif [ $m -eq 2 ]; then 
                # srt
                echo "${line}"
                #;;
        elif [ $m -eq 3 ]; then 
        #     3)
                # empty line
                if [ -n ${line} ]; then 
                    echo "should be empty line, fatal error!"
                    exit 1
                fi
                #;;
        else
        #    *)
                echo "invalid result: $m, fatal error!"
                exit 1
                #;;
        fi
        #esac
        n=$((n+1))
    done < ${file}

    # add separate seconds into time..
    val=$(time_add "${curr_hour}" "${curr_min}" "${curr_sec}" "${curr_msec}" "0" "0" "${separate}" "0")
    curr_hour=$(echo "${val}" | cut -b 1-2)
    curr_min=$(echo "${val}" | cut -b 4-5)
    curr_sec=$(echo "${val}" | cut -b 7-8)
    curr_msec=$(echo "${val}" | cut -b 10-12)
    echo "start_hour=${current_hour};start_min=${current_min};start_sec=${curr_sec};start_msec=${curr_msec};start_ord=${curr_ord};"
}

# @brief: srt main
# @param: srt files...
# @retval: 0 - success
# @retval: 1 - error
function main()
{
    local separate=1  # unit in sec
    while getopts "t:" opt
    do
        case ${opt} in
            t)
                separate=${OPTARG}
                # debug log goes to stderr
                echo "time separate between file is: ${separate} s" 1>&2
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
        res=$(concate_file "${start_hour}" "${start_min}" "${start_sec}" "${start_msec}" "${separate}" "${start_ord}" "${arg}")
        # return: start_sec=xxx;start_msec=xxx;start_ord=xxx
        eval "${res}"
        # debug log goes to stderr
        echo "last time: ${start_hour}:${start_min}:${start_sec},${start_msec}; last ord: ${start_ord}" 1>&2
    done
}

main "$@"
