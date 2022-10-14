# $HOME/.ssh/config

## 1. 编辑文件
vim $HOME/.ssh/config

```
Host t2
  Hostname 192.168.20.102
  Port 22
  User test

Host t3
  Hostname 192.168.20.103
  Port 22
  User test3
  # 私钥连接，需要提前授权私钥 600 权限
  IdentityFile $HOME/.ssh/103_private.key

```

## 2. 授权文件
chmod 600 $HOME/.ssh/config

## 3. 测试免密远程连接

ssh t2

ssh t3

