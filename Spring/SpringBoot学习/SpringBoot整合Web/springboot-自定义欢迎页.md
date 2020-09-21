# SpringBoot 会默认访问寻找index页面

> 当static文件夹(存放静态资源)和templates文件夹(存放动态页面) 同时存在index页面时, 会优先访问static里的页面

## 案例

### 目录结构

![image-20200909154316065](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200909154316065.png)

```java
@Controller
public class WelcomeController {
    @GetMapping("/index")
    public String hello(){
        return "index";
    }
}
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>欢迎 static</h1>
</body>
</html>
```

![image-20200909154426616](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200909154426616.png)

## 添加浏览器图标

在线制作网站: https://tool.lu/favicon/