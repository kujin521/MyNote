## Centos7安装mysql8.0
[官方安装教程地址](https://dev.mysql.com/doc/refman/8.0/en/linux-installation.html)
<div class="htmledit_views" id="content_views">
                                            <div id="cnblogs_post_body" class="blogpost-body">
    <h2><a name="t0"></a>CentOS 7 安装 MySQL</h2>
<h3><a name="t1"></a>首先检查 MySQL 是否已安装</h3>
<p>yum list installed | <span class="hljs-keyword">grep mysql</span></p>
<p><span class="hljs-keyword">如果有的话 就全部卸载</span></p>
<p><span class="hljs-keyword"><span class="hljs-selector-tag">yum <span class="hljs-selector-tag">-y <span class="hljs-selector-tag">remove +数据库名称<span class="hljs-selector-tag"><br></span></span></span></span></span></p>
<p><span class="hljs-keyword"><span class="hljs-selector-tag"><span class="hljs-selector-tag"><span class="hljs-selector-tag"><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182138628-598984235.png" alt=""></span></span></span></span></p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182146284-309574833.png" alt=""></p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182150753-216803501.png" alt=""></p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182156316-2043422646.png" alt=""></p>
<h3><a name="t2"></a>MySQL 依赖 libaio，所以先要安装 libaio</h3>
<p><span class="hljs-attribute">yum search libaio <span class="hljs-comment"># 检索相关信息</span></span></p>
<p><span class="hljs-attribute"><span class="hljs-comment"> yum install libaio <span class="hljs-comment"># 安装依赖包</span></span></span></p>
<p><span class="hljs-attribute"><span class="hljs-comment"><span class="hljs-comment"><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182309284-812797022.png" alt=""></span></span></span></p>
<p>&nbsp;</p>
<h3><a name="t3"></a>下载 MySQL Yum Repository</h3>
<p>地址为&nbsp;<a href="http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm" rel="nofollow" data-token="24f8cc217d01a7b0b936d5447908644e">http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm</a></p>
<p>&nbsp;</p>
<p><span class="hljs-attribute">wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm</span></p>
<p><span class="hljs-attribute">然后</span></p>
<h3><a name="t4"></a>添加 MySQL Yum Repository</h3>
<p>添加 MySQL Yum Repository 到你的系统 repository 列表中，执行</p>
<p>&nbsp;</p>
<p><span class="hljs-selector-tag">yum&nbsp;<span class="hljs-selector-tag">localinstall&nbsp;<span class="hljs-selector-tag">mysql-community-release-el7-5<span class="hljs-selector-class">.noarch<span class="hljs-selector-class">.rpm</span></span></span></span></span></p>
<p><span class="hljs-attribute"><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182521706-940146849.png" alt=""></span></p>
<p>如果提示<code>-bash: wget: 未找到命令</code>，请先执行&nbsp;<code>yum install wget</code>&nbsp;安装 wget</p>
<p>&nbsp;</p>
<h3><a name="t5"></a>验证下是否添加成功</h3>
<pre><code class="hljs perl">yum repolist enabled | <span class="hljs-keyword"><span class="hljs-keyword">grep</span> <span class="hljs-string"><span class="hljs-string">"mysql.*-community.*"</span></span></span></code><br><br><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<h3><a name="t6"></a>选择要启用 MySQL 版本</h3>
<p>查看 MySQL 版本，执行</p>
<pre><code class="hljs perl"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">yum repolist all | <span class="hljs-keyword"><span class="hljs-keyword">grep</span> mysql</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>可以看到 5.5， 5.7 版本是默认禁用的，因为现在最新的稳定版是 5.6</p>
<pre><code class="hljs perl"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">yum repolist enabled | <span class="hljs-keyword"><span class="hljs-keyword">grep</span> mysql</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>查看当前的启动的 MySQL 版本</p>
<h3><a name="t7"></a>通过 Yum 来安装 MySQL</h3>
<p>执行</p>
<pre><code class="hljs sql"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">yum <span class="hljs-keyword"><span class="hljs-keyword">install</span> mysql-community-<span class="hljs-keyword"><span class="hljs-keyword">server</span> </span></span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>Yum 会自动处理 MySQL 与其他组件的依赖关系：</p>
<pre><br><br></pre>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105182927534-1130688424.png" alt=""></p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183118300-438733573.png" alt=""></p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183423206-1086888071.png" alt=""></p>
<p>&nbsp;</p>
<p>遇到上述提示，输入 y 继续，执行完成会提示“完毕！”。此时MySQL 安装完成，它包含了 mysql-community-server、mysql-community-client、mysql-community-common、mysql-community-libs 四个包。</p>
<p>执行</p>
<pre><code class="hljs css"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-selector-tag"><span class="hljs-selector-tag">rpm</span> <span class="hljs-selector-tag"><span class="hljs-selector-tag">-qi</span> <span class="hljs-selector-tag"><span class="hljs-selector-tag">mysql-community-server</span><span class="hljs-selector-class"><span class="hljs-selector-class">.x86_64</span> 0<span class="hljs-selector-pseudo"><span class="hljs-selector-pseudo">:5</span><span class="hljs-selector-class"><span class="hljs-selector-pseudo">.6</span><span class="hljs-selector-class"><span class="hljs-selector-pseudo">.24-3</span><span class="hljs-selector-class"><span class="hljs-selector-pseudo">.el7</span></span></span></span></span></span></span></span></span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>执行</p>
<pre><code class="hljs"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-attribute">whereis mysql</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>可以看到 MySQL 的安装目录是 /usr/bin/</p>
<p>&nbsp;</p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183533222-843570707.png" alt=""></p>
<p>&nbsp;</p>
<h2><a name="t8"></a>启动和关闭 MySQL Server</h2>
<h3><a name="t9"></a>启动 MySQL Server</h3>
<pre><code class="hljs sql"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">systemctl <span class="hljs-keyword"><span class="hljs-keyword">start</span>  mysqld</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<h3><a name="t10"></a>查看 MySQL Server 状态</h3>
<pre><code class="hljs"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-attribute">systemctl status  mysqld</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<h3><a name="t11"></a>关闭 MySQL Server</h3>
<pre><code class="hljs vbscript"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">systemctl <span class="hljs-keyword"><span class="hljs-keyword">stop</span> mysqld</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<h2><a name="t12"></a>测试是否安装成功</h2>
<pre><code class="hljs"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-attribute">mysql</span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>可以进入 mysql 命令行界面</p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183644956-232259366.png" alt=""></p>
<p>&nbsp;</p>
<h2><a name="t13"></a>防火墙设置</h2>
<p>远程访问 MySQL， 需开放默认端口号 3306.</p>
<p>执行</p>
<pre><code class="hljs cs"><ol class="hljs-ln"><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="1"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line">firewall-cmd <span class="hljs-comment"><span class="hljs-comment">--permanent --zone=<span class="hljs-keyword">public</span> --<span class="hljs-keyword">add</span>-port=<span class="hljs-number">3306</span>/tcp</span></span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="2"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-comment">firewall-cmd <span class="hljs-comment">--permanent --zone=<span class="hljs-keyword">public</span> --<span class="hljs-keyword">add</span>-port=<span class="hljs-number">3306</span>/udp</span></span></div></div></li><li><div class="hljs-ln-numbers"><div class="hljs-ln-line hljs-ln-n" data-line-number="3"></div></div><div class="hljs-ln-code"><div class="hljs-ln-line"><span class="hljs-comment"></span></div></div></li></ol></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p>这样就开放了相应的端口。</p>
<p>执行</p>
<pre><code class="hljs sql">firewall-cmd <span class="hljs-comment"><span class="hljs-comment">--reload </span><br></span></code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<h2><a name="t14"></a>MySQL 安全设置</h2>
<p>服务器启动后，可以执行</p>
<pre><code class="hljs">mysql_secure_installation;</code><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<pre><code class="hljs"></code><br><br><div class="hljs-button {2}" data-title="复制" onclick="hljs.copyCode(event)"></div></pre>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183851300-789943277.png" alt=""></p>
<pre></pre>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105183854019-1241643422.png" alt=""></p>
<p>此时输入 root 原始密码（初始化安装的话为空），接下来，为了安全，MySQL 会提示你重置 root 密码，移除其他用户账号，禁用 root 远程登录，移除 test 数据库，重新加载 privilege 表格等，你只需输入 y 继续执行即可。</p>
<p>至此，整个 MySQL 安装完成。</p>
<pre></pre>
<p>下面可以看到都只能本机访问mysql，如果要外部可以访问mysql，那么host这里应该是显示%，所以这里我们可以选择重新创建一个用户并授予最高的权限，语句如下：</p>
<pre>grant all privileges on *.* to 'root'@'%' &nbsp;identified by 'lam7' with grant option;</pre>
<p>&nbsp;//这句话就是给root账户设置密码为lam7且host为%，即外部任何主机均可访问。*.*这个本意是数据库名.表名，我们这里没有写任何表名也没有写数据库名，就是意思所有的数据库都可以用这个root账户访问</p>
<p>flush privileges;//让刚刚修改的权限生效</p>
<p>然后接下来就是重启mysql服务，再次进入到mysql，用查询语句查看user表，如下所示：</p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105184028753-388403540.png" alt=""></p>
<p>如果需要使用外部工具链接mysql</p>
<p>则需要关闭防火墙</p>
<p>systemctl stop firewalld</p>
<p>然后查看状态</p>
<p>systemctl status firewalld</p>
<p><img src="https://images2015.cnblogs.com/blog/911086/201701/911086-20170105184421206-1095288281.png" alt=""></p>
<pre><span style="font-family:'宋体';font-size:18pt;"><strong>参考<br></strong></span></pre>
<h2><a name="t15"></a><a href="http://www.centoscn.com/mysql/2016/0315/6844.html" rel="nofollow" data-token="14a059e7ea802d5e5b2ee92fe0f7a36f">CentOS 7 安装 MySQL</a></h2>
<pre><span style="font-family:'宋体';font-size:18pt;"><strong>&nbsp;</strong></span></pre>
</div>
<p>转载于:https://www.cnblogs.com/Lam7/p/6253564.html</p>                                    </div>