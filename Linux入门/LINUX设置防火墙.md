**Linux**设置防火墙 

> 2019.02.25 11:01:08字数 42阅读 189
>
> Centos 7之前的防火墙基本都是修改iptables

service iptables status 查看防火墙状态

service iptables start 开启防火墙

service iptables stop 关闭防火墙

service iptables restart 重启防火墙

Centos 7之后的防火墙升级为Firewall，取代了之前的iptables

其常用命令为：

firewall-cmd --state ##查看防火墙运行状态，

是否是running

firewall-cmd --reload ##重新载入配置，比如添加规则之后，需要执行此命令

firewall-cmd --get-zones ##列出支持的zone 

firewall-cmd --get-services ##列出支持的服务，在列表中的服务是放行的

firewall-cmd --list-ports ##列出开放的端口

firewall-cmd --query-service ftp ##查看ftp服务是否支持，返回yes或者no 

firewall-cmd --add-service=ftp ##临时开放ftp服务

firewall-cmd --add-service=ftp --permanent ##永久开放ftp服务

firewall-cmd --remove-service=ftp --permanent ##永久移除ftp服务

firewall-cmd --add-port=80/tcp --permanent ##永久添加80端口

iptables -L -n ##查看规则，这个命令是和iptables的相同的

man firewall-cmd ##查看帮助systemctl stop firewalld ##关闭防火墙

systemctl start firewalld ##开启防火墙

systemctl status firewalld ##查看防火墙状态

systemctl restart firewalld ##重启防火墙

systemctl disable firewalld ##开机关闭防火墙，即永久关闭
