# alter table

> 描述: 修改表中的字段

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# commit

> 描述: 事务保存到数据库

```plsql
commit [transaction]
```

# create index

> 描述: 在表中创建一个索引

```plsql
create index index_name
on table_name (colnum_name)
```

# create role

> 描述: 创建一个数据库角色,  它可以被分配一定的系统权限和对象权限

```plsql
create roll roll name
[with admin [current|current_role]]
```

# create table

> 描述: 创建一个数据表

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# create table as

> 描述: 基于一个数据库表创建另一个表

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# create type

> 描述: 创建一个用户自定义类型 用来表中定义字段

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# create user

> 描述: 在数据库创建一个用户账号

```plsql
create user username identified by password
```

# create view

> 描述: 创建表格的视图

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# delete

> 描述: 从表中删除记录

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

# drop index

> 描述: 删除表索引

```plsql
alter table table_name
[modify|add|drop]
[column column_name][datatype|null not null][restartct|cascade]
[add|drop] constraint constrant_name]
```

