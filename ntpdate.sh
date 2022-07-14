#!/bin/bash

pkgs()
{
    yum install ntpdate -y
}

synchro_time()
{
    ntpdate ntp.aliyun.com
}

main()
{
    pkgs
    synchro_time
}

main
