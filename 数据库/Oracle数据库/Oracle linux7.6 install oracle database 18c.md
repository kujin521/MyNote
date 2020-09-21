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

切换到虚拟机页面 打开终端

```bash
. .bash_profile
echo $ORALCE_HOME
```

下载linux压缩包 unzip 解压

log in as oracle

go to ORACLE_HOME directory
and run ./runInstaller

after software is install
run 

```
dbca 
```

to create database.

