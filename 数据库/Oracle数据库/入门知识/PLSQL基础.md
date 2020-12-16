

# PL/SQL的优点

•　PL/SQL是一种高性能的基于事务处理的语言，能运行在任何Oracle环境中，支持所有数据处理命令。通过使用PL/SQL程序单元处理SQL的数据定义和数据控制元素。

•　PL/SQL支持所有SQL数据类型和所有SQL函数，同时支持所有Oracle对象类型。

•　PL/SQL块可以被命名和存储在Oracle服务器中，同时也能被其他的PL/SQL程序或SQL命令调用，任何客户／服务器工具都能访问PL/SQL程序，具有很好的可重用性。

•　可以使用Oracle数据工具管理存储在服务器中的PL/SQL程序的安全性。可以授权或撤销数据库其他用户访问PL/SQL程序的能力。

•　PL/SQL代码可以使用任何ASCII文本编辑器编写，所以对任何Oracle能够运行的操作系统都是非常便利的。

•　对于SQL，Oracle必须在同一时间处理每一条SQL语句，在网络环境下这就意味着每一个独立的调用都必须被Oracle服务器处理，这就占用大量的服务器时间，同时导致网络拥挤。PL/SQL是以整个语句块发给服务器，这就降低了网络拥挤。

# PL/SQL语句块

```plsql
declare:声明部分
begin
编写主题
exception捕获异常
end;
```

Oracle提供了四种类型的可存储程序

- 函数
- 过程
- 包
- 触发器

# 变量的声明和赋值

案例

```plsql
declare
    numa number not null:=150; --定义一个变量 并进行赋值
    numb number;--定义变量 没有进行赋值
begin
    numb:=30;--设置变量的内容
    DBMS_OUTPUT.PUT_line('两数之和为:'||(numa+numb)); --输出变量
end;
/
```

```plsql
declare
    eno emp.empno%type;--定义员工编号,并于emp表的empno列的数据类型一致
    ena emp.ename%type;
begin
    eno:=&empno;--键盘赋值
    select ename into ena from emp where empno=eno;
    DBMS_OUTPUT.PUT_line('编号为: '||eno||'的员工名称为: '||ena); --输出变量
end;
/
```

使用record声明变量类型

```plsql
type 名称 is record
(
	成员变量声明 变量名称 表名称.字段名称%type
)
```

```plsql
declare
    type emp_type is record
    (
        var_ename varchar2(20),
        var_job varchar2(20),
        var_sal NUMBEr
    );
    empinfo emp_type; --定义变量
begin
    select ename,job,sal
    into empinfo
    from emp
    where empno=7369;
    
    DBMS_OUTPUT.PUT_line('员工: '||empinfo.var_ename||'的职务是: '||empinfo.var_job||'工资是:'||empinfo.var_sal); --输出变量
end;
/
```

使用%rowtype

```plsql
declare
    rowvar_emp emp%rowtype;--直接复制表的行数据类型
begin
    select *
    into rowvar_emp
    from emp
    where empno=7369;
    
    DBMS_OUTPUT.PUT_line('员工: '||rowvar_emp.ename||'的职务是: '||rowvar_emp.job||'工资是:'||rowvar_emp.sal); --输出变量
end;
/
```

# 流程控制语句

## 选择语句

PL/SQL编程语言提供以下类型的决策语句。请点击以下链接来查看它们的细节。

| 编号 | 语句                                                         | 说明                                                         |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | [if-then语句](http://www.yiibai.com/plsql/plsql_if_then.html) | `IF`语句将条件与关键字`THEN`和`END IF`包含语句序列相关联。如果条件为`true`，则语句将被执行，如果条件为`false`或`NULL`，则`IF`语句不会执行任何操作。 |
| 2    | [if-then-else语句](http://www.yiibai.com/plsql/plsql_if_then_else.html) | `IF`语句添加了关键字`ELSE`，后跟一个备选的语句序列。如果条件为`false`或`NULL`，则只有备选的语句序列被执行。它只执行语句序列中的任一个。 |
| 3    | [if-then-elsif语句](http://www.yiibai.com/plsql/plsql_if_then_elsif.html) | 它允许选择几种备选方案。                                     |
| 4    | [case语句](http://www.yiibai.com/plsql/plsql_case_statement.html) | 像`IF`语句一样，`CASE`语句选择要执行的一个语句序列。但是，要选择序列，`CASE`语句使用选择器而非多个布尔表达式。选择器是一个表达式，它的值用于选择几种备选方案之一。 |
| 5    | [搜索CASE语句](http://www.yiibai.com/plsql/plsql_searched_case.html) | 被搜索CASE语句没有选择器，它的`WHEN`子句将包含产生布尔值的搜索条件。 |
| 6    | [嵌套if-then-else语句](http://www.yiibai.com/plsql/plsql_nested_if.html) | 可以在一个`IF-THEN`或`IF-THEN-ELSIF`语句中使用另一个`IF-THEN`或`IF-THEN-ELSIF`语句。 |

​					//原文出自【易百教程】，商业转载请联系作者获得授权，非商业转载请保留原文链接：https://www.yiibai.com/plsql/plsql_conditional_control.html 

if-elsif语句

```plsql
set serveroutput on;
declare
    month int;
begin
    month:=&inputmonth;
    if month>=1 and month<=3 then
        dbms_output.put_line('这是春季');
    elsif month>=4 and month<=6 then
        dbms_output.put_line('这是夏季');
    elsif month>=7 and month<=9 then
        dbms_output.put_line('这是秋季');
    elsif month>=10 and month<=12 then
        dbms_output.put_line('这是冬季');
     else
        dbms_output.put_line('对不起,月份不合法!');
    end if;
end;
/
```

case语句

```plsql
SET SERVEROUTPUT ON SIZE 1000000;
DECLARE 
   grade char(1) := 'A'; 
BEGIN 
   CASE grade 
      when 'A' then dbms_output.put_line('Excellent'); 
      when 'B' then dbms_output.put_line('Very good'); 
      when 'C' then dbms_output.put_line('Well done'); 
      when 'D' then dbms_output.put_line('You passed'); 
      when 'F' then dbms_output.put_line('Better try again'); 
      else dbms_output.put_line('No such grade'); 
   END CASE; 
END; 
```

WHILE LOOP

> 只要给定条件为真，PL/SQL编程语言中的`WHILE LOOP`语句重复执行目标语句。

```
SET SERVEROUTPUT ON SIZE 1000000;
DECLARE 
   a number(2) := 10; 
BEGIN 
   WHILE a < 20 LOOP 
      dbms_output.put_line('value of a: ' || a); 
      a := a + 1; 
   END LOOP; 
END; 

```

goto语句



```plsql
SET SERVEROUTPUT ON SIZE 99999;
DECLARE 
   a number(2) := 10; 
BEGIN 
   <<loopstart>> 
   -- while loop execution  
   WHILE a < 20 LOOP
   dbms_output.put_line ('value of a: ' || a); 
      a := a + 1; 
      IF a = 15 THEN 
         a := a + 1; 
         GOTO loopstart; 
      END IF; 
   END LOOP; 
END; 
```

