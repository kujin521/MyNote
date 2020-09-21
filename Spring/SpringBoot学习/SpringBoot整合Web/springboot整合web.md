# HttpServlet

```java
//请求路径
@WebServlet("/myservler")
public class MyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("MyServlet do get");
    }
}
```

# 请求监听器

```java
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * 类：请求监听器
 * 编写人：kujin
 * 创建时间：2020/9/6
 * 修改时间：2020/9/6
 */
@WebListener
public class MyRequestListener implements ServletRequestListener {
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("requestDestroyed");
    }

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        System.out.println("requestInitialized");
    }
}
```

# 自定义web拦截器

```java
/**
 * 类：自定义web拦截器
 * 编写人：kujin
 * 创建时间：2020/9/6
 * 修改时间：2020/9/6
 */
@WebFilter(urlPatterns = "/*") //拦截路径
public class MyFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("doFilter 启动拦截器");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
```

# 启动webservlet扫描

```java
@SpringBootApplication
//servler所在的包路径
@ServletComponentScan(basePackages = "com.example.springboot_servlet")
public class SpringbootServletApplication {

   public static void main(String[] args) {
      SpringApplication.run(SpringbootServletApplication.class, args);
   }

}
```

# 测试案例目录结构

![image-20200906162605161](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/web-20200906162605161.png)