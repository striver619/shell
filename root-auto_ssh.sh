#!/usr/bin/expect  

# vim auto_ssh.sh
# yum install expect tcl-devel
# https://blog.csdn.net/piaoranyuji/article/details/109600245
# source code
# https://www.cnblogs.com/archoncap/p/6134922.html

# first
# ssh-keygen -t rsa

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



# usage:
# chmod 777 root-auto_ssh.sh
# 然后执行下述命令即可。
# ./auto_ssh.sh test 123456 192.168.0.6
