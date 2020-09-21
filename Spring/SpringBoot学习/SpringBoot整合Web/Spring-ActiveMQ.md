# ActiveMQ

> Apache ActiveMQ™是最流行的开源、多协议、基于 Java 的消息传递服务器。它支持行业标准协议，使用户能够从各种语言和平台上获得客户选择的好处。提供来自 C、C++、Python、.Net 等的连接。使用无处不在的**AMQP 协议集成您的多平台**应用程序。使用通过 Web 袜子在 Web 上**使用 STOMP**在 Web 应用程序之间交换消息。使用**MQTT**管理 IoT 设备。支持您现有的**JMS**基础架构等。ActiveMQ 提供了支持任何消息传递用例的电源和灵活性。

下载地址: http://activemq.apache.org/components/classic/download/

入门文档: http://activemq.apache.org/getting-started

## Unix 的安装过程

### 前期要求安装jdk

#### Unix 二进制安装

此过程说明如何在 Unix 系统下载和安装二进制分发。
**注意**：有几种其他方法来执行这种类型的安装。

1. 使用浏览器或工具（例如 wget、scp、ftp 等）将 activemq 压缩的 tarball 文件下载到 Unix 计算机，例如：（
   请参阅[下载](http://activemq.apache.org/download)->"最新稳定版本"）

   ```
   wget http://activemq.apache.org/path/tofile/apache-activemq-x.x.x-bin.tar.gz
   ```

2. 将文件从压缩的 tarball 中提取到您选择的目录中。例如：

   ```
   cd [activemq_install_dir]
   tar zxvf activemq-x.x.x-bin.tar.gz
   ```

3. activemq 默认只能当前服务器访问，如果需要外部访问，需要修改jetty.xml文件

   ```xml
    <bean id="jettyPort" class="org.apache.activemq.web.WebConsolePort" init-method="start">
                <!-- the default port number for the web console -->
           <property name="host" value="192.168.213.133"/>  // 将 127.0.0.1 修改为外网IP即可访问,或者 0.0.0.0
           <property name="port" value="8161"/>
       </bean>
   ```

4. 开放端口

   ```bash
   firewall-cmd --zone=public --add-port=8161/tcp --permanent  # 开放8161端口
   firewall-cmd --reload  # 配置立即生效
   ```

5. 启动

   ```bash
   cd /root/apache-activemq-5.16.0/bin/
   ./activemq start
   ```


## 创建项目测试

![image-20200807151255534](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200807151255534.png)