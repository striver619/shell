#!/bin/bash

# IP
a=($(cat ./hosts|awk '{print $1}'))
# hostname
b=($(cat ./hosts|awk '{print $2}'))
# array number
num=${#a[@]}
# yaml
yml="./monitor.yml"

for(( i=0; i<num; i++ ))
do

# - targets: ['10.0.0.10:9100']
#   labels:
#     nodename: test-01

    echo "- targets: ['${a[$i]}:9100']" >> ${yml}
    echo "  labels:" >> ${yml}
    echo "    nodename: ${b[$i]}" >> ${yml}
    echo >> ${yml}

done

