# UNiQUE约束

## 什么是unique约束?

- unique约束, 也称唯一键约束, 用于限定数据表中字段值的唯一性

## 添加unique约束

- 在创建数据表时添加unique约束

  ```sql
  create table table_name(
  	...,
  	constraint constraint_name unique(column_name)
  )
  ```

- 在修改数据表时添加unique约束

  ```sql
  alter table table_name add constraints constraints constraint_name unique(column_name)
  ```

## 案例

```sql
--在建表时添加唯一约束
CREATE TABLE TB_STUDENTS (
	stu_num char(5) PRIMARY KEY,
	stu_name varchar(20),
	stu_sex char(4),
	stu_age number(2),
	stu_tel char(11),
	CONSTRAINT uq_student_tel UNIQUE(stu_tel)
);
--删除表
DROP TABLE TB_STUDENTS ;
--创建表示添加唯一约束
CREATE TABLE TB_STUDENTS (
	stu_num char(5) PRIMARY KEY,
	stu_name varchar(20),
	stu_sex char(4),
	stu_age number(2),
	stu_tel char(11) unique
);
--创建表
CREATE TABLE TB_STUDENTS (
	stu_num char(5) PRIMARY KEY,
	stu_name varchar(20),
	stu_sex char(4),
	stu_age number(2),
	stu_tel char(11)
);
--通过修改表，创建唯一约束
ALTER TABLE TB_STUDENTS ADD CONSTRAINT uq_student_tel UNIQUE(stu_tel);
--删除字段的唯一约束
ALTER TABLE TB_STUDENTS drop CONSTRAINT uq_student_tel; 
```

