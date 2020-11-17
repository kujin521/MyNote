--查看表结构
desc emp;
--查询表
select * from emp;
select * from emp where job='SALESMAN';
--查找空值
select * from emp where comm=null;
select * from emp where comm is null;
--空值与运算
select * from dept where 1>null;
select ename,sal,nav(comm,0) from scott.emp where deptno=20 and nav(comm,0)>=0;
select coalesce(c1,c2,c3,c4,c5,c6) as c from v1_5;
--创建别名
select *
    from (select sal as 工资,comm as 提成 from emp) x where 工资<1000;
select sal as 工资,comm as 提成 from emp where sal<1000;

--拼接列
select ename ||' job is '||job as msg from emp where deptno=10;

--限制返回行数
select * from emp where rownum<=2;
--rownum依据数据标识
select * from emp where rownum=2;
select *
    from (select rownum as sn,emp.* from emp where rownum<=2)
    where sn=2;
    







