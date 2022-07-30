# $HOME/.ssh/config

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

Host t4
  Hostname 192.168.20.104
  Port 22
  User test4
```

chmod 600 $HOME/.ssh/config

ssh t2
ssh t3
ssh t4
