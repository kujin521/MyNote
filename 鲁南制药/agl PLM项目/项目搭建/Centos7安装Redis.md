### 开放远程接口6379

```bash
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```

## 利用Docker安装Redis

1.拉取最新版的Redis镜像

```bash
docker pull redis:latest
```

2.查看本地镜像

```bash
docker images
```

3.运行镜像

```bash
docker run -d --name redis -p 6379:6379 redis --requirepass "Kujin521"
```