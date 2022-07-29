#!/bin/bash

# cat hosts
#hadoop102
#hadoop103
#hadoop104

hosts=( $(cat $HOME/bin/hosts) )

for host in ${hosts[@]}
do
        echo "--------$host--------"
        ssh $host "$*"
done
