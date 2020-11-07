# Oracle监听程序

>  **运行在Oracle服务器端用于侦听客户端请求的程序**

 ![image-20200922101447445](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922101526.png)

## 应用场景

- Oracle 数据库软件安装监听器之后没有监听程序(服务)
- Oracle原有监听程序无法正常的监听客户端请求

## 添加/删除监听程序

> Oracle net configuration assistant

官方文档: https://docs.oracle.com/en/database/oracle/oracle-database/12.2/sscli/using-oracle-net-configuration-assistant.html#GUID-A81F5CBC-AA46-43E4-BF6F-30A4988689D9

**翻译如下**

### 使用 Oracle 网络配置助手

在自定义 Oracle 数据库客户端安装中，如果选择 Oracle 网络侦听器，则 Oracle 通用安装程序 （OUI） 将启动 Oracle 网络配置助手。

Oracle 建议您准备好有关安装 Oracle 数据库的计算机的主机名的信息。

执行以下步骤以使用 Oracle 网络配置助手配置侦听器和命名方法：

1. 在"欢迎"屏幕中，单击"下一**步"。**

   您还可以选择为**默认网络配置执行**典型配置。

2. 根据需要响应配置提示和屏幕。屏幕因所选选项而异。在安装过程中的任何时间，如果您对被要求做什么有问题，请单击"帮助**"。**

3. 您还可以在数据库客户端安装完成后以独立模式运行 Oracle 网络配置助手，以配置侦听器、命名方法、网络服务名称和目录服务器使用情况。要在独立模式下启动 Oracle 网络配置助手`，从"ORACLE_HOME/bin` `目录运行 netca。`

![image-20200922103019978](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922103020.png)

  ![image-20200922103203685](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922103203.png)

![](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922103221.png)

![image-20200922103445055](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922103540.png)

![image-20200922103601657](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200922103601.png)

我出现的错误

如果出现监听端口 被占用,我修改了端口还是显示端口被占用

 有可能是 hosts文件没配好

```bash
vi /etc/hosts
# 你的IP地址
192.168.21.129 testlab.com.bd testlab
```

