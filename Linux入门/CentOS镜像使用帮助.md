# CentOS镜像使用帮助

## 163镜像

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

## 清华大学镜像

[centos | 镜像站使用帮助 | 清华大学开源软件镜像站 | Tsinghua Open Source Mirror](https://mirror.tuna.tsinghua.edu.cn/help/centos/)

该文件夹只提供 CentOS 7 与 8，架构仅为 `x86_64` ，如果需要较早版本的 CentOS，请参考 centos-vault 的帮助，若需要其他架构，请参考 centos-altarch 的帮助。

建议先备份 `/etc/yum.repos.d/` 内的文件（CentOS 7 及之前为 `CentOS-Base.repo`，CentOS 8 为`CentOS-Linux-*.repo`）

然后编辑 `/etc/yum.repos.d/` 中的相应文件，在 `mirrorlist=` 开头行前面加 `#` 注释掉；并将 `baseurl=` 开头行取消注释（如果被注释的话），把该行内的域名（例如`mirror.centos.org`）替换为 `mirrors.tuna.tsinghua.edu.cn`。

以上步骤可以被下方的命令一步完成

```
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
```

注意其中的`*`通配符，如果只需要替换一些文件中的源，请自行增删。

注意，如果需要启用其中一些 repo，需要将其中的 `enabled=0` 改为 `enabled=1`。

最后，更新软件包缓存

```
sudo yum makecache
```

## 阿里源

[开发者社区镜像升级通知—阿里云开发者社区 (aliyun.com)](https://developer.aliyun.com/special/mirrors/notice)

