#!/bin/bash

# to fix no rsync env, by scp replace it

hosts=(
hostname1
hostname2
hostname3
)

for host in ${hosts[@]}
do
    echo "-------- $host --------"
    scp $1 $host:$2
    echo ""
done
