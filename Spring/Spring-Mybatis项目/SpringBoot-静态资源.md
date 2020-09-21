### 1. SpringBoot的默认配置

首先我们打开`WebMvcAutoConfiguration`类, 因为是静态资源的位置, 所以搜索`location`,找到这一行代码:

```java
 String staticPathPattern = this.mvcProperties.getStaticPathPattern();
    if (!registry.hasMappingForPattern(staticPathPattern)) {
      this.customizeResourceHandlerRegistration(registry.addResourceHandler(new String[]{staticPathPattern}).addResourceLocations(getResourceLocations(this.resourceProperties.getStaticLocations())).setCachePeriod(this.getSeconds(cachePeriod)).setCacheControl(cacheControl));
    }
```

然后进入`getStaticLocations`这个方法,到了`ResourceProperties`类中的

```java
  public String[] getStaticLocations() {
    return this.staticLocations;
  }

1234
```

这个方法,那接着看`staticLocations`这个属性,其实就到了这个类的顶部

```java
public class ResourceProperties {
  private static final String[] CLASSPATH_RESOURCE_LOCATIONS = new String[]{"classpath:/META-INF/resources/", "classpath:/resources/", "classpath:/static/", "classpath:/public/"};
  private String[] staticLocations;
  private boolean addMappings;
  private final ResourceProperties.Chain chain;
  private final ResourceProperties.Cache cache;

  public ResourceProperties() {
    this.staticLocations = CLASSPATH_RESOURCE_LOCATIONS;
    this.addMappings = true;
    this.chain = new ResourceProperties.Chain();
    this.cache = new ResourceProperties.Cache();
  }
...
}
123456789101112131415
```

可以看出,静态资源默认的位置是classpath,也就是resource目录下的:

- /META-INF/resources
- /resources
- /static
- /public

而且顺序就是数组的顺序.

### 2. 测试

我们创建一个index.html页面,然后`<h1>`标签分别是各自的路径,比如在`/META-INF/resources`下的index.html:

```html
<!DOCTYPE html >
<html>
<head lang="en">
    <meta charset="UTF-8" />
    <title>http-template</title>
</head>
<body>
<h1 >META-INF.resources</h1>
</body>
</html>
12345678910
```

在上面四个文件夹中各自放一个不同标题的页面,启动springboot,访问`localhost:8080`
可以看到页面的标题是`/META-INF/resources`, 说明是按照上面的默认配置读取顺序读取的
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190320134209874.png)
**注意,这里不需要加这个静态资源文件夹的名字!!**,比如`localhost:8080`能看到页面,但是`localhost:8080/static`或`localhost:8080/META-INF/resources`是访问不了的

为了继续证实四个文件夹都可以,我放了同一个图片在各自文件夹,只是名字不同,结构如下:
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190320112329245.png)
访问

- localhost:8080/2b.jpg
- localhost:8080/3b.jpg
- localhost:8080/4b.jpg
- localhost:8080/5b.jpg

都能访问(不需要加静态资源文件夹的名字!!!), 反而是resource根目录,也就是classpath下的1b.jpg不能访问

### 3.配置

配置一: 是否可以访问静态资源

```yml
spring:
  mvc:
    static-path-pattern: /static/**
123
```

这个配置默认是/**, 表示的是正则匹配到这种路径才去访问静态资源,所以默认情况下,上面四个能够访问的路径也必须加上`/zgd`才可以访问
**另一个需要注意的事,默认情况下访问index.html页面,不需要加这个文件名,比如localhost:8080,但是配置了该项后,需要文件名.localhost:8080/zgd/index.html**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190320112408852.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3p6emdkXzY2Ng==,size_16,color_FFFFFF,t_70)
加上`index.html`资源全称后可以访问
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190320134332590.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3p6emdkXzY2Ng==,size_16,color_FFFFFF,t_70)

配置二: 去哪找静态资源
这个配置就是我们上面说的那四个文件夹的配置了,注释掉上面的配置,启动看看

```yml
spring:
  resources:
    static-locations: classpath:/static/
```

启动访问localhost:8080
不出意料的显示的是static的标题,也就是static文件夹下的html文件.
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190320134341403.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3p6emdkXzY2Ng==,size_16,color_FFFFFF,t_70)
此时尝试访问3b.jpg,4b.jpb都是无法访问的,只能访问2b.jpg