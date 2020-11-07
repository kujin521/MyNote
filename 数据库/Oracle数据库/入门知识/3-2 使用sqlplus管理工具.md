# SQL * Plus

Oracle自带管理工具

1. 对数据增删改查 操作
2. 对查询数据的结果进行格式化显示
3. 对数据库( 用户 角色 表空间 数据表) 进行管理

## 启动sqlplus

```bash
sqlplus
```

## 用户登录

- 本地管理员登录(sys用户) sys/pwd as sysdba
- 网络用户登录(system用户) system/pwd

## 连接数据库

- 默认连接orcl 数据库
- 连接指定数据库 用户名/密码 @SID

执行SQL指令

- SQL指令 结构化查询数据语言 用于完成对数据库对象及数据表中的数据操作

## SQL*plus 连接问题

- ora-12560 :**协议适配器错误**
  1. 监听程序正常启动
  2. Oracle数据库实例正常运行
  3. 修改注册表默认SID为Oracle数据库