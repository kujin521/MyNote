# 简介
	vsftpd是“very secure FTP daemon”的缩写是一个完全免费，开放源代码的ftp服务器软件
# 特点
	vsftpd是一款Linux发行版中最受推崇的ftp服务器程序，小巧轻快，安全易用，支持带宽限制等功能
# 安装
	1. 执行 yum -y install vsftpd
		1. 默认配置文件在/etc/vsftpd/vsftpd.conf
	2. 创建虚拟用户
		1. 选择根或者用户目录下创建ftp文件夹：mkdir ftpfile,如：/ftpfile
		2. 添加匿名用户：useradd ftpuser -d /ftpfile -s /sbin/nologin
		3. 修改ftpfile权限：chown -R ftpuser.ftpuser /ftpfie
		4. 重设ftpuser密码：password ftpuser(12346)
	3. 配置
		1. cd /etc/vsftpd
		2. sudo vim chroot_list
		3. 把刚才新增的虚拟用户添加到此配置文件中，后续要引用
		4. :wq 保存退出
		5. sudo vim /etc/selinux/config,修改SELINUX=disabled
		6. :wq 保存退出
			如果遇到550拒绝访问执行sudo setsebool -P ftp_home_dir 1
			然后重启linux服务区，执行reboot命令
		7. sudo vim /etc/vsftpd/vsftpd.conf
		8. 添加配置或更新配置
	4. 防火墙配置
		1. sudo vim /etc/sysconfig/iptables
		2.1. -A INPUT -p TCP --dport 61001:62000 -j ACCEPT
		2.2. -A OUTPUT -p TCP --sport 61001:62000 -j ACCEPT

		2.1. -A INPUT -p TCP --dport 20 -j ACCEPT
		2.2. -A OUTPUT -p TCP --sport 20 -j ACCEPT	

		2.1. -A INPUT -p TCP --dport 21 -j ACCEPT
		2.2. -A OUTPUT -p TCP --sport 21 -j ACCEPT	
		3. :wq 保存退出
		4. sudo service iptables restart 执行命令重启防火墙
# vsftpd验证
	1. 执行 sodo service vsftpd restart
	2. 执行ifconfig 查看运行vsftpd服务器的ip地址
	3. 打开浏览器访问：ftp://10.211.55.6
	4. 输入之前创建的ftp匿名用户账号和密码
	5. 通过ftp客户端软件
# 常用命令
	启动 sudo service vsftpd start
	关闭 sudo service vsftpd stop
	重启 sudo service vsftpd restart