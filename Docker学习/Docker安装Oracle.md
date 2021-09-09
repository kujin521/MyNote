### 开放远程接口

```bash
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=49161/tcp --permanent
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```



# 码头 - 甲骨文 - xe - 11g

甲骨文快车版 11g 发布 2 在乌本图 18.04 LTS

## **安装（与乌本图 18.04）**

```
docker pull oracleinanutshell/oracle-xe-11g
```

## 码头主作曲

```yml
version: '3'

services: 
  oracle-db:
    image: oracleinanutshell/oracle-xe-11g:latest
    ports:
      - 1521:1521
      - 5500:5500
```

## 快速启动

运行与 1521 端口打开：

```
docker run -d -p 49161:1521 oracleinanutshell/oracle-xe-11g
```

**如果您希望远程连接数据库，请运行此：**

```
docker run -d -p 49161:1521 -e ORACLE_ALLOW_REMOTE=true oracleinanutshell/oracle-xe-11g
```

对于性能问题，您可能需要禁用磁盘无音位 IO：

```
docker run -d -p 49161:1521 -e ORACLE_DISABLE_ASYNCH_IO=true oracleinanutshell/oracle-xe-11g
```

启用具有默认密码的 XDB 用户：xdb，运行此：

```
docker run -d -p 49161:1521 -e ORACLE_ENABLE_XDB=true oracleinanutshell/oracle-xe-11g
```

对于 APEX 用户：

```
docker run -d -p 49161:1521 -p 8080:8080 oracleinanutshell/oracle-xe-11g
# Login http://localhost:8080/apex/apex_admin with following credential:
username: ADMIN
password: admin
```

对于最新的 APEX （18.1） 用户，请先拉奥拉克莱纳努特壳/预言家 xe-11g：18.04-顶点：

```
docker run -d -p 49161:1521 -p 8080:8080 oracleinanutshell/oracle-xe-11g:18.04-apex
# Login http://localhost:8080/apex/apex_admin with following credential:
username: ADMIN
password: Oracle_11g
```

默认情况下，密码验证是禁用的（密码永远不会过
期）将数据库与以下设置连接起来：

```
hostname: localhost
port: 49161
sid: xe
username: system
password: oracle
```

**SYS 和系统密码**

```
oracle
```

支持自定义 DB 初始化和运行空壳脚本

```
# Dockerfile
FROM oracleinanutshell/oracle-xe-11g

ADD init.sql /docker-entrypoint-initdb.d/
ADD script.sh /docker-entrypoint-initdb.d/
```

运行顺序按字母顺序排列。

