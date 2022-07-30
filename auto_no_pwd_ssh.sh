# refer
# https://blog.csdn.net/piaoranyuji/article/details/109600245
# https://www.cnblogs.com/archoncap/p/6134922.html

# 1. first install deps
# yum install expect tcl-devel -y

# 2. second generate public key
# ssh-keygen -t rsa

# 3. edit auto_ssh.sh
# vim auto_ssh.sh

#!/usr/bin/expect

set -e

set timeout 10  
set username [lindex $argv 0]  
set password [lindex $argv 1]  
set hostname [lindex $argv 2]  

spawn ssh-copy-id -i /home/test/.ssh/id_rsa.pub $username@$hostname

expect {
            #first connect, no public key in ~/.ssh/known_hosts
            "Are you sure you want to continue connecting (yes/no)?" {
            send "yes\r"
            expect "password:"
                send "$password\r"
            }
            #already has public key in ~/.ssh/known_hosts
            "password:" {
                send "$password\r"
            }
            "Now try logging into the machine" {
                #it has authorized, do nothing!
            }
        }
expect eof

# 4. 加可执行权限
# chmod 777 auto_ssh.sh

# 5. 编辑批量脚本

# vim a.sh

#!/bin/bash

./auto_ssh.sh test 123456 192.168.20.102
./auto_ssh.sh test3 123456 192.168.20.103
./auto_ssh.sh test4 123456 192.168.20.104

# 6. 配置 $HOME/.ssh/config

vim $HOME/.ssh/config

Host t2
  Hostname 192.168.20.102
  Port 22
  User test

Host t3
  Hostname 192.168.20.103
  Port 22
  User test3

Host t4
  Hostname 192.168.20.104
  Port 22
  User test4

# 7. 授权 $HOME/.ssh/config 文件 600 权限

chmod 600 $HOME/.ssh/config

# no passwd ssh
ssh t2
ssh t3
ssh t4
