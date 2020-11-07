## 前置条件

Linux7.* Oracle18.3

## 登录Oracle 服务器

在从 Oracle 数据库示例媒体安装产品之前，必须确保系统有权访问 Oracle 数据库 18c Oracle 主页。如果需要，您必须首先安装或升级到此发布的 Oracle 数据库。

```
more /etc/oratab
```

```shell
#

# This file is used by ORACLE utilities.  It is created by root.sh
# and updated by either Database Configuration Assistant while creating
# a database or ASM Configuration Assistant while creating ASM instance.

# A colon, ':', is used as the field terminator.  A new line terminates
# the entry.  Lines beginning with a pound sign, '#', are comments.
#
# Entries are of the form:
#   $ORACLE_SID:$ORACLE_HOME:<N|Y>:
#
# The first and second fields are the system identifier and home
# directory of the database respectively.  The third field indicates
# to the dbstart utility that the database should , "Y", or should not,
# "N", be brought up at system boot time.
#
# Multiple entries with the same $ORACLE_SID are not allowed.
#
#
orcl:/u01/app/oracle/product/18.3.0/dbhome_1:Y
testoracle:/u01/app/oracle/product/18.3.0/dbhome_1:Y

```

## 下载 Oracle 数据库示例

1. 转到 Oracle 技术网络上的 Oracle 数据库 18c 下载页面：

   http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. 选择"**查看所有"**链接，然后在"Oracle 数据库 18c 示例"标题下选择 Oracle 数据库示例 zip 文件。

   https://www.oracle.com/database/technologies/oracle18c-linux-180000-downloads.html#license-lightbox

## 安装 Oracle 数据库示例

Oracle 数据库示例在 Oracle 主目录中安装产品演示，以及目录中示例架构的 SQL 脚本。若要使用这些产品演示，必须在数据库中安装示例架构。如果在 Oracle 数据库安装期间或使用数据库配置助手创建数据库期间未包含示例架构，则可以通过运行 SQL 脚本手动安装它们。`$ORACLE_HOME/demo/schema`

使用以下方法之一安装 Oracle 数据库示例：

- [使用 Oracle 通用安装程序安装 Oracle 数据库示例](https://docs.oracle.com/en/database/oracle/oracle-database/18/exmpl/index.html#GUID-F8C8959F-CC3A-4BC7-A88A-41FF7863CB2C)
- [使用响应文件静默安装 Oracle 数据库示例](https://docs.oracle.com/en/database/oracle/oracle-database/18/exmpl/index.html#GUID-3A9E4836-B1DD-4BBB-9CC1-BA41C37255E6)
- [关于只读 Oracle 家庭中的演示目录](https://docs.oracle.com/en/database/oracle/oracle-database/18/exmpl/index.html#GUID-83DD7763-FCC3-4F15-978F-21055F600EF4)

1. (oracle用户目录下)导航到下载安装文件的目录。

2. 提取 zip 文件的内容。

3. 运行以下命令以启动 Oracle 通用安装程序：

   在 UNIX 平台上：(oracle用户)

   ```sh
   ./runInstaller
   ```
   
   出现问题
   
   