#!/bin/bash

seq 253 > host.txt
sed -i 's/^/192.168.1./g' host.txt
sed -i 's/$/  root  123456/g' host.txt
#cat host.txt
