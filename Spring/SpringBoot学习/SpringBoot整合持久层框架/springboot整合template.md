# Springboot整合JdbcTmplate

> jdbctemplate在之前的开发中用的还是比较多的，它和mybatis有点类似都是需要自己写sql语句，也是对jdbc做了封装，缺点也比较明显就是移植性有些差。但日常的中小型开发也够用，这次就来一个Spring Boot整合jdbctemplate实现增删改查的小例子

## 需要的依赖

### 1. maven

```xml
<dependencies>
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-jdbc</artifactId>
   </dependency>
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
   </dependency>

   <dependency>
      <groupId>com.alibaba</groupId>
      <artifactId>druid-spring-boot-starter</artifactId>
      <version>1.1.10</version>
   </dependency>

   <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <scope>runtime</scope>
   </dependency>
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <scope>test</scope>
      <exclusions>
         <exclusion>
            <groupId>org.junit.vintage</groupId>
            <artifactId>junit-vintage-engine</artifactId>
         </exclusion>
      </exclusions>
   </dependency>
</dependencies>
```

### 2. gradle

```groovy
dependencies {
   implementation 'org.springframework.boot:spring-boot-starter-jdbc'
   implementation 'org.springframework.boot:spring-boot-starter-web'
   runtimeOnly 'mysql:mysql-connector-java'
   
   testImplementation('org.springframework.boot:spring-boot-starter-test') {
      exclude group: 'org.junit.vintage', module: 'junit-vintage-engine'
   }
   implementation 'com.alibaba:druid-spring-boot-starter:1.1.10'
}
```

## 文件目录结构

![image-20200912111339016](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200912111339016.png)

## 案例代码

实体类 user

```java
package com.example.template;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/10
 * 修改时间：2020/9/10
 */
public class User {
    private Integer id;
    private String username;
    private String address;

    public User() {
    }

    public User(Integer id) {
        this.id = id;
    }

    public User(Integer id, String username) {
        this.id = id;
        this.username = username;
    }

    public User(String username, String address) {
        this.username = username;
        this.address = address;
    }



    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", address='" + address + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
```

userService

```java
package com.example.template;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/10
 * 修改时间：2020/9/10
 */
@Service
public class UserService {
    @Autowired
    JdbcTemplate template;

    public Integer addUser(User user){
        return template.update("insert into user ( username, address) value (?,?)",user.getUsername(),user.getAddress());
    }
    public Integer deleteUserById(Integer id){
        return template.update("delete from user where id=?",id);
    }
    public Integer updataUser(User user){
        return template.update("update user set username=? where id=?",user.getUsername(),user.getId());
    }

    public List<User> getAllUser(){
        return template.query("select * from user", new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                User user=new User(rs.getString("username"),rs.getString("address"));
                return user;
            }
        });
    }

    public List<User> getAllUser2(){
        return template.query("select * from user", new BeanPropertyRowMapper<>(User.class));
    }
}
```

application.propertions数据库配置信息 mysql8.*

```xml
spring.datasource.type=com.mysql.cj.jdbc.MysqlDataSource
spring.datasource.username=root
spring.datasource.password=123456
spring.datasource.url=jdbc:mysql://192.168.43.147:3306/t1?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8
```

测试代码

```java
package com.example.template;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/10
 * 修改时间：2020/9/10
 */
@SpringBootTest
class UserServiceTest {

    @Autowired
    UserService userService;
    @BeforeEach
    public void before(){

    }

    @Test
    void testAddUser() {
        User user=new User("k2","jt2");
        userService.addUser(user);
    }

    @Test
    void deleteUserById() {
        userService.deleteUserById(3);
    }

    @Test
    void updataUser() {
        User user=new User(1,"jt2");
        userService.updataUser(user);
    }

    @Test
    void getAllUser() {
        System.out.println(userService.getAllUser());
    }
}
```