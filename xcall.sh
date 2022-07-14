#!/bin/bash

hosts=(
host01
host02
host03
)

for host in ${hosts[@]}
do
        echo "--------$host--------"
        ssh $host "$*"
done
