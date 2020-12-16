+Simple demonstration on how to install Oracle database 18c in Oracle Linux 7.6 64-bit OS.

Steps are given below:

# Step 1

Disable firewall and selinux
----------------------
Disable or configure the firewall to grant access to the server. use te following commands for OL 7.

```bash
systemctl status firewalld
service firewalld stop
service firewalld start
systemctl disable firewalld
systemctl enable firewalld
```

```bash
vi /etc/selinux/config
```

```bash
SELINUX=disabled
```

**配置host文件**

```bash
vi /etc/hosts
# 你的IP地址
192.168.21.129 testlab.com.bd testlab
```

# Step 2

create OS group and user
-----------------------
```bash
groupadd -g 1100 oinstall
groupadd -g 1131 dba
groupadd -g 1132 oper
useradd -u 1101 -g oinstall -G dba,oper oracle

passwd oracle
```

=========================
create directories
-------------------------
```bash
mkdir -p /u01/app/oracle/product/18.3.0/dbhome_1
chown -R oracle:oinstall /u01
chmod -R 775 /u01
```

run the following command from anywhere as root

```
yum install oracle-database-preinstall-18c.x86_64
```

#----------------------------
# 切换用户
#----------------------------

```
su oracle
```

```
cd ~
vi .bash_profile
```

```
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
ORACLE_HOSTNAME=testlab.com.bd; export ORACLE_HOSTNAME
ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/18.3.0/dbhome_1; export ORACLE_HOME
ORACLE_SID=orcl; export ORACLE_SID
ORACLE_UNQNAME=orcl; export ORACLE_UNQNAME
ORACLE_TERM=xterm; export ORACLE_TERM
BASE_PATH=/usr/sbin:$PATH; export BASE_PATH
PATH=$ORACLE_HOME/bin:$GRID_HOME/bin:$BASE_PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
```

**切换到虚拟机页面 打开终端**

```bash
. .bash_profile
echo $ORALCE_HOME
```

**下载linux压缩包 unzip 解压**

log in as oracle

go to ORACLE_HOME directory
and run ./runInstaller



# 创建创建数据库

**创建数据库实例,如果提示/etc/oratab 没有权限 或没有该文件时 解决方式**

> 这个文件是在创建数据库实例时建立的，需要用root用户运行root.sh，如果忘记运行在自启动和关闭时会失败，错误信息："/etc/oratab" is not accessible。

```
su root
. .bash_profile
echo $ORACLE_HOME
cd $ORACLE_HOME
sh root.sh
# 1. 默认回车 2. yes 生成自动
```

![image-20200922093902998](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922095250.png)

after software is install
run 

```
dbca 
```

to create database.

![image-20200922095110940](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922095242.png)

# 创建监听程序

命令: netca

如果出现监听端口 被占用 可能是 hosts文件没配好

```bash
vi /etc/hosts
# 你的IP地址
192.168.21.129 testlab.com.bd testlab
```

**进入sqlplus**

```bash
sqlplus / as sysdba
```

