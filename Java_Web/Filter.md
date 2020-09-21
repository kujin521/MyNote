# Filter
## Filter是什么？
    1. javaweb的一个重要组件，可以对发送到servlet的请求进行拦截，并对响应也进行拦截
    2. Filter 是实现Filter 接口的java类
    3. Filter 需要在web.xml中进行配置和映射
## 如何创建一个Filter，并把它跑起来
    `public class MyFilter implements Filter {`
	web.xml
	`<filter>
        <filter-name>别名</filter-name>
        <filter-class>全类名</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>别名</filter-name>
        <url-pattern>拦截url</url-pattern>
    </filter-mapping>`
## Filter 相关API
	1. init(FilterConfig filterConfig) 单例初始化
	2. doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) 相关逻辑的处理
		/放行，传给下一个filter 如果是最后一个Filter 则传给servler（jsp）
        filterChain.doFilter(servletRequest,servletResponse);
		多个Filter 的拦截顺序与<filter-mapping>的配置顺序有关 靠前的先被调用
	3. destroy()销毁