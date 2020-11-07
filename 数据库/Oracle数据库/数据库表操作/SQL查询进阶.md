## 筛选查询(where)

> select 字段列表 from 数据表 where 筛选条件

- 比较筛选
  - 比较运算符 =	!/<>	>	< 	<=/>=
- 逻辑查询
  - and	or	not
- 模糊查询
  - %匹配任意类型和长度的字符
  - _匹配单个任意字符
- 列表范围查询
  - 值 in (,目标值,….)
  - 值 not in (目标值,……..)
- 范围查询
  - between  值 and 值
  - not between 值 and 值
- 判断null
  - 空值 !=空字符串
  - 字段/值 is null
  - 字段/值 is not nul

## 分组查询(group by)

> select 字段列表 from 数据表 where 筛选条件 group by 分组条件

### 聚集函数

| 函数       | 说明                           |
| ---------- | ------------------------------ |
| sum        | 将组中表达式的所有值相加的结果 |
| min        | 组中的最小值                   |
| max        | 组中的最大值                   |
| avg        | 组中所有值的算术平均值         |
| stddev     | 标准偏差                       |
| median     | 数据集中的中间值               |
| variance   | 值的统计方差                   |
| stats_mode | 组中最常见的值                 |

### 使用havig子句限制分组结果

> having 和where 作用基本一致 但having可以对聚集函数进行条件限制 而where不可以

## 排序插叙(order by)

> select 字段列表 from 数据表 [where] order by 排序字段 [asc]/[desc]

## 多表关联查询

### 表的别名 [as]

> 别名.字段

### 内连接(inner join .. on)

> 表1 [inner] join 表2 on 实现内连接条件

## 外连接

- 左外连接 left join
- 右外连接 right join
- 完全连接 full join

## 自然连接

