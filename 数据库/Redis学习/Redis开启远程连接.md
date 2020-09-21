# Redis启动配置

## 修改redis.conf 配置文件 

```
# linux 命令
vi redis.conf
/dae 找到目标字符
i:修改
wq:保存退出
```

daemonize  yes ：表示以守护进程的方式启动，后台启动

## 开启远程连接

### 开放端口6379

```
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=6379/tcp --permanent   # 开放6379端口
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```

![image-20200912151748877](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200912151748877.png)

Redis默认不支持远程连接，需要手动开启

### 修改redis.conf文件

1. 注释bind 127.0.0.1

2. 开启密码校验 

   ```
   requirepass kujin
   ```

   ![image-20200723140632512](https://gitee.com/ku521/Typora_images/raw/master/image/image-20200723140632512.png)

3. 保存退出，重启redis 

   ```shell
   redis-server redis.conf
   ```

![image-20200912151606183](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200912151606183.png)