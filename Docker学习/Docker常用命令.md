## docker系统操作

查看docker信息

```shell
docker indo
```

启动docker

```shell
systemctl start docker
```

## 镜像

查看所有镜像

```shell
docker images
```

查找镜像

```shell
docker search <image_id/name>
```

下载镜像

```shell
docker pull <image>
```

删除镜像

```shell
docker rmi <image_id>
```



## 容器操作

###### 查看当前运行的容器

```shell
docker ps
```

###### 查看所有容器

```dockerfile
docker ps -adoc
```

###### 查看最新创建的容器

```shell
docker ps -l
```

进入运行中的容器

```shell
docker exec -it {容器ID}
```

删除容器

```shell
docker stop {容器ID}
```

删除停止的容器

```shell
docker container prune
```

实时监听Docker运行日志

```
docker logs -f {容器名}
```



