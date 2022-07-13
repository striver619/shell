#!/bin/bash

# [refer](https://blog.csdn.net/frdevolcqzyxynjds/article/details/119770171)

ps -ef|grep -v "grep"|grep "StrictHostKeyChecking"|awk '{print $2}'|xargs kill -9
ssh -o StrictHostKeyChecking=no -o ExitOnForwardFailure=yes -o TCPKeepAlive=yes -Nf -R 6666:localhost:22 account@public_IP -p 2222
