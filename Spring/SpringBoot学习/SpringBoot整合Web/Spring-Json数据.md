

SpringBoot自带json依赖,在json数据转化中 HttpMessageConverter 起到关键作用

1. MappingJackson2HttpMessageConverter
2. GsonHttpMessageConverterConfiguration
3. FastJsonHttpMessageConverter

# jackson和Gson

gson需要自己导入依赖

```xml
<dependency>
   <groupId>com.google.code.gson</groupId>
   <artifactId>gson</artifactId>
</dependency>
```

用ObjectMapper把json转换成实体对象

相关源码

![image-20200831182702666](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200831182702666.png)

```java
//1. 自定义配置类
@Configuration
public class WebMvcConfig {
    //2. 编写Bean 实现器需要的的功能
    //org.springframework.boot.autoconfigure.http.JacksonHttpMessageConvertersConfiguration
//    @Bean
//    MappingJackson2HttpMessageConverter mappingJackson2CborHttpMessageConverter(){
//        MappingJackson2HttpMessageConverter converter=new MappingJackson2HttpMessageConverter();
//        ObjectMapper om=new ObjectMapper();
//        //对日期进行格式化
//        om.setDateFormat(new SimpleDateFormat("yyyy/MM/dd"));
//        converter.setObjectMapper(om);
//        return converter;
//    }

    // 3.简化上方代码 auto
    // org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration
    @Bean
    ObjectMapper objectMapper(){
        ObjectMapper om=new ObjectMapper();
        //对日期进行格式化
        om.setDateFormat(new SimpleDateFormat("yyyy/MM/dd"));
        return om;
    }
}


package com.tutorial.spring_json.config;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.GsonHttpMessageConverter;


/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/8/31
 * 修改时间：2020/8/31
 */
//2. Gson自定义配置类
@Configuration
public class WebMvcConfig {
    //2. 编写Bean 实现器需要的的功能
    //org.springframework.boot.autoconfigure.http.JacksonHttpMessageConvertersConfiguration
//    @Bean
//    MappingJackson2HttpMessageConverter mappingJackson2CborHttpMessageConverter(){
//        MappingJackson2HttpMessageConverter converter=new MappingJackson2HttpMessageConverter();
//        ObjectMapper om=new ObjectMapper();
//        //对日期进行格式化
//        om.setDateFormat(new SimpleDateFormat("yyyy/MM/dd"));
//        converter.setObjectMapper(om);
//        return converter;
//    }

    // 3.简化上方代码 auto
    // org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration
//    @Bean
//    ObjectMapper objectMapper(){
//        ObjectMapper om=new ObjectMapper();
//        //对日期进行格式化
//        om.setDateFormat(new SimpleDateFormat("yyyy/MM/dd"));
//        return om;
//    }

//    @Bean
//    GsonHttpMessageConverter gsonHttpMessageConverter(){
//        GsonHttpMessageConverter converter=new GsonHttpMessageConverter();
//        converter.setGson(new GsonBuilder().setDateFormat("yyyy-MM-dd").create());
//        return converter;
//    }

    @Bean
    Gson gson(){
        return new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    }
}

```

```java
//@Controller
    @RestController
public class UserController {

    //@ResponseBody
    @GetMapping("/user")
    public List<User> getAllUser(){
        List<User> uses=new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            uses.add(new User(i,"user"+i,i+18,new Date()));
        }
        return uses;
    }

}
```

```java
package com.tutorial.spring_json.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/8/31
 * 修改时间：2020/8/31
 */
public class User {
    private int id;
    private String name;
    private int age;

    //@JsonFormat(pattern = "yyyy-MM-dd")
    private Date brithday;

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public User() {
    }

    public User(int id, String name, int age, Date brithday) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.brithday = brithday;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
```

# fastjson

github地址:https://github.com/alibaba/fastjson 

```xml
<dependency>
   <groupId>com.alibaba</groupId>
   <artifactId>fastjson</artifactId>
   <version>1.2.62</version>
</dependency>
```

```java
@Bean
FastJsonHttpMessageConverter fastJsonHttpMessageConverter(){
    FastJsonHttpMessageConverter converter=new FastJsonHttpMessageConverter();
    FastJsonConfig fastconfig=new FastJsonConfig();
    fastconfig.setDateFormat("yyyy-MM-dd");
    converter.setFastJsonConfig(fastconfig);
    return converter;
}
```