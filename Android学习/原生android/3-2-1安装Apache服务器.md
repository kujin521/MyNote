# 打开Apache文件夹：

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116191738802-1520378758.png)

# 打开conf文件夹下的：httpd.conf文件，将Apache的目录位置修改为当前你Apache安装存放的位置：

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116192340009-252139911.png)

# 在cmd命令下输入：netstat -a，查看80端口是否被占用，如果被占用，将：httpd.conf文件中的80端口改为其他端口后保存

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116192853889-223879327.png)

# 配置安装Apache的主服务，在cmd中输入："E:\\Apache-2.4.37\Apache\bin\httpd.exe" -k install -n apache，注意一定要加引号，然后回车，如果出现如下信息，说明配置成功了，如果出现：“os 5拒绝访问”的错误，说明是你的管理权限限制，这个时候关闭cmd，然后重新以管理员身份运行cmd，再进行上一步操作，问题就能解决了：

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116193655296-284734092.png)

# 启动Apache服务：双击bin目录下的：ApacheMonitor.exe，然后会在电脑右下角出现它的显示符号，双击这个符号，在弹出的窗口中点击start就行了。

　　注意：关闭Apache服务点击stop来关闭，当然也可以Windows系统来关闭

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116193905150-1782682408.png) 

 ![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116194605315-1293110702.png)

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116194636633-1358003770.png)

# 打开浏览器，在网址栏输入：127.0.0.1(或者：http://localhost)，出现如下界面就表示配置成功了

![img](https://img2018.cnblogs.com/blog/1505274/201901/1505274-20190116195213945-320211796.png)