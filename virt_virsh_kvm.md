
```shell
# 在CentOS7搭建KVM虚拟化平台 https://www.h5w3.com/226765.html

# 使用命令行模式创建虚拟机

# 1、使用qemu-img命令可以创建磁盘文件

# 创建一个raw格式的磁盘文件
[root@localhost ~]# qemu-img create /kvm/vfs/vm1.raw 20G
# 转换磁盘格式为qcow2
[root@localhost ~]# qemu-img convert -f raw -O qcow2 /kvm/vfs/vm1.raw /kvm/vfs/vm1.qcow2

# 直接创建一个qcow2格式的磁盘文件
[root@localhost ~]# qemu-img create -f qcow2 /kvm/vfs/vm1.qcow2 20G
```

```shell
# 2、使用virt-install命令创建虚拟机
```

```shell
通用选项:
    -n NAME, --name=NAME  虚拟机名称
    -r MEMORY, --ram=MEMORY  以MB为单位为客户端事件分配的内存
    --vcpus=VCPUS       配置虚拟机的虚拟CPU(vcpu)数量，如：
                        --vcpus 5
                        --vcpus 5, maxcpus=10
                        --vcpus socket=2,cores=4,threads=2
    --cpuset=CPUSET     Set which physical CPUs domain can use.
    --cpu=CPU           CPU型号及功能，如：--cpu coreduo,+x2apic
    --description=DESCRIPTION  在生成的XML中保存的可读VM描述。
    --security=SECURITY      设定域安全驱动器配置。
    --numatune=NUMATUNE       为域进程调整NUMA策略。

安装方法选项:
    -c CDROM, --cdrom=CDROM   光驱安装介质
    -l LOCATION, --location=LOCATION  安装源(例如：nfs:host:/path、http://host/path、ftp://host/path)
    --pxe              使用 PXE 协议从网络引导
    --import            在磁盘映像中构建客户机
    --livecd            将光驱介质视为 Live CD
    -x EXTRA, --extra-args=EXTRA  附加到使用--location引导的内核的参数
    --os-type=DISTRO_TYPE  操作系统类型，'linux'、'unix'、'windows'
    --os-variant=DISTRO_VARIANT  操作系统版本，如： 'fedora6','rhel5', 'solaris10', 'win2k'
    --boot=BOOTOPTS     自选配置后安装引导顺序、菜单、永久kernel引导，等等。

存储配置:
    --disk=DISKOPTS     用各种选项指定存储。 Ex.
    --disk path=/my/existing/disk
    --disk path=/my/new/disk,format=qcow2,size=5,sparse (单位GB)
    --disk vol=poolname:volname,device=cdrom,bus=scsi,...
    --nodisks           不要为该客户端设置任何磁盘。
    --filesystem=FILESYSTEMS
      将主机目录传递给虚拟机。例如：
      --filesystem /my/source/dir,/dir/in/guest
       --filesystem template_name,/,type=template

联网配置:
    -w NETWORK, --network=NETWORK
    配置客户网络接口。 Ex:
     --network bridge=mybr0
     --network network=my_libvirt_virtual_net
     --network network=mynet,model=virtio,mac=00:11...
      --nonetworks    不要为该客体创建网络接口。

图形配置:
    --graphics=GRAPHICS
       配置虚拟机显示设置。例如：
   --graphics vnc
   --graphics spice,port=5901,tlsport=5902
   --graphics none
    --graphics vnc,password=foobar,port=5910,keymap=ja
   --noautoconsole     不要自动尝试连接到客户端控制台

设备选项:
    --serial=SERIALS    配置虚拟机串口设备
    --parallel=PARALLELS   配置虚拟机并口设备
    --channel=CHANNELS    配置虚拟机沟通频道
    --console=CONSOLES    配置虚拟机与主机之间的文本控制台连接
    --host-device=HOSTDEVS    配置与客户相连的物理主机设备
    --soundhw=SOUNDHW      配置客户声音设备仿真
    --watchdog=WATCHDOG  配置虚拟机 watchdog 设备
    --video=VIDEO        配置虚拟机视频硬件。
    --smartcard=SMARTCARD   配置虚拟机智能卡设备。

例如：--smartcard mode=passthrough
    --redirdev=REDIRDEV Configure a guest redirection device.
   例如:--redirdev usb,type=tcp,server=192.168.1.1:4000

虚拟化平台选项:
    -v, --hvm          客户端应该是一个全虚拟客户端
    -p, --paravirt        这个客户端是一个半虚拟客户端
    --container         This guest should be a container guest
    --virt-type=HV_TYPE     要使用的管理程序名称(kvm、qemu、xen)
    --arch=ARCH          模拟的 CPU 构架
    --machine=MACHINE   The machine type to emulate
    --noacpi   为全虚拟客户端禁用 ACPI(在 os-type/os-variant db 中覆盖数值)
    -u UUID, --uuid=UUID    客户端 UUID。

其它选项:
    --autostart            引导主机时自动启动域。
    --print-xml          输出所生成域的XML，而不是定义虚拟机。
    --print-step=XMLSTEP       输出具体安装步骤
    --noreboot            完成安装后不要引导虚拟机。
    --wait=WAIT           要等待的时间(以分钟为单位)
    --dry-run         完成安装步骤，但不要创建设备或者定义虚拟机。
    --force        对任意应用程序提示强制回答‘yes'，终止其它提示
    -q, --quiet             禁止无错误输出
    --prompt              要求用户为模糊情况或者需要的选项输入
    -d, --debug             输入故障排除信息
```

```shell
# 3、使用纯命令行安装虚拟机

[root@localhost ~]# qemu-img create -f qcow2 /kvm/vfs/vm2.qcow2 20G

[root@localhost ~]# virt-install -n vm2 \   定义虚拟机名
> -r 1024 \         内存大小
> --vcpus 1 \       CPU数量
> -l /kvm/iso/Centos7.iso \      ISO位置
> --disk path=/kvm/vfs/vm2.qcow2,format=qcow2 \      磁盘文件位置及格式
> --nographics \            不用图形化安装
> -x console=ttyS0          允许使用console终端登录虚拟机

# 执行命令，进行操作系统的安装，根据需要调整以下的配置参数
# 字符界面安装
```

```shell
# 虚拟机管理常用参数
virsh list                                # 获取当前主机所有虚拟机
virsh domstate <ID or Name or UUID>       # 获取虚拟机运行状态
virsh dominfo <ID or Name or UUID>        # 获取虚拟机基本信息
virsh domid <Name or UUID>                # 根据虚拟机名称或UUID获取ID
virsh domname <ID or UUID>                # 根据虚拟机ID或UUID获取名称
virsh dommemstat <ID or Name or UUID>     # 获取虚拟机内存使用情况
virsh setmem <ID or Name or UUID>         # 设置虚拟机内存大小，值不能超过最大分配内存，否则需要关闭虚拟机后设置   
virsh vcpuinfo <ID or Name or UUID>       # 获取vCPU基本信息
virsh vcpupin <ID or Name or UUID> <vCPU> <pCPU> # 将一个vCPU 绑定到物理CPU
virsh setvcpus <ID or Name or UUID> <vCPU num> # 设置虚拟机vCPU 个数
virsh vncdisplay <ID or Name or UUID> # 获取虚拟机的VNC连接参数
virsh create <dom.xml>                    # 根据XML文件创建虚拟机
virsh define <dom.xml>                    # 根据XML文件定义虚拟机，但不启动
virsh start <ID or Name or UUID>          # 启动(预定义的)虚拟机
virsh suspend <ID or Name or UUID>        # 暂停虚拟机
virsh resume <ID or Name or UUID>         # 唤醒虚拟机
virsh shutdown <ID or Name or UUID>       # 关闭虚拟机
virsh reboot <ID or Name or UUID>         # 重启虚拟机
virsh reset  <ID or Name or UUID>         # 强制重启虚拟机
virsh destory <ID or Name or UUID>        # 销毁虚拟机
virsh save <ID> <file.img>                # 保存运行中的虚拟机到一个文件
virsh migrate <ID or Name or UUID> <dst url> # 迁移虚拟机
virsh dump <ID or Name or UUID> <core.file> #coredump保存虚拟机到文件
virsh dumpxml <ID or Name or UUID>        # 输出虚拟机配置
virsh attach-device <ID or Name or UUID> <device.xml> # 添加设备
virsh detach-device <ID or Name or UUID> <device.xml> # 移除设备
virsh console <ID or Name or UUID>        # 连接到虚拟机 
virsh autostart <ID or Name or UUID>      # 设置虚拟机自动启动
virsh auotstart --disable <ID or Name or UUID>      # 取消虚拟机自动启动

# 宿主机和hypervisor管理参数
virsh version                          # 获取libvirt 和hypervisor版本信息
virsh sysinfo                          # 获取宿主机系统信息
virsh nodeinfo                         # 获取宿主机CPU，内存，核数等信息
virsh uri                              # 显示当前连接对象
virsh connect                          # 连接到指定对象
virsh hostname                         # 获取宿主机主机名
virsh capabilities                     # 获取宿主机和虚拟机的架构及特性
virsh freecell                         #  显示当前MUMA单元空闲内存
virsh nodememstats                     # 获取宿主机内存使用情况
virsh nodecpustats                     # 获取宿主机CPU使用情况
virsh qemu-attach                      # 根据PID添加一个QEMU进程到libvirt中
virsh qemu-monitor-command domain [--hmp] command     # 向QEMU monitor发送一个命令

# 宿主机网络及虚拟网络管理参数
virsh iface-list                                 # 获取宿主机网络接口列表
virsh iface-mac <iface name>                     # 获取网络接口mac地址
virsh iface-name <mac>                           # 获取网络接口名称
virsh iface-edit <iface name of uuid>            # 编辑网络接口XML配置文件
virsh iface-dumpxml <iface name of uuid>         # 输出网络接口XML配置
virsh iface-destory <iface name of uuid>         # 关闭网络接口
virsh net-list                                   # 获取libvirt管理的虚拟网络
virsh net-info <net name or uuid>                # 获取虚拟网络基本信息
virsh net-uuid <net name>                        # 获取虚拟网络UUID
virsh net-name <net uuid>                        # 获取虚拟网络名称
virsh net-create <net.xml>                       # 根据XML配置文件创建虚拟网络
virsh net-edit <net name or uuid>                # 编辑虚拟网络信息
virsh net-dumpxml  <net name or uuid>            # 输出虚拟网络XML配置
virsh net-destory <net name or uuid>             # 删除虚拟网络

# 存储池和存储卷管理参数
virsh pool-list                              # 获取libvirt管理的存储池
virsh pool-info <pool name>                  # 获取存储池信息
virsh pool-uuid <pool name>                  # 获取储存池UUID
virsh pool-create <pool.xml>                 # 根据XML配置文件创建存储池
virsh pool-edit <pool name or uuid>          # 编辑存储池配置
virsh pool-destory <pool name or uuid>       # 关闭存储池
virsh pool-delete <pool name or uuid>        # 删除存储池
virsh vol-list <pool name or uuid>           # 获取某个存储池的卷列表
virsh vol-name <vol key or path>             # 获取存储卷名称
virsh vol-path --pool <pool name or uuid> <vol name or key> # 获取存储卷路径
virsh vol-create <vol.xml>                   #  根据XML配置创建存储池
virsh vol-clone <vol name path> <name>       # 克隆存储卷
virsh vol-delete <vol name or key or path>   # 删除存储卷

# 其他常用参数
virsh pwd                            #  获取当前路径
virsh cd <dir>                       # 进入某个路径
virsh echo <param>                   # 输出param
virsh quit                           # 退出交互
virsh exit                           # 退出交互

# kvm虚拟机利用virsh查看ip
# 1、virsh list 查看虚拟机
# 2、virsh dumpxml c75 | grep mac #查看c75虚拟机mac
# 3、arp -a #显示mac与ip对应关系


# 在centos7上kvm网卡桥接 https://www.shuzhiduo.com/A/1O5EjK6nd7/

```
