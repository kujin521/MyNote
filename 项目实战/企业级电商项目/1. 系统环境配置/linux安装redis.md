清屏

```
 clean
```

下载redis

```
 wget https://download.redis.io/releases/redis-6.2.4.tar.gz
```

解压

```
 tar xzf redis-6.2.4.tar.gz
 ls
```

打开文件夹

```
 cd redis-6.2.4
```

编译

```
 make
```

下载编译需要的依赖 

```
yum install -y cpp
 yum install -y binutils
 yum install -y glibc
 yum install -y glibc-kernheaders
 yum install -y glibc-common
 yum install -y glibc-devel
 yum install -y gcc
 yum install -y make

 # 升级gcc

 yum -y install centos-release-scl
 yum -y install devtoolset-9-gcc devtoolset-9-gcc-c++ devtoolset-9-binutils
 scl enable devtoolset-9 bash
```

再次编译

```
 make
```

编译安装

```
 make install
 redis-server redis.conf
```

编译redis配置文件

```
 vi redis.conf
```



打开防火墙

```
 firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
 firewall-cmd --zone=public --add-port=6379/tcp --permanent   # 开放6379端口
 firewall-cmd --reload   # 配置立即生效
 firewall-cmd --zone=public --list-ports
```

