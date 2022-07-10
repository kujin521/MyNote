## NGXINX Docs入门文档（基于官方文档记录）

官方地址:[NGINX Plus](https://docs.nginx.com/nginx/)

> 注意：NGINX开源是免费的，NGINX Plus是企业级收费版

##  1. [安装NGINX和NGINX Plus](https://docs.nginx.com/nginx/admin-guide/installing-nginx/)

### 1.1[安装NGINX开源](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)

#### 从操作系统存储库安装预构建的 CentOS/RHEL 软件包

1. 安装 EPEL 存储库：

   ```shell
   $ sudo yum install epel-release
   ```

2. 更新存储库：

   ```shell
   $ sudo yum update
   ```

3. 安装NGINX开源：

   ```shell
   $ sudo yum install nginx
   ```

4. 验证安装：

   ```shell
   $ sudo nginx -v
   nginx version: nginx/1.6.3
   ```

### 1.2 [在 Docker 上部署 NGINX 和 NGINX Plus](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/)

#### 在 Docker 容器中运行 NGINX 开源

启动在容器中运行的NGINX实例，并使用默认的NGINX配置，并带有以下命令：

```shell
$ docker run --name mynginx1 -p 80:80 -d nginx
```

验证容器是否已创建并正在使用以下命令运行：`docker ps`

## 2. [基本功能](https://docs.nginx.com/nginx/admin-guide/basic-functionality/)

#### 配置文件

> 默认情况下，该文件名为**nginx.conf**，对于NGINX Plus，该文件位于**/etc/nginx**目录中。（对于NGINX开源，位置取决于用于安装NGINX的软件包系统和操作系统。它通常是 **/usr/local/nginx/conf**、**/etc/nginx** 或 **/usr/local/etc/nginx** 之一。





## 3. [负载均衡器](https://docs.nginx.com/nginx/admin-guide/load-balancer/)



## 4. [内容缓存](https://docs.nginx.com/nginx/admin-guide/content-cache/)



## 5 . [网页服务器](https://docs.nginx.com/nginx/admin-guide/web-server/)



## 6. [安全控制](https://docs.nginx.com/nginx/admin-guide/security-controls/)



## 7. [监测](https://docs.nginx.com/nginx/admin-guide/monitoring/)



## 8. [高可用性](https://docs.nginx.com/nginx/admin-guide/high-availability/)



## 9. [动态模块](https://docs.nginx.com/nginx/admin-guide/dynamic-modules/)



## 10. [邮件代理](https://docs.nginx.com/nginx/admin-guide/mail-proxy/)



