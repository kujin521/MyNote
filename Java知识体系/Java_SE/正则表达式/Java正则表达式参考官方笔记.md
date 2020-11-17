# 正则表达式的编译表示

> java.util.regex public final 类 Pattern
> extends Object
> implements java.io.Serializable

一个典型的调用顺序是这样

```java
Pattern p = Pattern.compile("a*b");
Matcher m = p.matcher("aaaaab");
boolean b = m.matches();
```

或则

```java
 boolean b = Pattern.matches("a*b", "aaaaab");
```



# 组和捕获

### 组号

捕获组是由左到右计算其开括号编号。 在表达式((A)(B(C)))例如，有四个这样的基团：
捕获组	编号
1			((A)(B(C)))
2			(A)
3			(B(C))
4			(C)
零代表整个表达式。