#! /bin/sh

line="00:01:02,003 --> 04:05:06,007"
old_ifs="${IFS}"
IFS=":, "
arr=(${line})
IFS="${old_ifs}"

echo "arr[0]=${arr[0]}"
for var in "${arr[@]}"
do
    echo "${var}"
done
