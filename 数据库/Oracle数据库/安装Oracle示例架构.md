# Oracle 数据库示例架构

## 1. 介绍

此存储库包含与 Oracle 数据库企业版一起安装的 Oracle 数据库示例架构的副本。这些架构在 Oracle 文档中用于显示 SQL 语言概念和其他数据库功能。架构本身记录在 Oracle[数据库示例架构中](https://www.oracle.com/pls/topic/lookup?ctx=dblatest&id=COMSC)。

架构为：

- 人力资源*：人力资源*
- OE：*订单输入*
- 下午：*产品媒体*
- 九：*信息交流*
- SH：*销售历史*
- BI：*商业智能*

*由于这些脚本当前形式中的广泛依赖性，因此无法接受更改的拉取请求。*

此外，此存储库中[还包括一个新的](https://github.com/oracle/db-sample-schemas/tree/master/customer_orders)架构 CO：客户订单 。此时不会与其余架构一起自动安装。按照该架构的[README 中的说明](https://github.com/oracle/db-sample-schemas/blob/master/README.md)安装 CO 架构。

## 2. 安装样品

*注意*：安装示例架构的第一步是删除具有以下名称的用户帐户：HR、OE、PM、IX、SH 和 BI。如果您有要保留的任何这些名称的架构，则不要继续安装。

安装脚本设计为在 Oracle 数据库上运行。
安装过程中需要特权数据库访问。

以下说明在 Linux 和类似操作系统上有效。调整它们以用于其他平台。

### 2.1. 克隆此存储库

以 Oracle 数据库软件所有者状态登录并克隆存储库，例如

```
cd $HOME
git clone https://github.com/oracle/db-sample-schemas.git
```

或下载和提取 ZIP 文件：

```
unzip db-sample-schemas.zip
```

架构目录应归 Oracle 数据库软件所有者所有。

### 2.2. 更改目录

```
cd $HOME/db-sample-schemas
```

### 2.3. 更改所有嵌入路径以匹配您的工作目录

安装脚本需要将当前目录嵌入到不同位置。使用文本编辑器或以下 Perl 脚本进行更改，例如将令牌的匹配替换为当前工作目录`__SUB__CWD__``/home/oracle/db-sample-schemas`

```
perl -p -i.bak -e 's#__SUB__CWD__#'$(pwd)'#g' *.sql */*.sql */*.dat 
```

```
这里我是使用 netpad++ 批量修改的 按crtl+f 有批量修改文件选项
```



### 2.4. 设置 Oracle 环境

在客户端计算机上运行时跳过此步骤（一个没有安装 Oracle 数据库的计算机上）。

```
source /usr/local/bin/oraenv
```

*注意*：Oracle 的实用程序需要用于正确加载产品介质 （PM） 和销售历史记录 （SH） 架构。`sqlldr``$PATH`

### 2.5. 运行安装脚本

查看[README.txt](https://github.com/oracle/db-sample-schemas#README.txt)以了解密码和预要求的信息。特别是，验证默认表空间名称和临时表空间名称，并选择每个架构的密码。

启动 SQL*Plus 并运行顶级安装脚本，如[README.txt 中所讨论的](https://github.com/oracle/db-sample-schemas#README.txt)：

```
sqlplus system/systempw@connect_string
@mksample systempw syspw hrpw oepw pmpw ixpw shpw bipw users temp /your/path/to/log/ connect_string
```

*注意*：使用绝对路径，并在日志目录名称中附加一个尾随斜杠。

使用当前的 SYSTEM 和 SYS 密码，以及实际的默认和临时表空间名称。新 HR、OE、PM、IX、SH 和 BI 用户的密码将设置为您指定的值。

```plsql
#登录sys超级管理员 修改密码 查看实例名
sqlplus / as sysdba
alter user sys identified by a123456; 
alter user system identified by a123456; 
show pdb
# 注意 前两个密码 自己的路径 实例名
sqlplus system/a123456@127.0.0.1:1521/xepdb1

@mksample a123456 a123456 hrpw oepw pmpw ixpw shpw bipw users temp D:\Oracle18\db-sample-schemas-master\log\ localhost:1521/xepdb1
```

*提醒*：当前 CO 架构不会作为此过程的一部分安装。

使用连接字符串允许连接到非容器数据库和可插入数据库使用相同的语法。

使用服务非 cdb 和 pdb 连接数据库字符串的示例：

```
  localhost:1521/noncdb
  localhost:1521/pdb
```

### 2.6. 查看安装日志

查看日志目录中的输出有没有错误。

## 3. 移除样品

*注意*：这将删除名为 HR、OE、PM、IX、SH 和 BI 的用户帐户。

### 3.1. 设置 Oracle 环境

在客户端计算机上运行时跳过此步骤（一个没有安装 Oracle 数据库的计算机上）。

```
source /usr/local/bin/oraenv
```

### 3.2. 运行架构删除脚本

```
sqlplus system/systempw@connect_string
@drop_sch.sql
```

当出现提示时，输入系统密码、日志文件名并连接字符串。

### 3.3 运行 CO 架构删除脚本

如果已安装 CO 架构，请运行以下脚本将其删除。

```
sqlplus system/systempw@connect_string
@co_drop_user.sql 
```