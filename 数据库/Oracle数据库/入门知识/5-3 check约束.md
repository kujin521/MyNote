# check约束

## 什么是check约束?

- check约束是检查约束,用于限定每一列能够输入的值,以确保数据的正确性

## 怎样添加check约束?

- 在创建数据表时添加check约束

  ```sql
  create table table_name(
  	....,
  	constrant constranint_name check(约束条件)
  )
  ```

  ```sql
  CREATE TABLE TB_STUDENTS (
  	stu_num char(5) PRIMARY KEY,
  	stu_name varchar(20),
  	stu_sex char(4),
  	stu_age number(2),
  	stu_tel char(11),
  	
  	CONSTRAINT ck_student_sex CHECK(stu_sex='男' OR stu_sex='女'),
  	CONSTRAINT ck_student_age CHECK(stu_age BETWEEN 6 AND 30)
  );
  ```

- 通过修改表的方式 添加check约束

  ```sql
  ALTER TABLE TB_STUDENTS ADD constraint ck_student_sex check(stu_sex='男' OR stu_sex='女');
  ```

## 删除check约束

- 删除check约束

  ```
  ALTER TABLE TB_STUDENTS DROP CONSTRAINTS ck_student_sex;
  ```

## 案例

```sql
--创建学生信息表,并添加check约束
CREATE TABLE TB_STUDENTS (
	stu_num char(5) PRIMARY KEY,
	stu_name varchar(20),
	stu_sex char(4),
	stu_age number(2),
	stu_tel char(11),
	
	CONSTRAINT ck_student_sex CHECK(stu_sex='男' OR stu_sex='女'),
	CONSTRAINT ck_student_age CHECK(stu_age BETWEEN 6 AND 30)
);
--删除学生信息表
DROP TABLE TB_STUDENTS ;
--创建学生信息表
CREATE TABLE TB_STUDENTS (
	stu_num char(5) PRIMARY KEY,
	stu_name varchar(20),
	stu_sex char(4),
	stu_age number(2),
	stu_tel char(11)
);
--通过修改表,添加check约束
ALTER TABLE TB_STUDENTS ADD constraint ck_student_sex check(stu_sex='男' OR stu_sex='女');

ALTER TABLE TB_STUDENTS DROP CONSTRAINTS ck_student_sex;
```

