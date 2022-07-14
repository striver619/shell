#!/bin/bash

cst()
{
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
}

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
    cst
    pkgs
    synchro_time
}

main
