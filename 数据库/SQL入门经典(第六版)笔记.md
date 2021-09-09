# SQL定义

## 基础知识

> SQL表示结构化查询语言
>

sql命令主要类别

- DDL 数据定义语言
  - create table
  - alter table
  - drop table
  - create index
  - alter index
  - drop index
  - create view
  - drop view
- DML 数据操作语言
  - insert
  - update
  - delect
- DQL 数据查询语言
  - select
- DCL 数据控制语言
  - alter password
  - grant
  - revoke
  - create synonym
- DAC 数据管理语言
  - start audit
  - stop audit
- TCC 事务控制命令

4个事务控制命令

- commit 提交事务
- rollback 撤销事务
- savepoint 创建事务点
- set transactions 设置事务名称



使用客户端连接会登录服务器 直接连接到数据库

使用web时会登录达到数据库的互联网上



如果某个字段被定义为null 表示该字段可以不必输入任何内容

如果字段被定义not null 则表示该字段必须输入数据

## 练习

1. SQL的含义?
2. SQL命令的6个主要类别
3. 4个事务控制命令
4. 字段设置为null与not null 的含义?



# 定义数据结构

## 基础知识

- 定长字符串 char
- 变长字符串 vchar2
- 大对象 blob text
- 数值类型 number integer real decimal
- 自定义类型



## 练习

1. 什么是数据结构?
2. 主要数据类别?
3. 域:对值的特定约束

# 管理数据库对象

## 基础知识

> 对象:表 视图 族 序列 索引 异名
>
> 模式是与数据某个用户名相关联的数据库对象集合

表

​	列:字段,同一类型的一组数据

​	行:数据库表的一条记录

表操作

​	create table 创建表

​	alter table 修改表

​	利用现有表创建新表

​		create table table_name as select [x|colun2] from 表名 [where 条件]

​	drop table table_name [restrict|cascade] 删除表

完整性约束

​	主键约束 primarykey

​	唯一性约束 uniqu

​	外键约束 foreigekey

## 练习

# 规格化过程

## 基础知识

列不可再分==>依赖于主键==>除主键外,不依赖与其他列

去格式化:利用冗余字段提高数据库性能

## 练习



# 操作数据

## 基础知识

## 练习

# 管理数据库事务

## 基础知识

什么是事务?

​	数据库执行的一个工作单位 开始->结束

控制事务

1. comit 提交事务

2. rollback 将还没有提交的事务进行撤回

3. savepoint 设置保存点 对所进行的事务进行分段

   sqlServer : save transaction savepoint_name;

4. rollback to savepoint 回退到某个保存点

   SQL server: rollback transaction point_name

5. release savepoint: 删除某个保存点 SQL server不支持

6. set transaction 初始化事务

## 练习

# 数据库查询

## 基础知识

## 练习

# 使用操作符进行分类

## 基础知识

## 练习

# 汇总查询到的数据

## 基础知识

## 练习

# 数据排序与分组

## 基础知识

## 练习

# 重组数据的外观

## 基础知识

## 练习

# 日期和时间

## 基础知识

## 练习

# 在查询中连接表

## 基础知识

## 练习

# 使用子查询定义未知数据

## 基础知识

## 练习

# 利用索引改善性能

## 基础知识

## 练习

# 改善数据库性能

## 基础知识

## 练习

# 管理数据库用户

## 基础知识

人员类别

​	数据库录入员	系统分析员

​	程序员		开发人员

​	系统工程师	测试人员

​	数据库管理员	终端用户

用户与模式的区别

​	模式: 数据库对象与数据库用户相关联

​	模式: 按照逻辑分组

管理过程

​	新用户的上级==>发起访问请求==>公司批准程序==>管理层允许==>安全员或数据库管理员==>创建新用户==>用户得到用户名/密码==>登录时需修改密码

### 创建用户

Oracle

```plsql
create user c##name identified by password
[dafault tablespace 表空间名]
[temporary tablespace 临时表空间名];
```



## 练习

# 管理数据库安全

## 基础知识

系统权限

| SQL server                 | oracle                      | 对象权限    |
| -------------------------- | --------------------------- | ----------- |
| create database 新建数据库 | create table 新表           | usage       |
| create procedure 创建过程  | create any table 创建任意表 | select      |
| create view 视图           | alter any table 修改任意表  | insert      |
| backup database 备份数据库 | drop table                  | update      |
| create table 创建表        | alter database              | preferences |
| create trigger 创建触发器  | backup any table            | refernces   |
| execute 执行               | select any table            |             |

栗子

```plsql
grant select on emp to user1 [with grant option]; --可选是否可授予其他用户
grant select,insert on emp to user1,user2 [....];
revoke insert on emp from user1; --收回user1对emp表的insert操作
grant select on emp to public; --表示数据库所以用户
```

### 权限组

> 可以将一些权限分为一组, 一组的形式进行授权,Oracle称为角色 mysql暂不支持

oracle 默认

​	connect –允许用户连接数据库

​	resource -允许用户创建对象

​	dba -允许用户对数据库进行任何操作

SQL server 默认

​	db_ddladmin–DDL操作

​	db_datareader -用户查询

​	db_datawriter -用户对数据库任意操作

## 练习

什么是数据库安全?

> 禁止未授权的用户访问
>
> 对用户的访问权限进行限制
>
> 防止数据盗取或破坏

什么是权限?

> 用于访问数据库对象的许可级别
>
> 权限通过grant授予 revoke收回

# 创建并使用视图和异名

## 基础知识

## 练习

# 使用系统目录

## 基础知识

什么是系统目录?

​	数据库有关的信息,如表 视图 索引…相关信息

系统目录的主要内容

​	用户账户和默认设置	其他数据库对象信息

​	权限其他安全设置	表约束

​	性能统计信息	用户会话

​	对象大小调整	审计信息

​	表结构和储存	内部数据库设置

主流数据库对象

| SQL server                    | Oracle                  |
| ----------------------------- | ----------------------- |
| sysusers 数据库用户           | all_tables 可访问表     |
| sys.databases 数据库片段      | user_tables 拥有的表    |
| sys.database_permissions 权限 | dba_tables 全部表       |
| sys.database_file 数据库文件  | dba_segments 片段存储   |
| sysindex 索引                 | dba_roles 角色          |
| sysconstraints 约束           | dba_free_space 剩余空间 |
|                               | v$database 当前数据库   |
|                               | v$session 当前会话      |





## 练习

# 高级SQL主题

## 基础知识

### 游标

open 打开游标 fetch 获取游标记录 close 关闭游标

SQL server

```sql
begin
	declare @custname varchar(30);
	declare namecursor cursor for
		select lastname from passengers;
	open namecursor;
	fetch next from namecursor into @custname
	while (@@fetch_status<>-1)
		begin 
			if (@@fetch_status<>-2)
			 	begin
			 		--do something with the cariable
			 	end
			fetch next from namecursor into @custname
			end
			colse namecursor
			dallcate namecursor;
```



## 练习

# 扩展

## 基础知识

## 练习