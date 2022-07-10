# **Spring Boot中使用HTTPS步骤**

> （1）要有一个SSL证书，证书怎么获取呢？买（通过证书授权机构购买）或者自己生成（通过keytool生成）。
>
> （2）在spring boot中启用HTTPS
>
> （3）将HTTP重定向到HTTPS（可选）

## **获取SSL证书**

```bash
keytool -genkey -alias plmssl -dname "CN=lunan,OU=kfit,O=kfit,L=HaiDian,ST=BeiJing,C=CN" -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore keystore.p12 -validity 365
```

-genkey ：生成key；

-alias ：key的别名；

-dname：指定证书拥有者信息

-storetype ：密钥库的类型为JCEKS。常用的有JKS(默认),JCEKS(推荐),PKCS12,BKS,UBER。每个密钥库只可以是其中一种类型。

-keyalg ：DSA或RSA算法(当使用-genkeypair参数)，DES或DESede或AES算法(当使用-genseckey参数)；

-keysize ：密钥的长度为512至1024之间(64的倍数)

-keystore ：证书库的名称

-validity ： 指定创建的证书有效期多少天

dname的值详解：

CN(Common Name名字与姓氏)

OU(Organization Unit组织单位名称)

O(Organization组织名称)

L(Locality城市或区域名称)

ST(State州或省份名称)

C(Country国家名称）

这时候在目录：C:\Users\Administrator下就会看到一个文件keystore.p12。到这里SSL证书就有了。

## Spring Boot中启用HTTPS

> 注意：请将在上一步生成的证书放到src/main/resources目录下。

在application.properties中配置HTTPS，配置信息如下：

```yaml
#https端口号.
server.port: 443
#证书的路径.
server.ssl.key-store: classpath:keystore.p12
#证书密码，请修改为您自己证书的密码.
server.ssl.key-store-password: 123456
#秘钥库类型
server.ssl.keyStoreType: PKCS12
#证书别名
server.ssl.keyAlias: tomcat
```

## **将HTTP请求重定向到HTTPS（可选）**

```java
package com.kfit.config;

import
org.apache.catalina.Context;
import
org.apache.catalina.connector.Connector;
import
org.apache.tomcat.util.descriptor.web.SecurityCollection;
import
org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import
org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import
org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import
org.springframework.context.annotation.Bean;
import
org.springframework.context.annotation.Configuration;

@Configuration
public class TomcatHttpConfig
{

/**
 * 配置内置的servlet容器工厂为tomcat.
 * @return
 */
@Bean
public
EmbeddedServletContainerFactory servletContainer() {
TomcatEmbeddedServletContainerFactory
tomcat = new TomcatEmbeddedServletContainerFactory() {

@Override
protected void
postProcessContext(Context context) {

     SecurityConstraint securityConstraint = new SecurityConstraint();
     securityConstraint.setUserConstraint("CONFIDENTIAL");
    SecurityCollection collection = new SecurityCollection();
    collection.addPattern("/*");
    securityConstraint.addCollection(collection);
    context.addConstraint(securityConstraint);
}
};
//添加连接配置，主要是http的配置信息.
tomcat.addAdditionalTomcatConnectors(initiateHttpConnector());
     return tomcat;
}

/**
 * 配置一个http连接信息.
 * @return
 */
private Connector
initiateHttpConnector() {
     Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
      connector.setScheme("http");
     connector.setPort(8080);
     connector.setSecure(false);
      connector.setRedirectPort(443);
      return connector;
}
}
```

