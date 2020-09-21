[TOC]

# 启动 Redis

```
$ redis-server
```

## 后台启动Redis

1. 配置文件

   ```
   vi redis-conf
   daemonize no 改为 daemonize yes
   :wq 退出
   ```

   ![image-20200912161551897](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200912161551897.png)

2.  后台启动成功

   ```
   redis-server redis.conf
   ```

   ![image-20200912161954239](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200912161954239.png)

3. 

### 查看 redis 是否启动？

```
$ redis-cli
```

以上命令将打开以下终端：

```
redis 127.0.0.1:6379>
```

127.0.0.1 是本机 IP ，6379 是 redis 服务端口。现在我们输入 PING 命令。

```
redis 127.0.0.1:6379> ping
PONG
```