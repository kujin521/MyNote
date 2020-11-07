## 系统的架构(重点)

![杰信项目架构](http://assets.processon.com/chart_image/5f8259d3e0b34d0711fcb2fb.png)

## 1.项目背景

杰信项目物流行业的项目，

> 信商贸是国际物流行业一家专门从事进出口玻璃器皿贸易的公司。公司总部位于十一个朝代的帝王之都西安，业务遍及欧美。随着公司不断发展壮大，旧的信息系统已无法满足公司的快速发展需求，妨碍公司成长，在此背景下，公司领导决定研发《杰信商贸综合管理平台》。
>

《杰信商贸综合管理平台》分三期完成。

**一期完成仓储管理**（包括：采购单、仓库、货物、条形码、入库、出库、退货、盘点、库存、库存上限报警、统计查询）和展会管理（包括：展会管理、出单管理），形成货物统一数字化管理。

**二期完成货运全流程管理**，包括购销合同、出货表统计、出口报运单、HOME装箱单、装箱单、委托书、发票、财务统计等。

**三期完成决策分析**（包括：成本分析图、销售情况统计、重点客户、经营情况同期比对统计、工作绩效），为公司经营决策提供数据支持。

## 2.如何在新框架下下手开发

步骤:

1. 大概浏览说明文档, 了解软件解决什么问题,	解决用户什么需求

2. 找jar包 浏览他的核心框架 核心技术 freemake 等一些未知技术 (百度了解作用即可)

3. 画图 系统架构草图 

4. 系统基本都是分层体系 都从后往前看

   1. 看数据库配置文件 了解数据库连接 账号密码
   2. 持久层
   3. Dao
   4. Service
   5. Controller / action
   6. Jsp

   找权限部门管理表  一般一个表单的CRUD操作

   找到模板 仿照模板	根据草图 一步步实现

   遇到不了解的技术  **百度**了解其作用即可 然后仿写

## 3.用例图

> 业界 Rational rose UML(大型工具)  用例图 类图 序列图 状态 
>
> 小工具 PowerDesigner
>
> [Navcat在线文档]: 	"https://www.navicat.com.cn/manual/online_manual/cn/navicat/win_manual/index.html"

1. 角色 代表系统的一类用户
2. 用例 代表业务功能
3. 连线关系 那个角色操作哪些用例

![image-20201011085648745](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142453.png)

### 系统功能结构图

1. 功能点 分层 主次 演化成主菜单 左侧菜单 功能点
2. 了解系统的所有功能
3. 按功能点分配工作
4. 用户报价的依据 按模块报价

![image-20201011085907041](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142438.png)

## 4.Oracle数据库

### 数据库

异构数据库技术：当前的系统直接支持主流的数据库，需要少量的编码

OracleXEUniv简版 （推荐）

11g正式版安装包，2个文件，3G

之前的10g的简版，不能创建一个本地服务，没有导入数据命令和导出数据的命令。

sqlPlus它可以直接用账号，可以远程访问。（权限大）

PL/SQL oracle客户端工具不能直接远程访问oracle。必须创建通道（本地服务）

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142506.jpg) 

一般安装完oracle数据库，默认服务都是自动启动；日常不用时，可以停掉服务，加速系统启动，不占内存。

安装ORACLE创建SID，创建数据库（账号），默认system/sys系统账号。**一定要记住密码。**

### **创建一个账号**

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142528.jpg) 

### **b)** ***授权***

 

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142541.jpg) 

 

### **c)** ***使用自己创建的账号登陆***

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142601.jpg) 

### **d)** ***选择MyObjects只看到自己的内容***

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201011142614.jpg)

## 5.需求分析-数据库建模

### **1.** ***业务需求：***

**a)** ***《需求说明书》***

1） 描述业务功能

生产厂家模块

功能：为在购销合同模块中的货物信息和附件信息它们都有所属的生产厂家。

 

**b)** ***《概要设计》***

1） 细化描述业务功能

2） 以表格形式数据库表（表+字段+描述）

**d)** ***主键策略***

1） 自增类型INT/LONG 速度快

2） UUID字符串 速度慢 （推荐使用UUID）

 

### **2.** ***开发步骤***

### **a)** ***PD数据库建模，执行建表SQL语句***

![img](file:///C:\Users\ADMINI~1\AppData\Local\Temp\ksohtml12940\wps6.jpg) 

 

![img](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201017091156.png) 

## 6.maven依赖

构建本地maven仓库

### 修改配置文件

maven/conf/settings.xml

使用阿里源中央仓库

```
  <mirrors>
	<mirror>
		<id>nexus-aliyun</id>
		<mirrorOf>central</mirrorOf>
		<name>Nexus aliyun</name>
							     <url>http://maven.aliyun.com/nexus/content/groups/public</url>
	</mirror>
  </mirrors>
```

创建一个repository文件夹用于存放下载的依赖包

**原则**

1） 主要核心框架springmvc、spring、mybatis

2） 数据库 c3p0、 oracle/mysql驱动

3） 第三方核心jar 

4） 日常其他jar log4j、junit、poi

5） 排除冲突的jar servlet.jar TOMCAT实现，

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>org.example</groupId>
  <artifactId>JK_ssm_oracle_webapp</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>war</packaging>
<!--  项目名称-->
  <name>JK_ssm_oracle_webapp Maven Webapp</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>
<!--  编码格式 编译版本-->
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
    <org.springframework.version>3.2.6.RELEASE</org.springframework.version>
  </properties>
<!--  需要的依赖集合-->
  <dependencies>
<!--    springmvc-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-webmvc</artifactId>
      <version>${org.springframework.version}</version>
    </dependency>
<!--    spring事务-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-orm</artifactId>
      <version>${org.springframework.version}</version>
    </dependency>
<!--    spring测试-->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-test</artifactId>
      <version>${org.springframework.version}</version>
      <type>jar</type>
      <scope>test</scope>
    </dependency>
<!--    面向切面编程-->
    <dependency>
      <groupId>org.aspectj</groupId>
      <artifactId>aspectjweaver</artifactId>
      <version>1.7.2</version>
    </dependency>
<!--    mybatis-->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.2.2</version>
    </dependency>
<!--    mybatis-spring-->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis-spring</artifactId>
      <version>1.2.0</version>
    </dependency>
<!--    c3p0连接池-->
    <dependency>
      <groupId>c3p0</groupId>
      <artifactId>c3p0</artifactId>
      <version>0.9.1.2</version>
    </dependency>
<!--    oracle连接-->
    <dependency>
      <groupId>com.oracle</groupId>
      <artifactId>ojdbc6</artifactId>
      <version>11.1.0.7.0</version>
    </dependency>
<!--    mysql连接-->
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>5.1.10</version>
    </dependency>
<!--    Apache CXF提供了对JAX-WS规范的全面支持，一方面提供了对多种绑定(Binding) 数据绑定(DataBinding)-->
<!--    传输协议(Transport)以及数据格式(Format)的支持，另一方面可以根据实际项目的需要，采用代码优先或者-->
<!--    文档优先来轻松实现Web Services的发布和使用-->
    <dependency>
      <groupId>org.apache.cxf</groupId>
      <artifactId>cxf-rt-frontend-jaxws</artifactId>
      <version>3.0.0-milestone2</version>
    </dependency>
    <dependency>
      <groupId>org.apache.cxf</groupId>
      <artifactId>cxf-rt-transports-http</artifactId>
      <version>3.0.0-milestone2</version>
    </dependency>
    <!-- Jetty is needed if you're using the CXFServlet -->
    <dependency>
      <groupId>org.apache.cxf</groupId>
      <artifactId>cxf-rt-transports-http-jetty</artifactId>
      <version>3.0.0-milestone2</version>
    </dependency>
<!--    日志-->
    <dependency>
      <groupId>log4j</groupId>
      <artifactId>log4j</artifactId>
      <version>1.2.13</version>
    </dependency>
    <dependency>
      <groupId>org.slf4j</groupId>
      <artifactId>slf4j-log4j12</artifactId>
      <version>1.7.5</version>
    </dependency>
<!--    开发中经常会设计到excel的处理，如导出Excel，导入Excel到数据库中，操作Excel目前有两个框架，一个是apache 的poi， 另一个是 Java Excel-->
    <dependency>
      <groupId>org.apache.poi</groupId>
      <artifactId>poi</artifactId>
      <version>3.9</version>
    </dependency>
    <dependency>
      <groupId>org.apache.poi</groupId>
      <artifactId>poi-ooxml</artifactId>
      <version>3.9</version>
    </dependency>
<!--    一个免费的Java图表库。-->
<!--    JFreeChart 支持饼图（2D 和 3D）、条形图（水平和垂直图、常规图和堆叠图）、折线图、散点图、时间序列图、高低开-收盘图、烛台图、甘特图、组合图、温度计图、表盘图等。-->
<!--    JFreeChart 可用于客户端和服务器端应用程序-->
    <dependency>
      <groupId>jfree</groupId>
      <artifactId>jfreechart</artifactId>
      <version>1.0.13</version>
    </dependency>
<!--    java——test-->
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.9</version>
    </dependency>
<!--    文件上传下载-->
    <dependency>
      <groupId>commons-fileupload</groupId>
      <artifactId>commons-fileupload</artifactId>
      <version>1.2.2</version>
    </dependency>
    <dependency>
      <groupId>commons-io</groupId>
      <artifactId>commons-io</artifactId>
      <version>2.0.1</version>
    </dependency>
<!--    JSTL代表JSP标准标记库 。 JSTL是标准的标记库，它提供用于控制JSP页面行为的标记。 JSTL标签可用于迭代和控制语句，国际化，SQL等-->
    <dependency>
      <groupId>javax.servlet.jsp.jstl</groupId>
      <artifactId>jstl-api</artifactId>
      <version>1.2</version>
    </dependency>
    <dependency>
      <groupId>org.glassfish.web</groupId>
      <artifactId>jstl-impl</artifactId>
      <version>1.2</version>
    </dependency>
<!--    Java Excel API 是一个成熟的开源 java API，使开发人员能够动态地读取、写入和修改 Excel 电子表格。-->
    <dependency>
      <groupId>jexcelapi</groupId>
      <artifactId>jxl</artifactId>
      <version>2.4.2</version>
    </dependency>

    <!-- 防止和tomcat中的jar冲突 -->
    <dependency>
      <groupId>org.apache.tomcat</groupId>
      <artifactId>servlet-api</artifactId>
      <version>6.0.33</version>
      <scope>provided</scope>
    </dependency>

    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>servlet-api</artifactId>
      <version>2.5</version>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>jsp-api</artifactId>
      <version>2.1</version>
      <scope>provided</scope>
    </dependency>

    <dependency>
      <groupId>org.apache.geronimo.specs</groupId>
      <artifactId>geronimo-servlet_3.0_spec</artifactId>
      <version>1.0</version>
      <scope>provided</scope>
    </dependency>
  </dependencies>
  <build>
    <finalName>jk9</finalName>
  </build>
</project>

```



## 7.生产厂家模块

> mybatis配置文+DAO+service+controller+jsp

- 创建数据库表

  ```sql
  CREATE TABLE "FACTORY_C" (
  
  "FACTORY_ID" VARCHAR2(40) NOT NULL,
  
  "FULL_NAME" VARCHAR2(200) NULL,
  
  "FACTORY_NAME" VARCHAR2(50) NULL,
  
  "CONTACTS" VARCHAR2(30) NULL,
  
  "PHONE" VARCHAR2(20) NULL,
  
  "MOBILE" VARCHAR2(20) NULL,
  
  "FAX" VARCHAR2(20) NULL,
  
  "CNOTE" VARCHAR2(2000) NULL,
  
  "INSPECTOR" VARCHAR2(30) NULL,
  
  "ORDER_NO" INT NULL,
  
  "CREATE_BY" VARCHAR2(40) NULL,
  
  "CREATE_DEPT" VARCHAR2(40) NULL,
  
  "CREATE_TIME" TIMESTAMP(0) NULL,
  
  PRIMARY KEY ("FACTORY_ID") 
  
  )
  
  NOCOMPRESS 
  
  NOPARALLEL ;
  
  
  
  COMMENT ON COLUMN "FACTORY_C"."FACTORY_ID" IS '编号 UUID';
  
  COMMENT ON COLUMN "FACTORY_C"."FULL_NAME" IS '全称';
  
  COMMENT ON COLUMN "FACTORY_C"."FACTORY_NAME" IS '简称';
  
  COMMENT ON COLUMN "FACTORY_C"."CONTACTS" IS '电话';
  
  COMMENT ON COLUMN "FACTORY_C"."PHONE" IS '电话';
  
  COMMENT ON COLUMN "FACTORY_C"."MOBILE" IS '手机';
  
  COMMENT ON COLUMN "FACTORY_C"."FAX" IS '传真';
  
  COMMENT ON COLUMN "FACTORY_C"."CNOTE" IS '备注 当感觉它可能和关键字相冲突时，就加一个C前缀';
  
  COMMENT ON COLUMN "FACTORY_C"."INSPECTOR" IS '验货员';
  
  COMMENT ON COLUMN "FACTORY_C"."ORDER_NO" IS '排序号';
  
  COMMENT ON COLUMN "FACTORY_C"."CREATE_BY" IS '创建人
  
  当前登录人的ID';
  
  COMMENT ON COLUMN "FACTORY_C"."CREATE_DEPT" IS '创建部门
  
  当前登录人所在部门';
  
  COMMENT ON COLUMN "FACTORY_C"."CREATE_TIME" IS '创建时间';
  
  
  
  
  ```

- 创建对应实体类

- a



## **b**创建PO对象





