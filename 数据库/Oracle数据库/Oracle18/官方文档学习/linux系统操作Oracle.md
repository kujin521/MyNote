> 前提 : Oracle18c 	Oracle linux 7.5

## 1.管理Oracle数据库

### 环境变量

在安装 Oracle 数据库之前，必须定义一些环境变量。

- [Oracle 数据库环境变量](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/administering-oracle-database.html#GUID-B8418A24-2F0B-4394-9C6D-29A8CA1DFEEB)
- [Linux 和 UNIX 环境变量](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/administering-oracle-database.html#GUID-A64EDB4D-3EC7-473B-BB6A-9D6F9388D094)
- [设置公共环境](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/administering-oracle-database.html#GUID-A5FC7903-AA9D-4FAC-A151-A1C8DEB299DD)
- [设置系统时区](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/administering-oracle-database.html#GUID-C7E6FF3D-2F8C-4B38-8400-141BFB08FB3C)



## 2.停止和启动Oracle软件

### [**2.1**停止和启动 Oracle 流程](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/stopping-and-starting-oracle-software.html#GUID-1C09ED1C-B9A2-46D6-8936-78B5439BF7E4)

1. 查看实例SID和Oracle主目录

```shell
cat /etc/oratab
```

2. 运行oraenv或coraenv脚本

```shell
. /usr/local/bin/oraenv
```

出现提示时，请为 实例指定 。`SID`

3. 运行以下命令以启动/关闭实例：

```
sqlplus / as sysdba
#启动
startup
#关闭
SHUTDOWN NORMAL
```

### [**2.2**关于自动数据库关闭和启动](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/stopping-and-starting-oracle-software.html#GUID-1471DADF-6869-429F-AF5A-93FFA3DCE699)

参考博客 https://blog.csdn.net/Maikilee_sys/article/details/50493116

1. 修改oratab文件

```
vi /etc/oratab 
```

文件中的数据库条目以以下格式显示：将最后一个字段设置成Y 表示自动启动和关闭数据库

```s
ORACLE_SID:$ORACLE_HOME:<N|Y>
```

2. 创建名为`dbora 的文件`，然后将以下行复制到此文件中：

   ```
   #在此目录下创建
   cd /etc/init.d/
   ```

> 注意修改:
>
> ORA_HOME=/u01/app/oracle/product/18.3.0/dbhome_1/
> ORA_OWNER=oracle

```shell
#! /bin/sh
# description: Oracle auto start-stop script.
#
# Set ORA_HOME to be equivalent to the $ORACLE_HOME
# from which you wish to execute dbstart and dbshut;
#
# Set ORA_OWNER to the user id of the owner of the
# Oracle database in ORACLE_HOME.

ORA_HOME==/u01/app/oracle/product/18.3.0/dbhome_1/
ORA_OWNER=oracle

case "$1" in
'start') 
    # Start the Oracle databases:
    # The following command assumes that the oracle login
    # will not prompt the user for any values
    # Remove "&" if you don't want startup as a background process.
    su - $ORA_OWNER -c "$ORA_HOME/bin/dbstart $ORA_HOME" &
    touch /var/lock/subsys/dbora
    ;;

'stop')
    # Stop the Oracle databases:
    # The following command assumes that the oracle login
    # will not prompt the user for any values
    su - $ORA_OWNER -c "$ORA_HOME/bin/dbshut $ORA_HOME" &
    rm -f /var/lock/subsys/dbora
    ;;
esac
```

将`dbora 文件的组`更改为 OSDBA 组（通常`为 dba`），并将权限设置为 750：

```
chgrp dba dbora
chmod 750 dbora
```

在适当的运行`级脚本`目录中创建指向 dbora 脚本的符号链接，如下所示：

```shell
ln -s /etc/init.d/dbora /etc/rc.d/rc0.d/K01dbora
ln -s /etc/init.d/dbora /etc/rc.d/rc3.d/S99dbora
ln -s /etc/init.d/dbora /etc/rc.d/rc5.d/S99dbora
```

重启服务器测试

## 3.配置Oracle数据库

#### 使用 Oracle 网络配置助手

```shell
$ORACLE_HOME/bin/netca
```

#### 使用 Oracle 数据库升级助手

```shell
$ORACLE_HOME/bin/dbua
#有关 DBUA 可用的命令行选项的信息，请使用 或 命令行参数。例如：-help-h
$ORACLE_HOME/bin/dbua -help
```

#### 使用 Oracle 数据库配置助手

```shell
$ORACLE_HOME/bin/dbca

$ORACLE_HOME/bin/dbca -help
```

### 重新链接可执行文件

```shell
relink
```



## 4.管理SQL*PLUS

本节介绍如何管理命令行 SQL*Plus。在示例中，SQL*Plus 将问号 （？） 替换为环境变量的值。`ORACLE_HOM`



## 5.配置Oracle网络服务

### 查找 Oracle 网络服务配置文件

> Oracle 网络服务配置文件通常（但并非总是）位于目录中。根据文件类型，Oracle Net 使用不同的搜索顺序来查找该文件。`$ORACLE_HOME/network/admin`

1. 用户`$ORACLE主页/网络/管理员`目录

对于某些系统级配置文件，用户可能将相应的用户级配置文件存储在其主目录中。用户级文件中的设置将覆盖系统级文件中的设置。下表列出了系统级配置文件和相应的用户级配置文件：

| 系统级配置文件 | 用户级配置文件        |
| :------------- | :-------------------- |
| `sqlnet.ora`   | `$HOME/.sqlnet.ora`   |
| `tnsnames.ora` | `$HOME/.tnsnames.ora` |

### 5.3使用 Oracle 协议支持

Oracle 协议支持是 Oracle 网络的一个组件。它包括以下内容：

- [IPC 协议支持](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/configuring-oracle-net-services.html#GUID-C2EF7F2E-A52E-4533-9D37-C39F4C07CB56)
- [TCP/IP 协议支持](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/configuring-oracle-net-services.html#GUID-42ECE183-0E8F-4A23-88C2-A13F990EE778)
- [TCP/IP，支持安全套接字层协议](https://docs.oracle.com/en/database/oracle/oracle-database/18/unxar/configuring-oracle-net-services.html#GUID-FFF772C9-B16D-4BC6-9B33-FC4140133DE7)

## 6.使用Oracle预编译和Oracle调用接口



## 7.SQL加载器和pl/sql演示



## 8.调整Oracle数据库

