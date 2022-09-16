## before

```
[root@e22ff4b45bfa ~]# date
Fri Sep 16 00:59:27 UTC 2022
[root@e22ff4b45bfa ~]#
[root@e22ff4b45bfa ~]# ls -l /etc/localtime
lrwxrwxrwx 1 root root 25 Nov 13  2020 /etc/localtime -> ../usr/share/zoneinfo/UTC
[root@e22ff4b45bfa ~]#
```

## modify

```
[root@e22ff4b45bfa ~]# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
[root@e22ff4b45bfa ~]# ls -l /etc/localtime
lrwxrwxrwx 1 root root 33 Sep 16 09:01 /etc/localtime -> /usr/share/zoneinfo/Asia/Shanghai
[root@e22ff4b45bfa ~]#
```

## after

```
[root@e22ff4b45bfa ~]# date
Fri Sep 16 09:01:30 CST 2022
[root@e22ff4b45bfa ~]#
```
