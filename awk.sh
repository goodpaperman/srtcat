#! /bin/sh

line="00:01:02,003 --> 04:05:06,007"
# val=$(echo "${line}" | awk -F':|,| ' '{ for (i=1; i<=NF; i++) { print $i }}')
val=$(echo "${line}" | awk -F':|,| ' '{print "hour1="$1/1";min1="$2/1";sec1="$3/1";msec1="$4/1";hour2="$6/1";min2="$7/1";sec2="$8/1";msec2="$9/1";"}')  
echo "${val}"
eval "${val}"
echo "${hour1}:${min1}:${sec1},${msec1}"
echo "${hour2}:${min2}:${sec2},${msec2}"
