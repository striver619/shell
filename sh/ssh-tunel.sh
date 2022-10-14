#!/bin/bash

# [refer](https://blog.csdn.net/frdevolcqzyxynjds/article/details/119770171)

ps -ef|grep -v "grep"|grep "StrictHostKeyChecking"|awk '{print $2}'|xargs kill -9
ssh -o StrictHostKeyChecking=no -o ExitOnForwardFailure=yes -o TCPKeepAlive=yes -Nf -R 6666:localhost:22 account@public_IP -p 2222

# crontab 定时任务
# 每30分钟执行一次
# */30 * * * * /home/k8s/bin/sd.sh > /dev/null 2>&1 &
