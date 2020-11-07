## SQL语句分类

> 数据操作语言DML

select update insert delete

> 数据定义语言DDL

create alter drop

- create 创建数据库对象
- alter 修改数据库或数据库对象的结构 修改数据库参数或修改数据表单
- drop 删除数据库
- truncate 清空表单数据但保留数据结构
- grant 给数据用户授权
- revoke 收回已经授予用户的授权
- select 查询数据
- insert添加数据
- update 修改数据
- delete 删除某行数据

## 查询语句

select 列表名称 from 

去重复 select distinct 列名称 from 表名称

加条件 select 列名称 from 表名称 where 列 运算符 值

and 和 or 运算符

order by 排序列 desc 降序

between 数据范围  not between 

like  模糊查询 %任意字符个数 _单个任意字符

## 数据操作语句

insert into 表名称(列…) values (对应值…)

update 表名称 set 列名称 =新值 where 列名称=某值

delete from 表名 where 列名=值

## 连接查询语句

### 多表查询 join

数据库中的表通过键将彼此连接起来

主键(primary key) 是唯一的  可以通过主键连接数据表之间的数据

#### join/inner join 如果表中有至少一个匹配 则返回行

```plsql
select column_name(s)
from table_name1
inner join table_name2
on table_name1.column_name=table_name2.column_name
```



#### left join 即使右表没有匹配 也从左表返回所有行

```plsql
select column_name(s)
from table_name1
left join table_name2
on table_name1.column_name = table_name2.column_name
```



#### right join 即使左表中没有匹配 也从右表返回所有行

```plsql
select column_name(s)
from table_name1
right join table_name2
on table_name1.column_name=table_name2.column_name
```



### full join 只要其中一个表存在匹配 就返回行

```plsql
select column_name(s)
from table_name1
full join table_name2
on table_name1.column_name=table_name2,column_name
```



#### union 连接两个或多个select语句的结果集 union all 列出所有值

```plsql
select column_name(s) from table_name1
union all
select column_name(s) from table_name2
```



## 常见函数

- count() 记录数
- sum() 总和
- max() 最大值
- min() 最小值

### group by 用于结合合计函数 对结果集进行分组

```plsql
select column_name,aggregate_function(column_name)
from table_name
where column_name operator value
group by column_name
```

