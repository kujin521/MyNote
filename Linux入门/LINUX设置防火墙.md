<section class="ouvJEz"><h1 class="_1RuRku">Linux设置防火墙</h1><div class="rEsl9f"><div class="s-dsoj"><time datetime="2019-02-25T03:01:08.000Z">2019.02.25 11:01:08</time><span>字数 42</span><span>阅读 189</span></div></div><article class="_2rhmJa"><p>Centos 7之前的防火墙基本都是修改iptables</p>
<pre class="line-numbers  language-undefined"><code class="  language-undefined">
service  iptables  status        查看防火墙状态

service  iptables  start          开启防火墙

service  iptables  stop          关闭防火墙

service  iptables  restart        重启防火墙

<span aria-hidden="true" class="line-numbers-rows"><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span><span></span></span></code></pre>
<p>Centos 7之后的防火墙升级为Firewall，取代了之前的iptables</p>
<p>其常用命令为：</p>
<pre class="line-numbers  language-csharp"><code class="  language-csharp">
firewall<span class="token operator">-</span>cmd <span class="token operator">--</span>state                          ##查看防火墙运行状态，是否是running

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span>reload                        ##重新载入配置，比如添加规则之后，需要执行此命令

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">get</span><span class="token operator">-</span>zones                  ##列出支持的zone

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">get</span><span class="token operator">-</span>services              ##列出支持的服务，在列表中的服务是放行的

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span>list<span class="token operator">-</span>ports                    ##列出开放的端口

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span>query<span class="token operator">-</span>service ftp                          ##查看ftp服务是否支持，返回yes或者no

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">add</span><span class="token operator">-</span>service<span class="token operator">=</span>ftp                            ##临时开放ftp服务

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">add</span><span class="token operator">-</span>service<span class="token operator">=</span>ftp <span class="token operator">--</span>permanent        ##永久开放ftp服务

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">remove</span><span class="token operator">-</span>service<span class="token operator">=</span>ftp <span class="token operator">--</span>permanent  ##永久移除ftp服务

firewall<span class="token operator">-</span>cmd <span class="token operator">--</span><span class="token keyword">add</span><span class="token operator">-</span>port<span class="token operator">=</span><span class="token number">80</span><span class="token operator">/</span>tcp <span class="token operator">--</span>permanent      ##永久添加<span class="token number">80</span>端口

iptables <span class="token operator">-</span>L <span class="token operator">-</span>n                                  ##查看规则，这个命令是和iptables的相同的

man firewall<span class="token operator">-</span>cmd                            ##查看帮助

systemctl stop firewalld                  ##关闭防火墙

systemctl start firewalld                  ##开启防火墙

systemctl status firewalld              ##查看防火墙状态

systemctl restart firewalld              ##重启防火墙

systemctl disable firewalld              ##开机关闭防火墙，即永久关闭
