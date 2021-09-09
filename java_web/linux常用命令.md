# linux常用命令

## 软件操作命令

### 软件包管理 yum

### 安装软件 yum install xxx

### 卸载软件 yum remove xxx

### 搜索软件 yum serach xxx

### 清理缓存 yum clean packages

### 列出已安装 yum list

### 软件包信息 yum info xxx

## 服务器硬件资源和磁盘操作

### 内存：free -m

### 硬盘：df -h

### 负载：w/top

## 文件和文件夹操作命令

### linux文件的目录结构

- 根目录 /
- 家目录 /home
- 临时目录 /tmp
- 配置目录 /etc
- 用户程序目录 /usr 

### 文件基本操作

- ls 查看目录下文件
- touch 新建文件
- mkdir 新建文件夹
- cd 进入目录 
- rm 删除文件或目录
- cp 复制
- mv 移动
- pwd 显示路径

### 文本编辑神器Vim

- Vim安装 yum install vim

### 文件权限 421

- r=4 w=2 x=1  

### 文件搜索 查找 读取

- tail 尾部读取
- head 头部读取
- cat 读取整个文件
- more 分页读取
- less 可控分页
- grep 搜索关键字
- find 查找

	- 可以去菜鸟教程学习

- wc 统计个数

### 文件解压

- 压缩

	- tar –cvf jpg.tar *.jpg       // 将目录里所有jpg文件打包成 tar.jpg 
	- tar –czf jpg.tar.gz *.jpg    // 将目录里所有jpg文件打包成 jpg.tar 后，并且将其用 gzip 压缩，生成一个 gzip 压缩过的包，命名为 jpg.tar.gz 
	- tar –cjf jpg.tar.bz2 *.jpg   // 将目录里所有jpg文件打包成 jpg.tar 后，并且将其用 bzip2 压缩，生成一个 bzip2 压缩过的包，命名为jpg.tar.bz2 
	- tar –cZf jpg.tar.Z *.jpg     // 将目录里所有 jpg 文件打包成 jpg.tar 后，并且将其用 compress 压缩，生成一个 umcompress 压缩过的包，命名为jpg.tar.Z 
	- rar a jpg.rar *.jpg          // rar格式的压缩，需要先下载 rar for linux 
	- zip jpg.zip *.jpg            // zip格式的压缩，需要先下载 zip for linux

- 解压

	- tar –xvf file.tar         // 解压 tar 包 
	- tar -xzvf file.tar.gz     // 解压 tar.gz 
	- tar -xjvf file.tar.bz2    // 解压 tar.bz2 
	- tar –xZvf file.tar.Z      // 解压 tar.Z 
	- unrar e file.rar          // 解压 rar 
	- unzip file.zip            // 解压 zip 

- 总结

	- 1、*.tar 用 tar –xvf 解压 
	- 2、*.gz 用 gzip -d或者gunzip 解压 
	- 3、*.tar.gz和*.tgz 用 tar –xzf 解压 
	- 4、*.bz2 用 bzip2 -d或者用bunzip2 解压 
	- 5、*.tar.bz2用tar –xjf 解压 
	- 6、*.Z 用 uncompress 解压 
	- 7、*.tar.Z 用tar –xZf 解压 
	- 8、*.rar 用 unrar e解压 
	- 9、*.zip 用 unzip 解压

## 系统用户操作命令

### useradd 添加用户

### adduser 添加用户

### userdel 删除用户

### passwd 设置密码

## 防火墙相关设置

### 简介

- 作用：保护服务器安全
- 设置防火墙

	- 开放80，22端口

- 关闭防火墙
- 

### 设置防火墙命令

- 安装：yum install firewalld
- 启动：service firewalld start
- 状态：service firewalld status
- 关闭或禁用：service firewalld stop/disable

## 提权操作sudo 和文件传输操作

### 提权：sudo

- visudo：将普通用户添加到root信任列表中

### 文件下载

- wget ，curl

### 文件上传

- scp

*XMind - Trial Version*