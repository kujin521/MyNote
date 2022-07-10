### 开放远程接口

```bash
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```

## docker 安装 mysql 8 版本

```bash
# docker 中下载 mysql
docker pull mysql

#启动
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Kujin521 -d mysql

#进入容器
docker exec -it mysql bash

#登录mysql
mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Kujin521';

#添加远程登录用户
CREATE USER 'kujin'@'%' IDENTIFIED WITH mysql_native_password BY 'Kujin521';
GRANT ALL PRIVILEGES ON *.* TO 'kujin'@'%';
```

