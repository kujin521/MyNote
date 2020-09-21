# CentOS镜像使用帮助
[http://mirrors.163.com/.help/centos.html](http://mirrors.163.com/.help/centos.html)
	1. 首先下载 wget
		yum install wget
	2. 其次进行备份
		 mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
	3. 进入 /etc/yum.repos.d/ 目录，下载下载对应版本repo文件
		cd /etc/yum.repos.d/
		wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
	4. 运行以下命令生成缓存
		yum clean all
		yum makecache