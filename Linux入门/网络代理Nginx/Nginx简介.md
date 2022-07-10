

## Nginx简介

[官方入门指南](http://nginx.org/en/docs/beginners_guide.html)

	Nginx是什么？能干什么？有什么特点？

1. 轻量级web服务器，也是一款反向代理服务器
2. 可直接支持Rails和PHP的程序
3. 可作为http反向代理服务器
4. 负债均衡服务器
5. 邮件代理服务器
6. 帮助前端动静分离

## Linux 安装

[官方安装教程（网速会很慢）](http://nginx.org/en/linux_packages.html#RHEL-CentOS) 

#### rpm 包方式（推荐）

（1）进入[下载页面](http://nginx.org/packages/)，选择合适版本下载。

```
$ wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
```

（2）安装 nginx rpm 包

nginx rpm 包实际上安装的是 nginx 的 yum 源。

```
$ rpm -ivh nginx-*.rpm
```

（3）正式安装 rpm 包

```
$ yum install nginx
```

（4）关闭防火墙

```
$ firewall-cmd --zone=public --add-port=80/tcp --permanent
$ firewall-cmd --reload
```

6. 
## Nginx命令
	1. 启动systemctl start nginx
	2. 停止systemctl stop nginx
	3. 状态systemctl status nginx
	4. 重启systemctl reload nginx
```
nginx -s stop       快速关闭Nginx，可能不保存相关信息，并迅速终止web服务。
nginx -s quit       平稳关闭Nginx，保存相关信息，有安排的结束web服务。
nginx -s reload     因改变了Nginx相关配置，需要重新加载配置而重载。
nginx -s reopen     重新打开日志文件。
nginx -c filename   为 Nginx 指定一个配置文件，来代替缺省的。
nginx -t            不运行，仅仅测试配置文件。nginx 将检查配置文件的语法的正确性，并尝试打开配置文件中所引用到的文件。
nginx -v            显示 nginx 的版本。
nginx -V            显示 nginx 的版本，编译器版本和配置参数。
```

## Nginx实战



















