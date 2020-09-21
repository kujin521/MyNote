<p>装好CentOS7后，我们一开始是上不了网的 <br>
<img src="https://img-blog.csdn.net/20180804201654166?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
这时候，可以输入命令dhclient，可以自动获取一个IP地址，再用命令ip addr查看IP <br>
<img src="https://img-blog.csdn.net/20180804201723248?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
不过这时候获取的IP是动态的，下次重启系统后，IP地址也会变化，这时候我们可以把系统的IP设置为静态的，设置步骤如下： <br>
（1）点击VMware虚拟机左上角的“编辑”，选择“虚拟网络编译器”。 <br>
（2）选中VMnet8（NAT模式），再点击右侧的“NAT设置”此时会看到如下界面 <br>
<img src="https://img-blog.csdn.net/20180804201749749?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
（3）在命令行中输入：vim /etc/sysconfig/network-scripts/ifcfg-ens33 <br>
<img src="https://img-blog.csdn.net/20180804201953160?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
（4）此时会进入如下图所示界面 <br>
<img src="https://img-blog.csdn.net/20180804202037986?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
（5）将ONBOOT=no改为yes，将BOOTPROTO=dhcp改为BOOTPROTO=static,并在后面增加几行内容： <br>
IPADDR=192.168.127.128 <br>
NETMASK=255.255.255.0 <br>
GATEWAY=192.168.127.2 <br>
DNS1=119.29.29.29 <br>
<img src="https://img-blog.csdn.net/20180804202050977?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
（6）保存后退出，然后输入命令：systemctl restart network.service来重启网络服务。 <br>
<img src="https://img-blog.csdn.net/20180804202124183?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
（7）再用ip addr查看IP,并用命令ping测试网络的连通性。 <br>
<img src="https://img-blog.csdn.net/20180804202204447?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FraXBhMTE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="这里写图片描述" title=""> <br>
至此，IP即设置完毕。</p>