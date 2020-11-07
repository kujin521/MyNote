## 使用profile管理用户口令

> profile是口令限制, 资源限制的命令集合
>
> 当建立数据库时 oracle 会自动建立名称为default的profile
>
> 当建立用户没有指定prifile 选项时 那么 oracle 就会 将default分配给用户

### 1. 账户锁定

> 指定该账户 登录时 最多可以输入密码次数
>
> 可以指定用户锁定的时间 一般用dba 的身份 去执行该命令

```plsql
# 创建profile文件
# create profile 规则名称
# limit faile_login_attempts 3 限制登录失败的次数为3次
# password_lock_time 2 锁定时间为2天
create profile lock_account limit faild_login_attempts 3 password_lock_time 2;
# 更改用户配置文件
alter user y1 profile lock_account
```

- 给用户解锁 (管理员权限)

  ```plsql
  alter user y1 account unlock
  ```

- 终止口令

  为了让用户定期修改密码 可以使用终止口令的指令 来完成

  统一这个命令也需要dba身份来操作

  ```plsql
  # 要求用户每隔10天修改 密码 宽限期2天
  create profile myprofile limit password_life_time 10 password_grace_time 2;
  # 修改配置
  alter user y2 profile myprofile
  ```

- 口令历史

  如果希望用户在修改密码时, 不能使用以前的密码 可使用口令历史

  当用户修改密码时 Oracle就会对新旧密码进行比较 当发现密码一样时

  提示用户重新输入密码

  ```plsql
  # 建立profile
  # password_reuse_time 指定口令可以重用的时间
  create profile password_history limit password_ilfe_itme 10 password_grace_time 2 password_reuse_time 10
  
  ```

- 删除profile

  > 当不需要某个profile文件 可以删除该文件 [cascade] 文件被使用强行删除

  ```
  drop profile password_history [cascade]
  ```

  

  