#!/bin/bash
file='links'

i=1
while read line; do

#Reading each line
#echo "Line No. $i : $line"

IFS='/' # space is set as delimiter
read -ra ADDR <<< "$line" # str is read into an array as tokens separated by IFS
x=0
for l in "${ADDR[@]}"; do # access each element of array
   x=$((x+1))
    #echo "$l"
    if [ $x -eq 7 ]; then
        echo "DIRECTORY: ${ADDR[7]}"
        echo "Line No. $i : $line"
        mkdir "/home/ec2-user/test-dir/aws-agent.us-east-1/linux/latest/${ADDR[7]}"
        cd "/home/ec2-user/test-dir/aws-agent.us-east-1/linux/latest/${ADDR[7]}"
        wget "$line"
        cd ~
    fi
    if [ $x -eq 8 ]; then
        echo "PACKAGE: ${ADDR[8]}"
    fi

done



i=$((i+1))
done < $file
