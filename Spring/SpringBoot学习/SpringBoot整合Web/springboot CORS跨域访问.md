## [春季框架中的 CORS 支持](https://spring.io/blog/2015/06/08/cors-support-in-spring-framework)

[跨源资源共享](https://spring.io/understanding/CORS)（CORS） 是一个[W3C 规范](https://www.w3.org/TR/cors/)实施者[大多数浏览器](https://caniuse.com/#feat=cors)允许您以灵活的方式指定授权哪些类跨域请求，而不是使用一些不太安全、功能不太强大的黑客，如 IFrame 或 JSONP

- ## 控制器方法 CORS 配置

- ## 也可以为整个控制器启用 CORS：

- ## 全局 CORS 配置

```java
@RestController
//为整个控制器配置
//@CrossOrigin(origins = "http://localhost:8081")
public class HelloController {

    @GetMapping("/")
    //为单个方法配置
//    @CrossOrigin(origins = "http://localhost:8081")
    public String get(){
        return "跨域get";
    }

    @PutMapping("/")
    public String put(){
        return "跨域put";
    }
}
```

```java
//全局配置
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry
                .addMapping("/**") //容许访问api
                .allowedOrigins("http://localhost:8081") //启用 CORS
                .allowedHeaders("*") //请求头
                .allowedMethods("*") //访求方式 默认 get post head
                .maxAge(30*1000); //探测请求的有效时间
    }
}
```

  