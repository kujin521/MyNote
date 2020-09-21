# 案例

## 项目结构

![image-20200909152040578](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200909152040578.png)

## 导入依赖

```groovy
implementation 'org.springframework.boot:spring-boot-starter-aop:2.3.3.RELEASE'
```

```java
package com.example.springboot_aop.service;

import org.springframework.stereotype.Service;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/9
 * 修改时间：2020/9/9
 */
@Service
public class UserService {
    public String getUserNameById(Integer id){
        System.out.println("getUserNameById");
        return "kujin";
    }
    public void deleteUserById(Integer id){
        System.out.println("deleteUserById");
    }
}
```

```java
package com.example.springboot_aop;

import com.example.springboot_aop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/9
 * 修改时间：2020/9/9
 */
@RestController
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/getTest1")
    public String getUserNameById(Integer id){
        return userService.getUserNameById(id);
    }
    @GetMapping("/getTest2")
    public void deleteUserById(Integer id){
        userService.deleteUserById(id);
    }
}
```

```java
package com.example.springboot_aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * 类：日志组件
 * 编写人：kujin
 * 创建时间：2020/9/9
 * 修改时间：2020/9/9
 */
@Component //组件注解
@Aspect //aop 切面
public class LogComponent {
    /**
     * 定义拦截规则
     * * 表示返回值任意
     * com.example.springboot_aop.service.*.*(..) 指定包下的任意 类,方法,参数
     */
    @Pointcut("execution(* com.example.springboot_aop.service.*.*(..))")
    public void pc1(){
    }

    /**
     * 前置通知
     * pc1() 拦截规则
     * @param jp
     */
    @Before(value = "pc1()")
    public void before(JoinPoint jp){
        String name = jp.getSignature().getName();
        System.out.println("Before: "+name);
    }

    /**
     * 后置通知
     * @param jp
     */
    @After(value = "pc1()")
    public void after(JoinPoint jp){
        String name = jp.getSignature().getName();
        System.out.println("After: "+name);
    }

    /**
     * 返回通知
     * @param jp 方法对象
     * @param result 方法返回结果
     */
    @AfterReturning(value = "pc1()",returning = "result")
    public void afterReturning(JoinPoint jp,Object result){
        String name = jp.getSignature().getName();
        System.out.println("AfterReturning: "+name+" result: "+result);
    }

    /**
     * 异常通知
     * @param jp
     * @param e 异常对象
     */
    @AfterThrowing(value = "pc1()",throwing = "e")
    public void afterThrowing(JoinPoint jp,Exception e){
        String name = jp.getSignature().getName();
        System.out.println("AfterReturning: "+name+" e: "+e.getMessage());
    }

    /**
     * 环绕通知
     * @param pjp
     * @return
     */
    @Around("pc1()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        //处理方法前
        String changes="处理方法";
        Object proceed = pjp.proceed(); //相当以invoke() 方法
        //处理方法后
        proceed+=changes;
        System.out.println("around: "+proceed);
        return proceed;
    }
}

```