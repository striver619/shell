#!/bin/bash

df -hT
lsblk
fdisk /dev/sdb
n
w
lsblk
parted -l
partprobe
pvs
pvcreate /dev/sdb1
vgs
vgcreate vg_data_1 /dev/sdb1
lvs
lvcreate -l +100%FREE -n lv_bigdata_1 vg_data_1
mkfs.xfs /dev/vg_data_1/lv_data_1
mkdir /data1
echo "`blkid|grep 'vg_data_1' |awk '{print $2}'`    /data1    xfs    defaults    1    1" >> /etc/fstab
mount -a
lsblk
