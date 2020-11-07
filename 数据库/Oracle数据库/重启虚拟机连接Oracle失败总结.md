## 检查IP地址

是否和 host 文件一致

```shell
ifconfig
vi /etc/hosts
```

## 启动监听

```shell
# 查看监听状态
lsnrctl status
# 启动监听
lsnrctl start
# 再次查看监听状态
lsnrctl status
```

## 启动数据库

```sql
# 登录 sys
sqlplus / as sysdba
# 启动数据库
startup
# 登录本地管理员 system
conn system
输入密码
```

## 开放防火墙端口

如果远程连接超时

```shell
# 切换到管理员
su root
#查看端口状态
firewall-cmd --state
#开放端口
firewall-cmd --zone=public --add-port=1521/tcp --permanent  # 开放1521端口
#firewall-cmd --zone=public --remove-port=1521/tcp --permanent #关闭1521端口
firewall-cmd --reload  # 配置立即生效
```

