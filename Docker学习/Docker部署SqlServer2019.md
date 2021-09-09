### 开放远程接口

```bash
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=1433/tcp --permanent
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```

## 拉取Sqlserver2019镜像

```bash
sudo docker pull mcr.microsoft.com/mssql/server:2019-latest
```

## 运行镜像

```bash
sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Kujin521" \
   -p 1433:1433 --name sqlserver -h sqlserver \
   -d mcr.microsoft.com/mssql/server:2019-latest
```

查看运行的容器

```bash
sudo docker ps -a
```

如果未启动，查看日志

```bash
docker logs {容器id}
```

# 服务器内连接到SQLserver

```javascript
sudo docker exec -it sql1 "bash"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'Kujin521'
```

配置远程访问

```sql
EXEC sp_configure 'remote access', 0 ;  
GO  
RECONFIGURE ;  
GO
```

容器外工具连接

```bash
sqlcmd -S 192.168.182.131 -U SA -P 'Kujin521'
```

