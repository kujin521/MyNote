<div id="cnblogs_post_body" class="blogpost-body ">
    <p>&nbsp;</p>
<p>问题，在idea中出现乱码问题，以前没有的，好像在设置系统代码为utf8之后就出现了，于是尝试了一系列办法，希望这些办法对您有帮助。</p>
<p>先看一下乱码的样式。</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124093506839-714069128.png" alt=""></p>
<p>设置办法</p>
<p>1、在tomcat Server中设置 VM options , 值为&nbsp;-Dfile.encoding=UTF-8 ，可惜没生效</p>
<p>1<img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124093658943-1191924990.png" alt=""></p>
<p>&nbsp;</p>
<p>2、在setting中的 File encodings 中设置编码格式，后来发现这是设置页面编码格式的，所以也没生效，不过遇到相关问题的朋友也不防照此设置下。</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124094119079-1885159073.png" alt=""></p>
<p>3、在java Complier中设置Additional command line parameters的值，-encoding=UTF-8，很可惜还没生效</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124094405855-2002294699.png" alt=""></p>
<p>4、在bin中设置idea.exe.vmoptions和idea64.exe.vmoptions中的参数，同时增加-Dfile.encoding=UTF-8，据说有些人保存后重启就可以了，但到我这边还是没生效。</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124094613937-68757272.png" alt=""></p>
<p>5、在tomcat \bin目录下的catalina.bat文件中加入&nbsp;-Dfile.encoding=UTF-8，可是还不生效，有些抓狂了...</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124094827745-504540766.png" alt=""></p>
<p>6、在 tomcat / conf 目录下，设置&nbsp;logging.properties ，增加参数&nbsp;&nbsp;java.util.logging.ConsoleHandler.encoding = GBK，重启后终于可以了，总算松了口气。</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124094951059-25415614.png" alt=""></p>
<p>终于，正常显示了......</p>
<p><img src="https://img2018.cnblogs.com/blog/717943/201901/717943-20190124095057327-1632560035.png" alt=""></p>
<p>7、另外在服务器上tomcat还需要设置&nbsp;server.xml中的参数，以防页面出现乱码</p>
<p>&lt;Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000"&nbsp; redirectPort="8443"&nbsp; URIEncoding="UTF-8" /&gt;</p>
<p>&lt;Connector port="8009" protocol="AJP/1.3" redirectPort="8443" URIEncoding="UTF-8" /&gt;</p>
