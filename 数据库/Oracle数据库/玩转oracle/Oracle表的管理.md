## Oracle表的管理

### 创建表

#### 表名和列

- 必须以字母开头
- 长度不能超过30字符
- 不能使用oracle的保留字
- 只能使用A-Z a-z 0-9 $#等

#### oracle支持的数据类型

- 字符型

  - char 定长 最大2000字符

    查询速度快  但占用固定空间

  - varchar2(20) 变长 最大400字符

    查询速度慢 节省空间

  - clob 字符型的大数据 最大4G

- 数字类型

  - number 范围10的+-38次方
  - number(5,2) 表示小数 五位有效数 2位小数
  - number(5) 表示一个五位整数

- 日期类型

  - date 包含年月日和时分秒
  - timestamp Oracle9i 对date的扩展 高精度

  修改日期默认格式(默认格式:dd-m月-yyyy)

  ```plsql
  alter sessin set nls_date_format='yyyy-mm-dd';
  ```

- 图片(一般对于数据保密性高的文件才使用)

  - blob 二进制 可以存放图片/声音 4G

### 建表

```
create table 表名(
	列名 类型 [约束],
	....
);
```

## 保存点

```
savapoint aa; //设置保存点
rollback to aa; //回滚到指定的保存点
```

## 基本查询



## 复杂查询

概念:笛卡尔积: 

> 直观的说就是
>  集合A{a1,a2,a3} 集合B{b1,b2}
>  他们的 笛卡尔积 是 A*B ={(a1,b1),(a1,b2),(a2,b1),(a2,b2),(a3,b1),(a3,b2)}
>  任意两个元素结合在一起

​	规定再多表查询中 条件语句不能少于表数-1

```sql
-- 操作员工表和部门表
select * from emp;
select * from dept;
-- 查询数据库年薪
select ename,(sal+nvl(comm,0))*12 as "年薪" from emp order by "年薪";
-- 复制的查询

-- 显示所有员工中最高工资和最低工资
select min(sal),max(sal) from emp;
-- 显示所有员工的平均工资和工资总和
select avg(sal),sum(sal) from EMP;
-- 计算总共有多少员工
select count(*) from EMP;
-- 显示最高工资的员工姓名 岗位
select ename,job from EMP where SAL=(select max(sal) from EMP);
-- 显示工资高于平均工资的员工信息
select * from EMP where SAL>(select avg(SAL) from EMP);
-- 显示 每个部门的平均工资和最高工资
select DEPT.DNAME,JOB, avg(sal),max(sal) from EMP,DEPT where EMP.DEPTNO=DEPT.DEPTNO group by DEPT.DNAME,JOB having avg(SAL)>2000  order by DEPT.DNAME;
-- 显示雇员名 工资 部门名
select e.ENAME,e.SAL,d.DNAME from EMP e,DEPT d where e.DEPTNO=d.DEPTNO;
-- 显示部门号为10的 部门名 员工名 工资
select d.DNAME,e.ENAME,e.SAL from EMP e,DEPT d where d.DEPTNO=10;
-- 显示各个员工的姓名 工资 工资级别
select d.DNAME,e.ENAME,e.SAL,d.DEPTNO from EMP e,DEPT d;
-- 显示雇员名 工资 所在部门名 按部门排序
select e.ENAME,d.DNAME from EMP e,DEPT d where e.DEPTNO=d.DEPTNO order by d.DNAME;
```

## Oracle 数据库的创建

