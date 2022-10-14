#!/bin/bash

pkgs()
{
    yum install ntpdate -y 
}

synchronize_time()
{
    ntpdate ntp.aliyun.com
}

main()
{
    pkgs
    synchronize_time
}

main
