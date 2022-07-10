# 下载IKVM相关包

> 下载核心包：[kujin521/ikvm: The best IKVM.NET fork ever! (github.com)](https://github.com/kujin521/ikvm)
>
> 可以直接下载：https://github.com/jessielesbian/ikvm/releases/download/8.6.7.0/ikvmbin-8.6.7.0.zip

ikvm需要尽量保证开发环境一致 java1.8  net4.6

## 测试使用

### 1. 编写java项目代码

定义了一个java类 调用sayHello()返回字符串

```java
package myjava;
public class Hello {
    public String sayHello(){
        String str = "Hello, this String is from java program.";
        return str;
    }
}
```

![image-20220512143754797](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20220512143754797.png)

### 2. 编译java代码并打包成jar

```
#编译java，生成class
javac .\Hello.java
# 对所在包生成jar
jar cvf hell.jar myjava
```

![image-20220512143726815](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20220512143726815.png)

### 3. 利用ikvm 将jar转成dll

ikvmc -out:hell.dll hell.jar

```
D:\ikvmbin-8.6.7.0>ikvmc -out:hell.dll hell.jar
IKVM.NET Compiler version 8.6.7.0
Copyright (C) 2020 Jessie Lesbian (based on work by Jeroen Frijters and Windward Studios)
http://www.ikvm.net/
```

![image-20220512143954423](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20220512143954423.png)

### 4. 编写C#项目代码，引用需要的dll和ikvm相关dll

1需要调用java dll          2.java核心代码（环境）

![image-20220512144215971](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20220512144215971.png)

注意：目标框架 .net framework最低4.6

![image-20220512144621167](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20220512144621167.png)