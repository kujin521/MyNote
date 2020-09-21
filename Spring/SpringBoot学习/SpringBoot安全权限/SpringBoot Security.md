## 初始Security

## 导入依赖

```xml
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-security</artifactId>
</dependency>
<dependency>
   <groupId>org.springframework.boot</groupId>
   <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

效果

自动生成密码

![image-20200915091318303](C:/Users/Administrator/AppData/Roaming/Typora/typora-user-images/image-20200915091318303.png)

![image-20200915091213318](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200915091213318.png)

## 手动设置密码

> 配置appliacton.properties

```properties
spring.security.user.name=kujin
spring.security.user.password=123
spring.security.user.roles=admin
```

> 代码配置(会覆盖文件配置)

```java
package com.example.security01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 类：权限访问配置类
 * 编写人：kujin
 * 创建时间：2020/9/15
 * 修改时间：2020/9/15
 */
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    //spring 要求密码需要进行加密
    @Bean
    PasswordEncoder passwordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /**
         * 配置用户
         */
        auth.inMemoryAuthentication()
                //添加 用户名 密码 角色
                .withUser("kujin").password("123").roles("admin")
                .and()
                .withUser("user").password("123").roles("user");
    }

    /**
     * 配置拦截规则
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //开启配置
        http.authorizeRequests()
                //配置路径规则 角色访问设置
                .antMatchers("/admin/**").hasRole("admin")
                .antMatchers("/user/**").hasAnyRole("admin","user")
                //其他请求路径 登录即可访问
                .anyRequest().authenticated()
                .and()
                // 配置表单登录
                .formLogin()
                //处理登录请求的地址
                .loginProcessingUrl("/doLogin")
                //登录接口 直接访问
                .permitAll()
                .and()
                //用于postman 关闭csrf 攻击策略
                .csrf().disable();
    }
}

```

## 登录表单的详细配置

```java
// 配置表单登录
.formLogin()
//处理登录请求的地址
.loginProcessingUrl("/doLogin")
//配置登录界面
.loginPage("/login")
//自定义 参数名
.usernameParameter("u")
.passwordParameter("p")
//登录成功处理器
.successHandler(new AuthenticationSuccessHandler() {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication authentication) throws IOException, ServletException {
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> map = new HashMap<>();
        map.put("status",200);
        map.put("msg",authentication.getPrincipal());
        writer.write(new ObjectMapper().writeValueAsString(map));
        writer.flush();
        writer.close();
    }
})
//登录失败处理器
.failureHandler(new AuthenticationFailureHandler() {
    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp, AuthenticationException e) throws IOException, ServletException {
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> map = new HashMap<>();
        map.put("status",401);
        if (e instanceof LockedException){
            map.put("msg","账户被锁定,登录失败!");
        }else if (e instanceof BadCredentialsException){
            map.put("msg","用户名或密码错误,登陆错误!");
        }else if (e instanceof DisabledException){
            map.put("msg","账户被禁用,登陆错误!");
        } else if (e instanceof AccountExpiredException){
            map.put("msg","账户过期,登陆错误!");
        }else if (e instanceof CredentialsExpiredException){
            map.put("msg","密码过期,登陆错误!");
        }else {
            map.put("msg","登陆错误!");
        }
        writer.write(new ObjectMapper().writeValueAsString(map));
        writer.flush();
        writer.close();
    }
})
//登录接口 直接访问
.permitAll()
```

## 配置注销登录

```java
//配置注销登录
.logout()
//注销请求地址
.logoutUrl("/logout")
//注销处理器
.logoutSuccessHandler(new LogoutSuccessHandler() {
    @Override
    public void onLogoutSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication authentication) throws IOException, ServletException {
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        HashMap<String, Object> map = new HashMap<>();
        map.put("status",200);
        map.put("msg","注销登录成功");
        writer.write(new ObjectMapper().writeValueAsString(map));
        writer.flush();
        writer.close();
    }
})
```

## 多个HttpSecurityConfig配置

```java
package com.example.security01;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 * 类：多个HttpSecurityConfig配置类
 * 编写人：kujin
 * 创建时间：2020/9/15
 * 修改时间：2020/9/15
 */
@Configuration
public class MultHttpSecurityConfig{

    //spring 要求密码需要进行加密
    @Bean
    PasswordEncoder passwordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }

    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        /**
         * 配置用户
         */
        auth.inMemoryAuthentication()
                //添加 用户名 密码 角色
                .withUser("kujin").password("123").roles("admin")
                .and()
                .withUser("user").password("123").roles("user");
    }

    @Configuration
    @Order(1)
    public static class AdminSecurityConfig extends WebSecurityConfigurerAdapter{
        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.antMatcher("/admin/**").authorizeRequests().anyRequest().hasAnyRole("admin");
        }
    }
    @Configuration
    @Order
    public static class OrtherSecurityConfig extends WebSecurityConfigurerAdapter{
        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.authorizeRequests().anyRequest().authenticated()
                    .and()
                    .formLogin()
                    .loginProcessingUrl("/doLogin")
                    .permitAll()
                    .and()
                    .csrf().disable();
        }
    }
}
```

## 密码加密

```java
for (int i = 0; i < 10; i++) {
   BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
   System.out.println(passwordEncoder.encode("123"));
}
/*
$2a$10$jp/4YuY1fiXQ8tVuAWWikOWwyLt6ABSQBRFwy6Tkqw/PeS1PHPDfy
$2a$10$YQqxmQzMVW0GDmozSZAsx.yOQ/XFri1lehqBuO5Rj9GmCF4KAOll.
$2a$10$gk.PlosNV9xkjgI.ECn2pem8cswgHuJ42XBfbtIFHjjvlMIvE1q3i
$2a$10$6H8FEaDjcDhi4ZtKHL5OM.WHVPEJl76Ut4xMrEx6DeSe6BjltLREG
$2a$10$xLEdIH3jh2fmDtxphDC2Z.m2rm9BN9Bu5NxBVrsrJ0ScRzf582RIm
$2a$10$bg8wmZAk9zhW0BnAidRT8.iVED8QCrgP2bJqaqR2Umjr5HAPDAnfa
$2a$10$Wa91Rqat3XVUJ8amOZVQke4WCEaMYM8RxXEdzVaz1T7sATaLr1B52
$2a$10$GfrMxg..frzhgL9HQ.32S.Sj9GXxO5NzmPv7nPtfCOkLt0IEYoE8u
$2a$10$RJoUFvZBkMNAYuNw9F1AvuHVD9eSm5/5bV4zGIzHk8Oidxyd8R7AS
$2a$10$oa0Xosd0iOSryYuYIA30k.vZnTk5qU8IU.vkatlTi3s9cQ5x4pRW.

*/
```

```java
//spring 要求密码需要进行加密
@Bean
PasswordEncoder passwordEncoder(){
    return new BCryptPasswordEncoder();
}

@Autowired
protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    /**
     * 配置用户
     */
    auth.inMemoryAuthentication()
            //添加 用户名 密码 角色
            .withUser("kujin").password("$2a$10$eYAzedrkUkrbV87HYw6UP.oHNKChAhjBhmbopgYQuq31dLXIrAoNa").roles("admin")
            .and()
            .withUser("user").password("$2a$10$ZIvQMsCmGgUHubOOESi2IOGr1xZSe06f9NmryNcNbaXDMNbpOgo8S").roles("user");
}
```