# 第一章 Oracle体系结构

## 数据库概念

数据库概述

数据库模型

数据库

## 了解关系数据库

## (重点)范式理论和E-R模型

范式理论

1. 每一列不可分割
2. 满足第一范式, 存在唯一标识
3. 满足第二范式, 不包含其他表非主关键字信息

E-R模型

> 实体-关系模型 反映世界上存在的事物以及他们的关系

1. 一对一
2. 一对多
3. 多对多



## 了解Oracle12

### 发展历史

- 1977年 创建Relational软件公司
- 1983年 发布第三个版本 加入SQL语言 C语言编写 改名Oracle
- 1984年 Oracle4 增加读一致性版本
- 1985年 Oracle5 客户端-服务器模式 打破640kb内存限制
- 1988年 Oracle6 增强序列生成和延迟写入功能 引入底层锁 加入pl/sql 和热备份
- 1991年 Oracle6.1 引入Parallel Server选项
- 1992年 Oracle7 引入sql*dba 和 database角色
- 1997年 Oracle8 开始可以在windos使用
- 2001年 Oracle9 包含RAC等新功能
- 2002年 Oracle9 增加集群文件系统
- 2004年 Oracle10g
- 2007年 Oracle11g
- 2013年 Oracle12c 云计算 对承租 数据分层

## 实践 

## (重点)Oracle体系结构

> Oracle内存由SGA系统全局区 PGA程序全局区

### 内存结构

#### 共享池

> 共享池对SQL pl/sql 程序进行语法分析 编译 执行的内存区域
>
> 共享池的大小直接影响数据库性能 
>
> 它由数据库高速缓冲区和数据字典缓冲区组成
>
> 

#### 数据缓冲区

> SGA(系统全局区) 一个高速缓冲区
>
> 用来存储最近从数据库读出的数据块
>
> 数据缓冲区的大小与数据库读取速度有直接影响
>
> 当用户处理查询时 服务器进程会先从数据缓冲区查找, 没有找到在读取磁盘数据

#### 日志缓冲区

> 用户通过insert select delete 服务器进程会将修改记录到重做日志缓冲区中
>
> 当数据库发生意外时 可以从日志缓冲区读取需改记录 来恢复数据库

#### 大池

> 为了进行大的后台操作而分配的内存空间 主要指备份恢复 大型I/O操作和并行查询

#### Java池

> 存储了Java语句和语法分析表等信息 如果安装了java虚拟机 就必须启动Java池

#### Streams池

> 高级复制技术的一部分 其功能是存放消息 这些消息是共享的

#### 数据字典缓冲区

> 共享池的一部分 
>
> 包含数据库的结构 用户信息 数据表 视图等信息

### 进程结构

#### 用户进程

> 一个需要与Oracle服务器交互的程序

#### 服务器进程

> 处理连接到示例的用户进程请求

#### 后台进程

> Oracle数据库为了保持最佳性能和协调多个用户请求而设置的

```plsql
#查询启动的后台程序信息
select * from v$process
#查看启动的DBWR进程个数
show parameter db_wr;

```

### 物理结构

#### 数据文件

#### 控制文件

#### 重做日志文件

#### 参数文件

初始化参数文件

​	在数据库启动实例配置数据库 该文件主要设置数据库实例名称 文件使用位置 实例需要的内存区域大小

配置参数文件

​	config.ora 在数据库存在多个实例时该文件才会存在

二进制参数文件

​	pfile(参数文件) spfile(服务器参数文件)



# 第二章 Oracle基本操作

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

## web管理器—OEM

Oracle12c与Oracle11g相比 简化了功能操作  解决了许多bug

pda用户操作以下命令 即可启用OEM

```plsql
exec DBMS_XDM_CONFIG.SETHTTPPROT(端口号);
```

​	设置https端口号

```
exec DBMS_XDM_CONFIG.SETHTTPSPROT(端口号);
```

### 案例

启动监听 

```plsql
lsnrctl status
```

首页地址: https://localhost:5500/em



## 命令行工具–SQL Plus

## 图形工具—SQL Developer



## 网路配置助手



## 网络管理器



## 数据库管理助手



# 第三章 操作Oracle 数据库

## 3.1 Oracle数据库表

## 3.2 Oracle表列数据类型

## 3.3 创建表

## 3.4 案例 使用设计器创建表

## 3.5 修改表属性

### 增加列

```plsql
alter table 表名 add 列名 类型;
```



### 删除列

```plsql
alter table 表名 drop column 列名
```



### 更新列

#### 跟新列名

```plsql
alter table 表名 rename old列名 to new列名
```

#### 修改列参数

```plslq
alter table 表名 modify 列名 new类型
```

#### 修改列的默认值

```plsql
alter table 表名 modify(列名 default 默认值);
```

### 更改储存表空间

```plsql
alter table 表名 move tablespace 表空间名
```

### 更改存储参数

在创建表之后 可以对参数pctfree pctused进行修改

```plsql
alter table 表名 pctfree 30 pctused 50;
```



## 3.6 重命名表

```plsql
alter table old表名 rename to new表名
```



## 3.7 删除表定义

delete是删除表数据 ,不删除表结构

```plsql
drop table 表名;
```

权限

> 一般用户只能自己模式中的数据表定义 
>
> 如果删除其他模式中的表 需要用户具有 drop any table 的系统权限

可选参数

- CASCAED CONSTRAINTS 删除表 及 删除所有引用该表的视图 约束 索引 触发器等
- PURGE 删除表后立即释放资源空间

Oracle执行流程

1. 删除表中的所有记录
2. 从数据字典中删除该表的定义
3. 删除与该表相关的所有索引和触发器
4. 回收该表所分配的存储空间
5. 如果有视图或pl/sql进程依赖该表 这些视图或者pl/sql进程设置为不可用状态

## 3.8 分析表

> 对表进行分析时 必须保证其他用户没有对该表进行操作

关键字

> analyze

通过分析可以进行如下操作

- 验证表的存储情况
- 查看表的统计信息
- 查找表中的连接记录和迁移记录

### 3.8.1 验证表的存储情况

关键语句

> analyze validate structure

验证表的存储结构 对存储结构的完整性进行分析, 如果发现数据缺失 则需要重新创建该表

> 在使用表的过程中 由于软硬件或者使用方法等原因 可能会导致表中的某些数据块产生逻辑损失
>
> Oracle在访问损失的数据块时 会产生错误信息

验证流程

1. 验证时Oracle会将表所含有损失数据块的记录的物理地址(ROWD) 添加到一个名为invalid_rows的表中
2. invalid_rows表可以通过Oracle提供的utlvalid.sql脚本创建

#### 案例

首先进入Oracle安装目录 通过执行utlvalid.sql文件创建invalid_rows表

```plsql
@f:\utlvalid.sql
# table create
```

通过desc查看表结构

```plsql
desc invalid_rows;
```

使用analyze validate structure语句对指定表进行存储结构分析

```plsql
analyze validate structure
# table analyzed
```

查询表invalid_rows中是否存在破损数据块

```plsql
select * from invalid_rows;
```

可选参数

- cascade online 表示连接方式对标进行存储结构验证

```plsql
analyze table 表名 validate structure cascade online;
```



### 3.8.2 查看表的统计信息

使用analyze 语句进行统计信息 可以指定一下连个子句

- compute statisics 在分析中对表进行全扫描 获取整个表的精确统计信息
- estimate statisics 在分析过程中对表进行部分扫描 并获取扫描信息 一部分扫描信息代表整个表的统计信息

#### 案例

全扫描

```plsql
analyze table 表名 compute statistics;
```

部分扫描

```plsql
analyze table 表名 estimate statistics sample 20 rows;
```

通过对表中20%的记录分析 获得表的近似统计

```plsql
analyze table 表名 estimate statistics sample 20 percent;
```

提示

> 在使用部分扫描时 
>
> 如果不适用关键字sample 则Oracle默认1024条记录
>
> 如果比例超过50% 则进行全表扫描

通过统计结果可以发现一下内容

- num_rows 表的记录总数
- blocks 表所占的数据块总数
- empty_blocks 表中未使用的数据总数
- avg_space 数据块中平均的空闲空间

```plsql
select num_rows,blocks,empty_blocks,avg_space from user_table where table_name="user";
```

### 3.8.3 表的连接记录和迁移记录

连接记录

> Oracle数据库中 表数据中基本单位是记录  记录放在数据块中 ,当记录过大时将记录分割成片段存储在多个数据块中
>
> 这种存储在多个数据块的记录被称为“连接记录”

迁移记录

> 如果一条记录原来存储在一个数据块中 但由于更新操作 信息记录扩展 Oracle会将记录移动到另一个数据块中 这种情况称为“迁移记录”





## 3.9 案例 创建导游信息表

| 字段名称      | 数据类型 | 允许为空 | 说明           |
| ------------- | -------- | -------- | -------------- |
| guideNo       | 字符串   | 否       | 导游编号       |
| guidePosition | 字符串   | 否       | 导游的职位信息 |
| guideName     | 字符串   | 否       | 姓名           |
| guideSex      | 字符串   | 是       | 性别           |
| guideAge      | 数字     | 是       | 年龄           |
| languageList  | 字符串   | 是       | 掌握语言       |
| way           | 字符串   | 是       | 简历           |
| leadDate      | 日期类型 | 是       | 任职日期       |
|               |          |          |                |

### 创建表

假设表名为GuideMessage 使用create table创建语句

```plsql
--创建guidemessage
 create table guidemessage(
    guideno varchar2(8) not null,
    guideposution number(10),
    guidename varchar2(20),
    guideSex varchar2(2),
    guideAge number(2),
    languageList varchar2(100),
    way varchar2(500),
    leaddate date);
--修改列名guideposution 为 guideposition
alter table guidemessage rename column guideposution to guideposition;
--给guideposition,guidename列增加不为空的属性
alter table guidemessage modify guideposition varchar2(10) not null;
--为guidesex列增加默认值为"女"的设置
alter table guidemessage modify(guidesex default '女');
--为leadDate增加使用系统当前日期
alter table guidemessage modify(leaddate default sysdate);
--修改表空间为system
alter table guidemessage move tablespace system;
--将表名重命名为guideinfo
alter table guidemessage rename to guideinfos;
--删除表
drop table guidemessage;
```



# 第五章 select 简单查询

## 5.1 SQL语言简介

## 5.2 select 语句的语法格式

## 5.3 简单查询

## 5.4 按条件查询

## 5.5 结果集的规范化

## 5.6 案例

# 第七章 高级查询

## 子查询

> Oracle对from子句的嵌套没有限制 但where子句中对多可以嵌套255层子查询

- 要将子查询放在括号内
- 子查询可以出现在where from select列表 having 子句中
- 子查询不能出现在主查询Group by语句中
- 在where 子句和set子句中进行子查询 不能带有group by子句

单行子查询

```plsql
select select_list from table_name where search_condition(select select_list from table_name);
```



