## SQL Plus

> 命令行 方式

## SQL Developer

> 管理工具方式

## 主要将命令行的方式

```bash
用法 1: sqlplus -H | -V

    -H             显示 SQL*Plus 版本和
                   用法帮助。
    -V             显示 SQL*Plus 版本。

用法 2: sqlplus [ [<option>] [<logon>] [<start>] ]

  <option> 为: [-C <version>] [-L] [-M "<options>"] [-R <level>] [-S]

    -C <version>   将受影响的命令的兼容性设置为
                   <version> 指定的版本。该版本具有
                   "x.y[.z]" 格式。例如, -C 10.2.0
    -L             只尝试登录一次, 而不是
                   在出错时再次提示。
    -M "<options>" 设置输出的自动 HTML 标记。选项
                   的格式为:
                   HTML [ON|OFF] [HEAD text] [BODY text] [TABLE text]
                   [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]
    -R <level>     设置受限模式, 以禁用与文件系统交互的
                    SQL*Plus 命令。级别可以
                   是 1, 2 或 3。最高限制级别为 -R 3, 该级别
                   禁用与文件系统交互的
                   所有用户命令。
    -S             设置无提示模式, 该模式隐藏
                   命令的 SQL*Plus 标帜, 提示和回显
                   的显示。

  <logon> 为: (<username>[/<password>][@<connect_identifier>] | /)
              [AS SYSDBA | AS SYSOPER] | /NOLOG

    指定数据库帐户用户名, 口令和数据库连接
    的连接标识符。如果没有连接
    标识符, SQL*Plus 将连接到默认数据库。

    AS SYSDBA 和 AS SYSOPER 选项是数据库管理
    权限。

    /NOLOG 选项可启动 SQL*Plus 而不连接到
    数据库。

  <start> 为: @<URL>|<filename>[.<ext>] [<parameter> ...]

    使用将分配给脚本中的替代变量的指定参数
    从 Web 服务器 (URL) 或本地文件系统 (filename.ext)
    运行指定的 SQL*Plus 脚本。

在启动 SQL*Plus 并且执行 CONNECT 命令后, 将运行站点概要
文件 (例如, $ORACLE_HOME/sqlplus/admin/glogin.sql) 和用户概要文件
(例如, 工作目录中的 login.sql)。这些文件
可包含 SQL*Plus 命令。

有关详细信息, 请参阅 SQL*Plus 用户指南和参考。
```

在命令行可以通过sqlplus/nolog 的形式登录 但是没有连接数据库

默认连接的数据库是根据系统环境变量 配置文件决定的

## Oracle用户解锁

> 以管理员身份登录
>
> sqlplus / as sysdba

1. 查看系统中用户状态
2. 解锁
3. 设置密码

```plsql
select username,account_status from dba_users;
alter user hr account unlock;
alter user hr identified by a123456;
```

