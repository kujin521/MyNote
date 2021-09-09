## 关闭SELinux和启动docker服务

关闭SELinux

- 永久方法：修改/etc/selinux/config文件中设置SELINUX=disabled ，然后重启。
- 临时方法：执行`setenforce 0`命令设置SELinux成为permissive模式

```
sudo systemctl status firewalld.service
sudo systemctl stop firewalld.service          
sudo systemctl disable firewalld.service
```

### 设置docker开机启动

```bash
systemctl  enable docker.service
```

### 启动容器开启启动 加入 --restart=always 

no不自动重启容器. (默认value)

on-failure 容器发生error而退出(容器退出状态不为0)重启容器

unless-stopped 在容器已经stop掉或Docker stoped/restarted的时候才重启容器

always 在容器已经stop掉或Docker stoped/restarted的时候才重启容器

###  如果已经过运行的项目，使用update更新

```bash
docker update --restart=always 容器名称
```

