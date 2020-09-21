# JavaScript

## JavaScript概述

1. ### JavaScript是什么？有	什么作用？

### JavaScript是web强大的脚本语言

> 作用：控制页面特效展示

### 例如：

js可以对html元素进行动态控制	

js可以对表单项进行效验

js可以控制css样式

JavaScript入门案例

JavaScript的语言特征及编程注意事项

### 特征：

JavaScript无需编译，直接被浏览器解释并执行

JavaScript无法单独运行 必须嵌入到html代码中

JavaScript的执行过程由上到下依次执行

### 注意：

JavaScript没有访问系统文件的权限

由于JavaScript 无需编译 是由上到下解释执行 所以在保证可读的情况下

允许链式编程

JavaScript和java没有直接关系

JavaScript的组成

![img](C:/Users/ADMINI~1/AppData/Local/Temp/ksohtml13524/wps3.png) 

[ECMAScript](https://baike.baidu.com/item/ECMAScript)（核心）规定了js的语法和基本对象

[文档对象模型](https://baike.baidu.com/item/文档对象模型)（DOM），描述处理网页内容的方法和接口

浏览器对象模型（[BOM](https://baike.baidu.com/item/BOM/1801)），描述与浏览器进行交互的[方法](https://baike.baidu.com/item/方法/3009367)和[接口](https://baike.baidu.com/item/接口)

## JavaScript引入方式

### 内部脚本

在当前页面写script标签， script内部即可书写javascript代码

格式：

<script type=”text/javascript”>

javascript代码

</script>

实例：

```
<script>

​			//int a=10;

​			var a=10;

​			//int b=10;

​			var b=10;

​			//int temp=a+b;

​			var temp=a+b;

​			//system.out.println(temp);

		alert(temp);

​		</script>
```

### 外部脚本

在HTML文档中通过<script src=””>标签引入.js文件

格式：

<script type=”text/javascript” src=”javascript文件路径”></script>

实例：

<script src="js/德莫.js"></script>

注：外部引用标签内部不能写javacript代码 即使写了也不会执行

script标签规范化的位置（了解）

开发规定 script标签

为了快快速显示内容 将script放在</body>结束之前

# JavaScript语法及规则

## 注释

单行注释	//

多行注释 	/* */

变量

变量简述

变量：标签内存中一块空间，用于存储数据，且数据是可变的

变量的声明：

var 变量名

区分大小写

数据类型

数组：数组下标是基于零的，所以第一个项目是 [0]，第二个是 [1]，以此类推。

var cars=new Array("Saab","Volvo","BMW");

字符串：字符串中使用引号，只要不匹配包围字符串的引号即可

var answer='He is called "Johnny"';

对象：对象由花括号分隔。在括号内部，对象的属性以名称和值对的形式 (name : value) 来定义。属性由逗号分隔：

var person={firstname:"John", lastname:"Doe", id:5566};

运算符

![img](C:/Users/ADMINI~1/AppData/Local/Temp/ksohtml13524/wps4.jpg) 

## 正则对象

RegExp对象的创建方式

var reg=new RegExp(“表达式”);

var reg=/^表达式$/;

^ 开始符

$ 结束符

test方法

正则对象.test(string); 用来校验字符串是否匹配正则

全部匹配返回true 否则返回false

 

0000000000000000

 

 

 

 

## JavaScript语法及规则

 

## BOM对象

## DOM对象

## JS事件