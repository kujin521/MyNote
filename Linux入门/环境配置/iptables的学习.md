# iptables
## 什么是iptables
	常见与linux系统的应用层防火墙工具
## 什么是Netfilter?
	Netfilter是Linux操作系统核心层内部的一个数据包处理模块
	什么是Hook point>
		数据包在Netfilter中的挂载点
		（PRE_POUTING,INPUT,OUTPUT,FORWARD,POST_ROUTING）
## iptables规则组成
	组成部分：四张表+五条链（Hook point）+规则
	四张表：
		filter表:访问控制，规则匹配
		nat表：地址转发
		mangle表，
		raw表
	五条链：INPUT,OUTPUT,FORWARD,PREROUTING,POSTROUTING
	数据包访问控制：ACCEPT,DROP,REJECT
	数据包改写:SNAT,DNAT
	信息记录：LOG
## iptables 配置 场景一
	》对所有的地址开放本机的tcp（80，22，10-21）端口的访问
	》允许对所有的地址开放本机的基于ICMP协议的数据包访问
	》其他未被允许的端口则禁止访问