# 相关设置

> 1. **需要将driverClass改为jdbc.driverClass=com.mysql.cj.jdbc.Driver**
> 2. **需要在jdbcUrl中把&改为&**
> 3. **需要把mysql-connector的jar包改为8.\*版本**

# 数据库存储时间相差一天

官方：https://dev.mysql.com/doc/connectors/en/connector-j-usagenotes-known-issues-limitations.html

基于Linux系统下的解决方法：参考：https://blog.csdn.net/u013983235/article/details/82884174

> **serverTimezone=Asia/Shanghai**

# 中文编码

```
useUnicode=true&characterEncoding=utf-8
```

# 综上所述，代码(db.properties)为

```xml
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/database?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8
jdbc.username=root
jdbc.password=123456
```

![点击并拖拽以移动](data:image/gif;base64,R0lGODlhAQABAPABAP///wAAACH5BAEKAAAALAAAAAABAAEAAAICRAEAOw==)

参考官方参考手册：https://dev.mysql.com/doc/connectors/en/connector-j-reference-jdbc-url-format.html