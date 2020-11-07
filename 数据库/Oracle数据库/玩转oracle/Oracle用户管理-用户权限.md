## Oracle权限

权限分类

- 系统权限
  - 系统规定用户使用数据库的权限。（系统权限是对用户而言*)*。
    - 建库 建表 登录数据库..
- 实体(对象)权限
  - 某种权限用户对其它用户的表或视图的存取权限。（是针对表或视图,过程…而言的）
    - select	inset	update	delete	all(对以上的统称) create index ….

## 角色

包含一系列特定的权限

> 预定义角色
>
> 自定义角色

以下是一些主要的

- connect  登录建表权限
- dba (权限最大,可以删库跑路)
- resource 表空间建表权限

# Oracle用户权限

> oracle安装完成后会生成一些用户
>
> sys用户 :超级管理员
>
> system用户: 
>
> 自己创建的普通用户

## 操作普通用户

> 1. 登录管理员用户
> 2. 创建普通用户
> 3. 给普通用户授予权限
> 4. 修改用户密码(可选)
> 5. 删除用户 (管理员权限)(不可自杀)  

```plsql
# 1 连接到管理员用户 
conn / as sysdba
# 2 创建普通用户
create user kujin identified by oracle123
# 3 给普通用户赋登录权限,这里直接赋予一个角色
grant connect to kujin
# 4 修改密码 管理员>普通用户
alter user 用户名 identified by 新密码
# 5 删除用户 如果用户有表 添加cascade
drop user 用户名 [cascade]
```



## 用户关于权限使用场景

- 用户 y1 创建 表 

  - 用户需要在表空间system 权限

    ```sql
    grant resource to y1
    ```

- 希望 y1 使用 y2 中的tmp表

  - y2 授权 y1 可以查询tmp表

    ```plsql
    grant select on tmp to y1
    ```

  - 同理 select 可以更换为 其他对象权限 all:代表所有的

    ```plsql
    grant update on tmp to y1
    ```

- 收回 y1 对y2表操作的权限 (切换到y2用户下)

  ```
  revoke select on tmp from y1
  ```

- 希望 y2 可以查询 y1中tmp表  还希望y2 可以把这个权限 给被人

  - 对象权限**with grant option** 

  ```plsql
  grant select on tmp to y2 with grant option
  ```

  - 如果是系统权限

    **with admin option**

    

  - 如果y1 收回了y2 可以查询tmp表的权限 那么 y2 赋予其他人查询该表的权限 失效
