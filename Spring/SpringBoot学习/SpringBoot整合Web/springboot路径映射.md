# 普通的springboot访问html

```java
@Controller
public class HelloController {
    //访问路径
    @GetMapping("/hello")
    public String hello(){
        //文件名
     return "hello";
 }
}
```

# 通过配置访问

```java
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //访问路径 返回的view
        registry.addViewController("/view").setViewName("hello");
        registry.addViewController("/a").setViewName("a");
    }
}
```

# 测试案例目录结构

![mulu-20200906162349379](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/mulu-20200906162349379.png)

# 项目依赖

```xml
<dependencies>
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-thymeleaf</artifactId>
   </dependency>
   <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
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