## 一、安装Oracle 12c

### 1、安装CentOS 7操作系统的注意事项

由于本次安装Oracle 12c软件是在CentOS 7系统上实现的，那么首先安装CentOS 7操作系统，安装要求如下：

> - 防火墙的配置选项设置为禁用；
> - SELinux设置为禁用；
> - 默认安装设置为软件开发；
> - 内核选择3.10.0-862.el7.x86_64及以上版本；

### 2、前置条件的准备

Oracle数据库是一个相对庞大的应用软件，对[服务器](https://www.yisu.com/)的系统类型、内存和交换分区、硬盘空阿金、内核参数、软件环境、用户环境等都有相应的要求。只要满足了这些必备的条件，才能确保Oracle 12c安装成功、稳定运行。

#### 1）系统及配置要求

Oracle 12c明确支持的Linux操作系统包括Oracle Linux 7、Oracle Linux 6、Oracle Linux 5、Red Hat Enterprise Linux 7、Red Hat Enterprise Linux 6、Red Hat Enterprise Linux 5等，因为Red Hat Enterprise 和CentOS属于同步并行的操作系统，所以Oracle 12 c同样支持CentOS 7、CentOS 6、CentOS 5操作系统。在其他Linux系统中安装时，个别软件或配置文件可能需要进行适当的调整。通过以下命令查看系统版本：

```
[root@Oracle ~]# cat /etc/centos-release
CentOS Linux release 7.4.1708 (Core) 
```

> Linux操作系统要求：
>
> - 物理内存：必须高于1GB，对于VMware虚拟机建议不少于2GB；
> - 交换空间：物理内存为1~2GB时，交换分区为物理内存的1.5~2倍；物理内存为2~16GB时，交换分区于物理内存大小相同；物理内存超过16GB时，交换分区使用16GB就可以了；
>   如果交换分区空间不足的话，可以使用以下方式扩展交换分区

**查看物理内存和交换内存的命令如下：**

```
[root@Oracle ~]# grep MemTotal /proc/meminfo 
MemTotal:        4030172 kB
[root@Oracle ~]# grep SwapTotal /proc/meminfo 
SwapTotal:       8388604 kB
```

对于Oracle 12c数据库，若程序文件和数据文件安装在同一分区，则该分区硬盘空间的最小要求为企业级为6.4GB，标准版6.1GB；除此之外，还应确保/tmp目录的可用空间不少于1G。总的来说，建议为Oracle 12c准备至少15GB的硬盘空间。通过以下命令查看磁盘空间的使用情况：

```
[root@Oracle ~]# df -hT
文件系统                类型      容量  已用  可用 已用% 挂载点
/dev/mapper/centos-root xfs        72G   21G   51G   30% /
devtmpfs                devtmpfs  2.0G     0  2.0G    0% /dev
tmpfs                   tmpfs     2.0G  960M 1008M   49% /dev/shm
tmpfs                   tmpfs     2.0G  9.0M  2.0G    1% /run
tmpfs                   tmpfs     2.0G     0  2.0G    0% /sys/fs/cgroup
/dev/sda1               xfs       197M  139M   59M   71% /boot
tmpfs                   tmpfs     394M   12K  394M    1% /run/user/42
tmpfs                   tmpfs     394M     0  394M    0% /run/user/0
/dev/sr0                iso9660   4.3G  4.3G     0  100% /mnt
```

安装Oracle数据库前，要求规划好主机名和IP。服务器的主机名、IP地址应提前确认无误，一旦Oracle数据库安装完成，建议不要再修改主机名，否则会导致数据库启动失败。查看主机名可以通过hostname命令实现，修改主机名通过配置文件/etc/hosts实现，代码如下：

```
[root@centos01 ~]# hostnamectl set-hostname Oracle  <!--修改主机名-->
[root@centos01 ~]# bash   <!--刷新主机名-->
[root@oracle ~]# hostname  <!--查看主机名-->
oracle
[root@Oracle ~]# vim /etc/hosts   <!--配置主机解析-->
192.168.100.10 oracle
```

#### 2）软件环境要求

Oracle 12c的安装过程通常是在图形界面中进行，因此建议使用已安装有GNOME中文桌面环境的CentOS服务器，软件开发工具当然是必不可少的，如gcc、glibc、binutils等软件包，建议使用yum工具来安装以下必要的软件环境。具体操作如下：

```
[root@Oracle ~]# yum -y install binutils elfutils-libelf elfutils-libelf-devel gcc gcc-c++ glibc glibc-common glibc-devel glibc-headers kernel-headers ksh libaio libaio-devel libgcc libgomp libstdc++ libstdc++-devel make numactl-devel unixODBC unixODBC-devel
```

yum仓库选择使用本地光盘即可，Oracle 12c自身集成了Java运行环境，但安装界面对中文的支持并不完善，因此若希望使用中文的Oracle安装界面，建议提前安装好Java软件包。

#### 3）内核要求

为了确保数据库运行稳定，Oracle 12c针对Linux内核参数，进程会话限制提出了一些要求，其中一部分设置可以在安装过程中自动检测并进行修复，但并一定很完整，所以最好的做法是根据安装文档提前进行配置。

内核参数调整体现在/etc/sysctl.conf文件中，主要包括与内存调度、端口范围、打开文件数、I/O请求等相关的一些设置，相关数值不可低于安装要求。修改完毕后通过执行如下的“sysctl -p”命令使新配置立即生效。

```
[root@Oracle ~]# vim /etc/sysctl.conf 
............      <!--此处省略部分内容-->
fs.file-max = 6815744
kernel.sem = 250 32000 100 128
kernel.shmmni = 4096
kernel.shmall = 1073741824
kernel.shmmax = 4398046511104
kernel.panic_on_oops = 1
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048576
net.ipv4.conf.all.rp_filter = 2
net.ipv4.conf.default.rp_filter = 2
fs.aio-max-nr = 1048576
net.ipv4.ip_local_port_range = 9000 65500
[root@Oracle ~]# sysctl -p   <!--重新加载配置文件-->
```

#### 4）Oracle用户环境要求

Oracle 12c需要固定的运行用户oracle、安装组oinstall、管理组dba，这些账号应提前创建好。用来存放Oracle程序及数据库文件的基本目录（如/u01/app/oracle）也应提前创建好。具体创建的命令如下：

```
[root@Oracle ~]# groupadd -g 54321 oinstall   <!--创建安装组-->
[root@Oracle ~]# groupadd -g 54322 dba   <!--创建管理oracle组-->
[root@Oracle ~]# useradd -u 54321 -g oinstall -G dba oracle  
         <!--创建管理oracle的用户，加入到组中 -->
[root@Oracle ~]# passwd oracle    <!--设置管理数据库密码-->
[root@Oracle ~]# mkdir -p /u01/app/oracle<!--创建数据库根目录-->
[root@Oracle ~]# chown -R oracle:oinstall /u01/app/ <!--设置目录所有者-->
[root@Oracle ~]# chmod -R 755 /u01/app/   <!--设置目录权限-->
```

Oracle 12c的安装任务应以运行用户oracle的身份执行，需适当调整oracle用户的环境配置以满足需求。具体操作如下：

```
[root@Oracle ~]# vim /home/oracle/.bash_profile 
............<!--此处省略部分内容-->
umask 022    <!--反码-->
ORACLE_BASE=/u01/app/oracle   <!--定义基本目录-->
ORACLE_HOME=/u01/app/oracle/product/12.2.0/dbhome_1/  <!--定义安装家目录-->
ORACLE_SID=orcl   <!--定义数据库实例名称-->
LANG=zh_CN.UTF-8   <!--确定使用何种语言环境-->
NLS_LANG="AMERICAN_AMERICA".ZHS16GBK 
PATH=$PATH:$ORACLE_HOME/bin
export ORACLE_BASE ORACLE_HOME ORACLE_SID LANG NLS_LANG PATH    <!--将变量导出为全局变量-->
[root@Oracle ~]# source /home/oracle/.bash_profile   <!--刷新配置-->
```

#### 5）oracle用户资源限制要求

进程会话限制可以采用pam_limits认证模块来实现，通过修改登录程序login的PAM设置以启用该认证，然后修改/etc/security/limits.conf 文件，使用户oracle能够打开的进程数、进程使用的文件数加大。具体操作如下：

```
[root@Oracle ~]# vim /etc/pam.d/login   <!--设置pam验证-->

session    required     /lib64/security/pam_limits.so
session    required     pam_limits.so
............<!--此处省略部分内容-->
[root@Oracle ~]# vim /etc/security/limits.conf   
                  <!--限制oracle数据库存储和进程使用-->
............<!--此处省略部分内容-->
oracle   soft   nofile    1024           <!--文件数软限制-->
oracle   hard   nofile    65536         <!--文件数硬限制-->
oracle   soft   nproc    16384           <!--进程数软限制-->
oracle   hard   nproc    16384          <!--进程数硬限制-->
oracle   soft   stack    10240              <!--Oracle软堆栈限制-->
[root@Oracle ~]# vim /etc/profile 
............<!--此处省略部分内容-->
              <!--添加如下内容-->
if [ $USER = "oracle"]; then
        if [$SHELLO = "/bin/ksh"]; then
        ulimit -p 16384
        ulimit n 65536
else
        ulimit -u 16384 -n 65536
fi
fi
```

不配置oracle用户资源限制部分，也不会影响oracle数据库的成功安装，但是，若有糟糕的SQL语句对服务器资源的无限占用，导致长时间对用户请求无响应，建议提前限制oracle用户资源。

准备工作完成后重新启动系统，重启之后，再次检查之前的配置是否生效。

### 3、Oracle 12c安装过程

Oracle的中文官方网址是https://www.oracle.com/index.html 可以自行进行下载，也可通过网盘自行提取：[https://pan.baidu.com/s/1VWFYZH0itXjXN-xt7hlD0A
提取码：9n84]进行安装。具体操作如下：

```
[root@Oracle oracle]# ls      <!--通过rz命令上传压缩包-->
linuxx64_12201_database.zip
[root@Oracle oracle]# unzip linuxx64_12201_database.zip 
                       <!--解压缩oracle包-->
[root@Oracle ~]# export DISPLAY=192.168.100.254:0.0  
                                  <!--配置界面显示到宿主机-->
[root@Oracle ~]# xhost +    <!--一定要以root用户的身份在图形环境中操作-->
```

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/967.jpg)

```
[root@Oracle ~]# su oracle   <!--切换到oracle账户-->
[oracle@Oracle root]$ cd
[oracle@Oracle ~]$ export DISPLAY=192.168.100.254:0.0  
[oracle@Oracle ~]$ xhost +
```

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/968.jpg)

```
[oracle@Oracle ~]$ /u01/app/oracle/database/runInstaller <!--安装oracle-->
正在启动 Oracle Universal Installer...
```

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/970.jpg)
**执行完成后过一会弹出图形化界面，进行以下操作：**

1）配置安全更新，什么也不选下一步即可
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/971.jpg)
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/972.jpg)

2）安装选项选择创建和配置数据库，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/973.jpg)

3）系统类选择服务器类，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/974.jpg)

4）数据库安装选项选择单实例数据库安装，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/975.jpg)

5）安装类型选择典型安装，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/976.jpg)

6）设置数据库口令，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/977.jpg)
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/978.jpg)

7）清单保持默认，单击下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/979.jpg)

8）默认下一步
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/980.jpg)

9）执行脚本
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/981.jpg)

```
[root@Oracle ~]# /u01/app/oraInventory/orainstRoot.sh
[root@Oracle ~]# /u01/app/oracle/product/12.2.0/dbhome_1/root.sh
```

10）安装完成，通过浏览器访问
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/982.jpg)

11）浏览器访问https://Oracle:5500/em 安装flash player
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/983.jpg)

12）验证安装结果，浏览器访问https://Oracle:5500/em
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/984.jpg)

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/985.jpg)

**接下来使用SQL*Plus命令在命令行界面中访问Oracle 12c数据库：**

```
[root@Oracle ~]# su oracle  <!--切换到oracle账户-->
[oracle@Oracle root]$ cd
[oracle@Oracle ~]$ source .bash_profile    <!--运行此项-->
[oracle@Oracle ~]$ sqlplus / as sysdba    <!--登录数据库-->
SQL> help index       <!--查看支持的指令列表-->
SQL> show user;        <!--查看当前用户-->
USER is "SYS"
```

**在SQL>模式下，不区分大小写，但是Linux提示符下区分大小写。**

## 二、Oracle 12c数据库的创建

如果在安装oracle产品时不创建数据库，那么要使用oracle系统就必须先创建数据库。如果在安装oracle时选择建立数据库，也可以再创建第二个数据库。
创建数据库的方法有两种：通过图形化界面，或者采用“CREATE DATABASE”命令，这里说一下图形化界面创建数据库的方法。

在Linux环境下，采用运行数据库配置助手（database configuration assistant, DBCA）来实现。Oracle 12c安装完成后，会在$ORACLE_HOME/bin目录下生成Oracle系统可执行程序，创建Oracle数据库所用的DBCA也在该目录下。

```
[oracle@Oracle ~]$ export DISPLAY=192.168.100.254:0.0
[oracle@Oracle ~]$ xhost +
```

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/986.jpg)

```
[oracle@Oracle ~]$  dbca   <!--以oracle用户身份运行dbca命令-->
```

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/987.jpg)

**弹出的图形化界面如下：**
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/988.jpg)

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/989.jpg)
![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/990.jpg)

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/991.jpg)

![CentOS 7部署Oracle 12c企业版数据库](https://cache.yisu.com/upload/information/20200214/37/992.jpg)
**数据库已经创建完成。为了使Oracle系统充分利用系统资源，建议一个服务器上只创建一个数据库。**

## 三、Oracle 12c数据库的启动与关闭

oracle数据库的启动与关闭是日常工作之一。对于大多数oracle DBA来说，启动和关闭oracle数据库最常用的方式是在命令行方式下执行。

### 1、启动、关闭Oracle数据库

要启动和关闭数据库，必须具有Oracle管理员权限的用户登录，通常以具有SYSDBA权限的用户登录。

#### 1）数据库的启动

启动（STARTUP）一个数据库需要三个步骤：①启动oracle实例（非装载阶段）；②由实例装载数据库（装载阶段）；③打开数据库（打开阶段）。
在STARTUP命令中，可以使用不同的选项来控制数据库的不同启动步骤。

##### ①STARTUP NOMOUNT

NOMOUNT选项仅仅启动一个oracle实例，读取init.ora初始化参数文件、启动后台进程、初始化SGA。当实例启动后，系统将显示一个SGA内存结构和大小的列表，具体操作如下：

```
SQL> startup nomount;       <!--启动数据库-->
ORACLE instance started.

Total System Global Area 1660944384 bytes
Fixed Size          8793448 bytes
Variable Size        1056965272 bytes
Database Buffers      587202560 bytes
Redo Buffers            7983104 bytes
SQL> alter database mount;      <!--装载数据库-->

Database altered.
SQL> alter database open;      <!--打开数据库-->

Database altered.
```

##### ②STARTUP MOUNT

STARTUP MOUNT命令启动实例并且装载数据库，但是没有打开数据库。Oracle系统读取控制文件中关于数据文件和重做日志文件的内容，但并不打开该文件。这种打开方式常在数据库维护操作中使用，如对数据文件的更名、改变重做日志及打开归档模式等。在这种打开方式下，除了可以看到SGA系统列表以外，系统还会给出“数据库装载完毕”的提示。具体操作如下：

```
SQL> startup mount;       <!--启动实例并且装载数据库-->
ORACLE instance started.

Total System Global Area 1660944384 bytes
Fixed Size          8793448 bytes
Variable Size        1056965272 bytes
Database Buffers      587202560 bytes
Redo Buffers            7983104 bytes
Database mounted.
SQL> alter database open;     <!--打开数据库-->

Database altered.
```

##### ③STARTUP

STARTUP命令完成启动实例，装载数据库和打开数据库三个步骤。此时，数据库使数据文件和重做日志文件在线，通常还会请求一个或者多个回滚段；系统除了可以看到前面STARTUP MOUNT方式下的所有提示外，还会给出一个“数据库已经打开”的提示；数据库系统处于正常的工作状态，可以接收用户的请求。

```
SQL> startup;   
<!--startup命令实现了启动实例，装载数据库，打开数据库，一条命令搞定-->
ORACLE instance started.

Total System Global Area 1660944384 bytes
Fixed Size          8793448 bytes
Variable Size        1056965272 bytes
Database Buffers      587202560 bytes
Redo Buffers            7983104 bytes
Database mounted.
Database opened.
```

如果采用STARTUP NOMOUNT或者STARTUP MOUNT的数据库打开方式，必须采用alter database命令来执行装载或打开数据库的操作。例如，如果以STARTUP NOMOUNT方式打开数据库，也就是说实例已经启动，但是数据库没有装载和打开。这时必须运行下面的两条命令，数据库才能正确启动。命令如下：

```
SQL> alter database mount;      <!--装载数据库-->
SQL> alter database open;      <!--打开数据库-->
```

如果以STARTUP MOUNT方式启动数据库，只需要运行下面一条命令即可以打开数据库：

```
SQL> alter database open;      <!--打开数据库-->
```

#### 2）数据库的关闭

对于数据库的关闭，有四种不同的关闭选项。

##### ①SHUTDOWN NORMAL

SHUTDOWN NORMAL是SHUTDOWN命令的默认选项。也就是说，如果用户发出SHUTDOWN命令，即执行SHUTDOWN NORMAL命令。
发出该命令后，任何新的连接都将不再允许连接到数据库。在数据库关闭之前，Oracle将等待目前连接的所有用户都从数据库中退出后才开始关闭数据库。采用这种方式关闭数据库，在下一次启动时不需要进行任何的实例恢复。但需要注意的是，采用这种方式时，也许关闭一个数据库需要几天或更长的时间。

```
SQL> shutdown;
Database closed.
Database dismounted.
ORACLE instance shut down.

SQL> shutdown normal;
Database closed.
Database dismounted.
ORACLE instance shut down.
```

##### ②SHUTDOWN IMMEDIATE

SHUTDOWN IMMEDIATE是常用的一种关闭数据库的方式。若即想很快地关闭数据库，又想让数据库“干净”的关闭，则常采用这种方式。
发出该命令后，当前正在被Oracle处理的SQL语句立即中断，系统中任何没有提交的事务全部回滚。如果系统中存在一个很长的未提交的事务，那么采用这种方式关闭数据库也需要一段时间（该事务回滚时间）。系统不会等待连接到数据库的所有用户退出系统，而会强行回滚当前所有的活动事务，然后断开所有的连接用户。

```
SQL> shutdown immediate;
Database closed.
Database dismounted.
ORACLE instance shut down.
```

##### ③SHUTDOWN TRANSACTIONAL

SHUTDOWN TRANSACTIONAL命令常用来计划关闭数据库，它会等待当前连接到系统且正在活动的事务执行完毕，运行该命令后，任何新的连接和事务都是不允许的。它所有活动的事务执行完成后，数据库将以和SHUTDOWN IMMEDIATE同样的方式关闭数据库。

```
SQL> shutdown transactional;
Database closed.
Database dismounted.
ORACLE instance shut down.
```

##### ④SHUTDOWN ABORT

SHUTDOWN ABORT是关闭数据库方式的最后选择，是在没有任何办法关闭数据库的情况下不得不采用的方式，一般不要采用。在下列情况出现时可以考虑采用这种方式关闭数据库。

```
SQL> shutdown abort;
ORACLE instance shut down.
```

> 数据库处于一种非正常工作状态，不能用SHUTDOWN NORMAL或SHUTDOWN IMMEDIATE命令关闭数据库；
>
> - 需要立即关闭数据库；
> - 在启动数据库实例时遇到问题。
>
> 发出该命令后，所有正在运行的SQL语句将立即中止，所有未提交的事务将不回滚，oracle也不等待目前连接到数据库的用户退出系统；下一次启动数据库时需要实例恢复，因此，下一次启动可能比平时需要更多的时间。
>
> 在关闭数据库时最好使用SHUTDOWN IMMEDIATE方式，因为这种方式安全且相对较快。不是万不得已不要使用SHUTDOWN ABORT 方式，因为这种方式会造成数据丢失，并且恢复数据库也需要较长时间。

### 2、启动、关闭Oracle监听进程

当oracle数据库实例启动完成后，为了使客户端用户能连接到oracle实例，DBA还需要在oracle所在的服务器上使用lsnrctl命令启动监听进程。如果数据库实例关闭，一般也要关闭监听进程。

#### 1）启动监听

启动（Start）监听是Oracle用户在操作系统下执行的命令，可以直接在lsnrctl后加参数，也可在该命令提示符后进行操作，具体操作如下：

```
[oracle@oracle ~]$ lsnrctl       <!--执行该命令-->

LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 06-JAN-2020 19:28:52

Copyright (c) 1991, 2016, Oracle.  All rights reserved.

Welcome to LSNRCTL, type "help" for information.

LSNRCTL> start           <!--启动监听-->
Starting /u01/app/oracle/product/12.2.0/dbhome_1//bin/tnslsnr: please wait...

TNSLSNR for Linux: Version 12.2.0.1.0 - Production
System parameter file is /u01/app/oracle/product/12.2.0/dbhome_1/network/admin/listener.ora
Log messages written to /u01/app/oracle/diag/tnslsnr/oracle/listener/alert/log.xml
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=oracle)(PORT=1521)))
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracle)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 12.2.0.1.0 - Production
Start Date                06-JAN-2020 19:28:54
Uptime                    0 days 0 hr. 0 min. 0 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /u01/app/oracle/product/12.2.0/dbhome_1/network/admin/listener.ora
Listener Log File         /u01/app/oracle/diag/tnslsnr/oracle/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=oracle)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
The listener supports no services
The command completed successfully
```

**也可以直接使用以下命令“来启动监听：**

```
[oracle@Oracle ~]$ lsnrctl start
```

#### 2）关闭监听

```
[oracle@oracle ~]$ lsnrctl stop

LSNRCTL for Linux: Version 12.2.0.1.0 - Production on 06-JAN-2020 19:33:04

Copyright (c) 1991, 2016, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=oracle)(PORT=1521)))
The command completed successfully
```

———————— 本文至此结束，感谢阅读 ————————