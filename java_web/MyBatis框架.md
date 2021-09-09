# MyBatis框架

## mybatis入门

### mybatis的概述

- java持久层框架 封装了jdbc 等复杂的数据库操作
- 通过xml或注解的方式将要执行的statement配置
- 通过java对象和statement中的sql动态参数进行映射生成sql语句，并将结果映射为java对象并返回
- 采用ORM（Object Relational Mapping 对象关系映射）思想 实体--数据库--映射

### 环境搭建

- 第一步：创建maven工程并导入依赖pom.xml

  <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>3.4.5</version>
  </dependency>
  
  <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>8.0.12</version>
  </dependency>
  
  <dependency>
      <groupId>log4j</groupId>
      <artifactId>log4j</artifactId>
      <version>1.2.17</version>
  </dependency>

- 第二步：创建实体类和dao接口
- 第三步：创建mybatis的主配置文件SqlMapConfig.xml
- 第四步：创建映射配置文件IUserDao.xml
- 

### 环境搭建注意事项

- 第一个：创建IUserDao.xml和IUserDao.java时名称保持一致
- 第二个：xml文件目录要逐个创建，进行分层
- 第三个：mybatis的配置文件必须包接口一致
- 第四个：映射文件的mapper标签namsespace属性值必须是dao接口的全类名
- 第五个：映射配置文件的配置操作。id属性取值必须是dao接口的方法名

### 入门案例

//1.读取配置文件
String resource = "mybatis-config.xml";
InputStream inputStream = Resources.getResourceAsStream(resource);

//2.创建SqlSessionFactory工厂
SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

//3.使用工厂生产SqlSession对象
SqlSession sqlSession=sqlSessionFactory.openSession();
//4.使用SqlSession创建Dao接口代理对象
IUserDao userDao=sqlSession.getMapper(IUserDao.class);
//5.使用代理对象执行方法
List<User> all = userDao.findAll();
for (User user : all) {
    System.out.println(user.toString());
}
//6.释放资源
sqlSession.close();
inputStream.close();

### mybatis基于注解的入门案例

- 把IUserDao.xml移除，在dao接口上使用@Select注解，并指向SQL语句
- SqlMapperConfig.xml中mapper配置时，使用class属性指定dao接口全类名 

### 自定义mybatis框架分析

- Mybatis 在使用代理dao的方式实现增删改查时做什么事呢

	- 第一：创建代理对象
	- 第二：在代理对象中调用selectList

### 

## mybatis基本使用

### mybatis的单表crud操作

### mybatis的参数和返回值

### mybatis的dao编写

### mybatis配置的细节 几个标签的使用

## mybatis深入和多表

### mybatis的连接池

### mybatis的事务控制及设计的方法

### mybatis的多表查询

- 一对多
- 多
- 对多

*XMind - Trial Version*