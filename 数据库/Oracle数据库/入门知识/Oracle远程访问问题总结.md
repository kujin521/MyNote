# 1. 创建数据库

```bash
dbca
```

**关键点**: 数据库名 口令设置  口令管理 需要有没被锁定的用户 默认sysbda

# 2. 开启监听

## 打开端口或关闭防火墙

```bash
# 切换到管理员
su root
#查看端口状态
firewall-cmd --state
#开放端口
firewall-cmd --zone=public --add-port=1521/tcp --permanent  # 开放1521端口
#firewall-cmd --zone=public --remove-port=1521/tcp --permanent #关闭1521端口
firewall-cmd --reload  # 配置立即生效
```

## **创建监听服务**

```bash
netca
```

**创建过程如果出现端口被占用 继续创建完成,检查问题**

- 查看端口,如果没有显示,则证明端口没有被监听

  ```
  netstat -tunlp|grep 1521
  ```

  ![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200923144448.png)

- hostname 不一致,会导致监听服务启动失败,显示所有端口都被占用

  - 查看本地hostname,首先切换root用户,查看配置的hosts文件

    ```
    # 切换用户
    su root
    # 配置hosts
    vi /etc/hosts
    # 添加 ip oralce
    su oracle
    ```

    ![image-20200922224721185](../../../../AppData/Roaming/Typora/typora-user-images/image-20200922224721185.png)

    ![image-20200922224511004](../../../../AppData/Roaming/Typora/typora-user-images/image-20200922224511004.png)

  - 配置监听文件(也可单独修改文件)

    - TCP ipv4地址(如果不是TCP,可能是ipv6地址,需要修改成tcp)

      
    - HOST 改为oracle 或则 你的ip地址
  - PORT 可以设为指定端口号 默认1521
    
    ```bash
    cd $ORACLE_HOME
    vi network/admin/listener.ora 
    ```


  ![image-20200922225500062](../../../../AppData/Roaming/Typora/typora-user-images/image-20200922225500062.png)

- **启动监听服务,启动数据库实例**
  
    ```bash
    # 查看服务状态
    lsnrctl status
    # 启动监听
    lsnrctl start
  ```
  
  先本地登录测试
  
    ```
    # 登录
    sqlplus / as sysdba
    # 启动数据库实例
    SQL> startup
    # 关闭数据库实例
    # shtutdown
    ......
    # system用户 登录Oracle
    sqlplus
    用户名
    密码
    
    ```

# 3. 账户设置

> 客户端 我是用的Navcat12 登录, 出现的错误总结

## 错误码 ORA-28040

> ORA-28040: No matching authentication protocol

按照官方说法在服务端sqlnet.ora下需要添加如下参数。

SQLNET.ALLOWED_LOGON_VERSION_CLIENT

SQLNET.ALLOWED_LOGON_VERSION_SERVE

```bash
[oracle@host02 admin]$ pwd

/u01/app/oracle/product/18.3.0/dbhome_1/network/admin

[oracle@host02 admin]$ more  sqlnet.ora

#SQLNET.ALLOWED_LOGON_VERSION_SERVER=11

#SQLNET.ALLOWED_LOGON_VERSION_CLIENT=10

SQLNET.ALLOWED_LOGON_VERSION=8

SQLNET.ALLOWED_LOGON_VERSION_CLIENT=8

SQLNET.ALLOWED_LOGON_VERSION_SERVE=10
```



## 错误码 ORA-01017

> 提示错误：ORA-01017: invalid username/password; logon denied 错误(程序中的用户和密码无法登录，登录被拒)。

1. 检查用户名和密码是否正确(上面的本地测试)
2. 检查监听文件是否配置正确(上面有)

**相关查询语句**

```
select * from dba_users;
# 如果用户被锁定,给账号解锁
alter user user1 account unlock;   
```

## 修改账户 密码方式

todo

### **永久禁用IPv6**

以上方法是不能永久禁用IPv6的，你一旦重启系统IPv6还是会被启用。如果你想要永久关闭它，有几个方法你可以试试。
**方法一**
第一种方法是通过 /etc/sysctl.conf 文件对 /proc 进行永久修改。
换句话说，就是用文本编辑器打开 /etc/sysctl.conf 然后添加以下内容：

复制代码代码如下:
\# 禁用整个系统所有接口的IPv6
net.ipv6.conf.all.disable_ipv6 = 1
\# 禁用某一个指定接口的IPv6(例如：eth0, lo)
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.eth0.disable_ipv6 = 1
在 /etc/sysctl.conf 使这些更改生效，运行以下命令：

复制代码代码如下:
$ sudo sysctl -p /etc/sysctl.conf
或者直接重启。