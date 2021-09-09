![image-20210107100822894](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/asp%E6%BC%94%E5%8F%98.png)

# 学习C#教程101

文档地址: https://docs.microsoft.com/zh-cn/dotnet/csharp/

视频地址: https://www.youtube.com/playlist?list=PLdo4fOcmZ0oVxKLQCHpiUWun7vlJJvUiN

在线教程: https://docs.microsoft.com/zh-cn/dotnet/csharp/tour-of-csharp/

**什么是C#?**

C# 是一个现代的、通用的、面向对象的编程语言，它是由微软（Microsoft）开发的，由 Ecma 和 ISO 核准认可的。

C# 是由 Anders Hejlsberg 和他的团队在 .Net 框架开发期间开发的。

C# 是专为公共语言基础结构（CLI）设计的。CLI 由可执行代码和运行时环境组成，允许在不同的计算机平台和体系结构上使用各种高级语言。

下面列出了 C# 成为一种广泛应用的专业语言的原因：

- 现代的、通用的编程语言。
- 面向对象。
- 面向组件。
- 容易学习。
- 结构化语言。
- 它产生高效率的程序。
- 它可以在多种计算机平台上编译。
- .Net 框架的一部分。

C# 一些重要的功能：

- 布尔条件（Boolean Conditions）
- 自动垃圾回收（Automatic Garbage Collection）
- 标准库（Standard Library）
- 组件版本（Assembly Versioning）
- 属性（Properties）和事件（Events）
- 委托（Delegates）和事件管理（Events Management）
- 易于使用的泛型（Generics）
- 索引器（Indexers）
- 条件编译（Conditional Compilation）
- 简单的多线程（Multithreading）
- LINQ 和 Lambda 表达式
- 集成 Windows

|                  |           |           |            |                        |                       |                |
| ---------------- | --------- | --------- | ---------- | ---------------------- | --------------------- | -------------- |
| **保留关键字**   |           |           |            |                        |                       |                |
| abstract         | as        | base      | bool       | break                  | byte                  | case           |
| catch            | char      | checked   | class      | const                  | continue              | decimal        |
| default          | delegate  | do        | double     | else                   | enum                  | event          |
| explicit         | extern    | false     | finally    | fixed                  | float                 | for            |
| foreach          | goto      | if        | implicit   | in                     | in (generic modifier) | int            |
| interface        | internal  | is        | lock       | long                   | namespace             | new            |
| null             | object    | operator  | out        | out (generic modifier) | override              | params         |
| private          | protected | public    | readonly   | ref                    | return                | sbyte          |
| sealed           | short     | sizeof    | stackalloc | static                 | string                | struct         |
| switch           | this      | throw     | true       | try                    | typeof                | uint           |
| ulong            | unchecked | unsafe    | ushort     | using                  | virtual               | void           |
| volatile         | while     |           |            |                        |                       |                |
|                  |           |           |            |                        |                       |                |
| add              | alias     | ascending | descending | dynamic                | from                  | get            |
| global           | group     | into      | join       | let                    | orderby               | partial (type) |
| partial (method) | remove    | select    | set        |                        |                       |                |

**hello word**

一个 C# 程序主要包括以下部分：

- 命名空间声明（Namespace declaration）
- 一个 class
- Class 方法
- Class 属性
- 一个 Main 方法
- 语句（Statements）& 表达式（Expressions）
- 注释

```c#
using System;
namespace HelloWorldApplication
{
    /* 类名为 HelloWorld */
    
    class HelloWorld
    {
        /* main函数 */
        static void Main(string[] args)
        {
            /* 我的第一个 C# 程序 */
            Console.WriteLine("Hello World!");
            Console.ReadKey();
        }
    }
}
```

## 数据类型

以下大纲概述了 C# 的类型系统。

- 值类型
  - 简单类型
    - [有符号整型](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/builtin-types/integral-numeric-types)：`sbyte`、`short`、`int`、`long`
    - [无符号整型](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/builtin-types/integral-numeric-types)：`byte`、`ushort`、`uint`、`ulong`
    - [Unicode 字符](https://docs.microsoft.com/zh-cn/dotnet/standard/base-types/character-encoding-introduction)：`char`，表示 UTF-16 代码单元
    - [IEEE 二进制浮点](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types)：`float`、`double`
    - [高精度十进制浮点数](https://docs.microsoft.com/zh-cn/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types)：`decimal`
    - 布尔值：`bool`，表示布尔值（`true` 或 `false`）
  - 枚举类型
    - `enum E {...}` 格式的用户定义类型。 `enum` 类型是一种包含已命名常量的独特类型。 每个 `enum` 类型都有一个基础类型（必须是八种整型类型之一）。 `enum` 类型的值集与基础类型的值集相同。
  - 结构类型
    - 格式为 `struct S {...}` 的用户定义类型
  - 可以为 null 的值类型
    - 值为 `null` 的其他所有值类型的扩展
  - 元组值类型
    - 格式为 `(T1, T2, ...)` 的用户定义类型
- 引用类型
  - 类类型
    - 其他所有类型的最终基类：`object`
    - [Unicode 字符串](https://docs.microsoft.com/zh-cn/dotnet/standard/base-types/character-encoding-introduction)：`string`，表示 UTF-16 代码单元序列
    - 格式为 `class C {...}` 的用户定义类型
  - 接口类型
    - 格式为 `interface I {...}` 的用户定义类型
  - 数组类型
    - 一维、多维和交错。 例如：`int[]`、`int[,]` 和 `int[][]`
  - 委托类型
    - 格式为 `delegate int D(...)` 的用户定义类型

| 类型    | 描述                                 | 范围                                                    | 默认值 |
| :------ | :----------------------------------- | :------------------------------------------------------ | :----- |
| bool    | 布尔值                               | True 或 False                                           | False  |
| byte    | 8 位无符号整数                       | 0 到 255                                                | 0      |
| char    | 16 位 Unicode 字符                   | U +0000 到 U +ffff                                      | '\0'   |
| decimal | 128 位精确的十进制值，28-29 有效位数 | (-7.9 x 1028 到 7.9 x 1028) / 100 到 28                 | 0.0M   |
| double  | 64 位双精度浮点型                    | (+/-)5.0 x 10-324 到 (+/-)1.7 x 10308                   | 0.0D   |
| float   | 32 位单精度浮点型                    | -3.4 x 1038 到 + 3.4 x 1038                             | 0.0F   |
| int     | 32 位有符号整数类型                  | -2,147,483,648 到 2,147,483,647                         | 0      |
| long    | 64 位有符号整数类型                  | -9,223,372,036,854,775,808 到 9,223,372,036,854,775,807 | 0L     |
| sbyte   | 8 位有符号整数类型                   | -128 到 127                                             | 0      |
| short   | 16 位有符号整数类型                  | -32,768 到 32,767                                       | 0      |
| uint    | 32 位无符号整数类型                  | 0 到 4,294,967,295                                      | 0      |
| ulong   | 64 位无符号整数类型                  | 0 到 18,446,744,073,709,551,615                         | 0      |
| ushort  | 16 位无符号整数类型                  | 0 到 65,535                                             | 0      |

```c#
using System;

class Hello
{
    static void Main(){
        int i=123; //定义int类型
        object o=i; //object是所以类型的父类
        int j=(int)o; //类型转换
        Console.WriteLine($"{i},{o},{j}"); //可以输出多个值
    }
}
```

### 创建一个Stack结构的程序

> 堆栈是一个“先进后出”(FILO) 集合。 添加到堆栈顶部的新元素。 删除元素时，将从堆栈顶部删除该元素。

```c#
using System;

namespace Acme.Collections
{
    public class Stack<T>
    {
        Entry _top;
        
        public void Push(T data)
        {
            _top = new Entry(_top, data);
        }

        public T Pop()
        {
            if (_top == null)
            {
                throw new InvalidOperationException();
            }
            T result = _top.Data;
            _top = _top.Next;
            
            return result;
        }

        class Entry
        {
            public Entry Next { get; set; }
            public T Data { get; set; }
            
            public Entry(Entry next, T data)
            {
                Next = next;
                Data = data;
            }
        }
    }
}
```

```c#
using System;
using Acme.Collections;

class Example
{
    public static void Main()
    {
        var s = new Stack<int>();
        s.Push(1); // stack contains 1
        s.Push(10); // stack contains 1, 10
        s.Push(100); // stack contains 1, 10, 100
        Console.WriteLine(s.Pop()); // stack contains 1, 10
        Console.WriteLine(s.Pop()); // stack contains 1
        Console.WriteLine(s.Pop()); // stack is empty
    }
}
```

### 可空类型

> **?** : 单问号用于对 int,double,bool 等无法直接赋值为 null 的数据类型进行 null 的赋值，意思是这个数据类型是 Nullable 类型的。

```c#
int? i = 3;
```

等同于：

```c#
Nullable<int> i = new Nullable<int>(3);
```

**??** : 双问号 可用于判断一个变量在为 null 时返回一个指定的值。

接下来我们详细说明。

```c#
int i; //默认值0
int? ii; //默认值null
num3 = num1 ?? 5.34;      // num1 如果为空值则返回 5.34
```

### 声明数组

在 C# 中声明一个数组，您可以使用下面的语法：

```
datatype[] arrayName;
```

其中，

- *datatype* 用于指定被存储在数组中的元素的类型。
- *[ ]* 指定数组的秩（维度）。秩指定数组的大小。
- *arrayName* 指定数组的名称。

例如：

```c#
double[] balance;
```

### 定义结构体

```c#
using System;
using System.Text;
     
struct Books
{
   private string title;
   private string author;
   private string subject;
   private int book_id;
   public void setValues(string t, string a, string s, int id)
   {
      title = t;
      author = a;
      subject = s;
      book_id =id;
   }
   public void display()
   {
      Console.WriteLine("Title : {0}", title);
      Console.WriteLine("Author : {0}", author);
      Console.WriteLine("Subject : {0}", subject);
      Console.WriteLine("Book_id :{0}", book_id);
   }

};  

public class testStructure
{
   public static void Main(string[] args)
   {

      Books Book1 = new Books(); /* 声明 Book1，类型为 Books */
      Books Book2 = new Books(); /* 声明 Book2，类型为 Books */

      /* book 1 详述 */
      Book1.setValues("C Programming",
      "Nuha Ali", "C Programming Tutorial",6495407);

      /* book 2 详述 */
      Book2.setValues("Telecom Billing",
      "Zara Ali", "Telecom Billing Tutorial", 6495700);

      /* 打印 Book1 信息 */
      Book1.display();

      /* 打印 Book2 信息 */
      Book2.display();

      Console.ReadKey();

   }
}
```

### 声明 *enum* 变量

声明枚举的一般语法：

```c#
enum <enum_name>
{ 
    enumeration list 
};
```

```c#
using System;

public class EnumTest
{
    enum Day { Sun, Mon, Tue, Wed, Thu, Fri, Sat };

    static void Main()
    {
        int x = (int)Day.Sun;
        int y = (int)Day.Fri;
        Console.WriteLine("Sun = {0}", x);
        Console.WriteLine("Fri = {0}", y);
    }
}
```

## 条件语句

### if-else

```c#
int a = 5;
int b = 3;
if (a + b > 10)
    Console.WriteLine("The answer is greater than 10");
else
    Console.WriteLine("The answer is not greater than 10");
```

### while do…while

```c#
int counter = 0;
while (counter < 10)
{
  Console.WriteLine($"Hello World! The counter is {counter}");
  counter++;
}

int counter = 0;
do
{
  Console.WriteLine($"Hello World! The counter is {counter}");
  counter++;
} while (counter < 10);
```

### for循环

```c#
for(int counter = 0; counter < 10; counter++)
{
  Console.WriteLine($"Hello World! The counter is {counter}");
}
```

### 案例

```c#
    //计算 1 到 20 中所有可被 3 整除的整数的总和。 下面提供了一些提示：

    //% 运算符可用于获取除法运算的余数。
    //if 语句中的条件可用于判断是否应将数字计入总和。
    //for 循环有助于对 1 到 20 中的所有数字重复执行一系列步骤。

    int sum=0;
    for(int i=0;i<=20;i++){
        if(i%3==0){
            sum+=i;
        }
    }
    Console.WriteLine($" 1 到 20 中所有可被 3 整除的整数的总和 {sum}");
```

## 数据集合

```c#
// 创建一个列表
var names=new List<string>{"<name>","Ana","Felipe"};
foreach(var name in names) //遍历输出列表
{
    Console.WriteLine($"Hello {name.ToUpper()}");
}

//修改列表内容
Console.WriteLine();
names.Add("Maria");//添加列表元素
names.Add("Bill");
names.Remove("Ana");//删除列表元素
foreach (var name in names)
{
  Console.WriteLine($"Hello {name.ToUpper()}!");
}
// 通过下标访问列表
Console.WriteLine($"My name is {names[0]}.");
Console.WriteLine($"I've added {names[2]} and {names[3]} to the list.");

// 输出列表产长度
Console.WriteLine($"The list has {names.Count} people in it");

// 对列表进行排序
var index = names.IndexOf("Felipe");
if (index != -1)
  Console.WriteLine($"The name {names[index]} is at index {index}");

var notFound = names.IndexOf("Not Found");
Console.WriteLine($"When an item is not found, IndexOf returns {notFound}");

names.Sort();
foreach (var name in names)
{
  Console.WriteLine($"Hello {name.ToUpper()}!");
}
```



## c#简介

地址: https://docs.microsoft.com/zh-cn/learn/modules/csharp-write-first/1-introduction

> C# 编程语言允许你构建多种类型的应用程序，例如：
>
> - 用于捕获、分析和处理数据的业务应用程序
> - 可从 web 浏览器访问的动态 web 应用程序
> - 2D 和 3D 游戏
> - 金融和科研应用程序
> - 基于云的应用程序
> - 移动应用程序
>
> 但是如何开始？
>
> 目前为止，学习如何编写代码的最好方法是编写尽可能多的代码。 因此，我们鼓励你在本模块中的练习以及本学习路径中的其他练习一起键入。 在每个练习中自行键入代码并解决小型编码难题将加快你的学习。
>
> 此外，你还需要开始了解小的基本概念，并在此基础上不断实践和探索。
>
> 通过学习本模块，你将能够：
>
> - 编写第一批 C# 代码
> - 使用两种不同的技术将消息打印到文本控制台
> - 错误键入代码时诊断错误
> - 识别运算符、类和方法等不同 C# 语法元素
>
> 完成本模块后，你将能够编写 C# 代码来将消息打印到文本控制台，如 Windows 命令提示符。 下面的代码行将使你首先了解 C# 语法，并立即提供宝贵的见解。 事实上，此模块会引入许多新的内容，这些内容将在其他模块中展开。

输出第一句hello world

```c#
Console.WriteLine("Hello World");
```

|                  |           |           |            |                        |                       |                |
| ---------------- | --------- | --------- | ---------- | ---------------------- | --------------------- | -------------- |
| **保留关键字**   |           |           |            |                        |                       |                |
| abstract         | as        | base      | bool       | break                  | byte                  | case           |
| catch            | char      | checked   | class      | const                  | continue              | decimal        |
| default          | delegate  | do        | double     | else                   | enum                  | event          |
| explicit         | extern    | false     | finally    | fixed                  | float                 | for            |
| foreach          | goto      | if        | implicit   | in                     | in (generic modifier) | int            |
| interface        | internal  | is        | lock       | long                   | namespace             | new            |
| null             | object    | operator  | out        | out (generic modifier) | override              | params         |
| private          | protected | public    | readonly   | ref                    | return                | sbyte          |
| sealed           | short     | sizeof    | stackalloc | static                 | string                | struct         |
| switch           | this      | throw     | true       | try                    | typeof                | uint           |
| ulong            | unchecked | unsafe    | ushort     | using                  | virtual               | void           |
| volatile         | while     |           |            |                        |                       |                |
| **上下文关键字** |           |           |            |                        |                       |                |
| add              | alias     | ascending | descending | dynamic                | from                  | get            |
| global           | group     | into      | join       | let                    | orderby               | partial (type) |
| partial (method) | remove    | select    | set        |                        |                       |                |

## 编写第一个C#代码

编译器通过将人类可读的指令转换为计算机可理解的指令集来连接这两个世界。

```c#
using System;//引用别个命名空间
namespace HelloWorldApplication //所在的命名空间
{
    /* 类名为 HelloWorld */
    class HelloWorld
    {
        /* main函数 */
        static void Main(string[] args)
        {
            /* 我的第一个 C# 程序 */
            Console.WriteLine("Hello World!");
            Console.ReadKey();
        }
    }
}
```



## C#基本数据结构

在 C# 中，变量分为以下几种类型：

- 值类型（Value types）
- 引用类型（Reference types）
- 指针类型（Pointer types）

指针类型变量存储另一种类型的内存地址。C# 中的指针与 C 或 C++ 中的指针有相同的功能。

```c#
type* identifier;
char* cptr;
int* iptr;
```

当一个值类型转换为对象类型时，则被称为 **装箱**；另一方面，当一个对象类型转换为值类型时，则被称为 **拆箱**。



| 类型    | 描述                                 | 范围                                                    | 默认值 |
| :------ | :----------------------------------- | :------------------------------------------------------ | :----- |
| bool    | 布尔值                               | True 或 False                                           | False  |
| byte    | 8 位无符号整数                       | 0 到 255                                                | 0      |
| char    | 16 位 Unicode 字符                   | U +0000 到 U +ffff                                      | '\0'   |
| decimal | 128 位精确的十进制值，28-29 有效位数 | (-7.9 x 1028 到 7.9 x 1028) / 100 到 28                 | 0.0M   |
| double  | 64 位双精度浮点型                    | (+/-)5.0 x 10-324 到 (+/-)1.7 x 10308                   | 0.0D   |
| float   | 32 位单精度浮点型                    | -3.4 x 1038 到 + 3.4 x 1038                             | 0.0F   |
| int     | 32 位有符号整数类型                  | -2,147,483,648 到 2,147,483,647                         | 0      |
| long    | 64 位有符号整数类型                  | -9,223,372,036,854,775,808 到 9,223,372,036,854,775,807 | 0L     |
| sbyte   | 8 位有符号整数类型                   | -128 到 127                                             | 0      |
| short   | 16 位有符号整数类型                  | -32,768 到 32,767                                       | 0      |
| uint    | 32 位无符号整数类型                  | 0 到 4,294,967,295                                      | 0      |
| ulong   | 64 位无符号整数类型                  | 0 到 18,446,744,073,709,551,615                         | 0      |
| ushort  | 16 位无符号整数类型                  | 0 到 65,535                                             | 0      |

| 类型       | 举例                                                       |
| :--------- | :--------------------------------------------------------- |
| 整数类型   | sbyte、byte、short、ushort、int、uint、long、ulong 和 char |
| 浮点型     | float 和 double                                            |
| 十进制类型 | decimal                                                    |
| 布尔类型   | true 或 false 值，指定的值                                 |
| 空类型     | 可为空值的数据类型                                         |

## C#字符串操作

```c#
string str=@"/原样输出/";
string name="kujin";
string st=$"hello, {name}"
```



## C#基本运算

下表显示了 C# 支持的所有算术运算符。假设变量 **A** 的值为 10，变量 **B** 的值为 20，则：

| 运算符 | 描述                             | 实例             |
| :----- | :------------------------------- | :--------------- |
| +      | 把两个操作数相加                 | A + B 将得到 30  |
| -      | 从第一个操作数中减去第二个操作数 | A - B 将得到 -10 |
| *      | 把两个操作数相乘                 | A * B 将得到 200 |
| /      | 分子除以分母                     | B / A 将得到 2   |
| %      | 取模运算符，整除后的余数         | B % A 将得到 0   |
| ++     | 自增运算符，整数值增加 1         | A++ 将得到 11    |
| --     | 自减运算符，整数值减少 1         | A-- 将得到 9     |

| 运算符 | 描述                                                         | 实例              |
| :----- | :----------------------------------------------------------- | :---------------- |
| ==     | 检查两个操作数的值是否相等，如果相等则条件为真。             | (A == B) 不为真。 |
| !=     | 检查两个操作数的值是否相等，如果不相等则条件为真。           | (A != B) 为真。   |
| >      | 检查左操作数的值是否大于右操作数的值，如果是则条件为真。     | (A > B) 不为真。  |
| <      | 检查左操作数的值是否小于右操作数的值，如果是则条件为真。     | (A < B) 为真。    |
| >=     | 检查左操作数的值是否大于或等于右操作数的值，如果是则条件为真。 | (A >= B) 不为真。 |
| <=     | 检查左操作数的值是否小于或等于右操作数的值，如果是则条件为真。 | (A <= B) 为真。   |

| 运算符 | 描述                                                         | 实例              |
| :----- | :----------------------------------------------------------- | :---------------- |
| &&     | 称为逻辑与运算符。如果两个操作数都非零，则条件为真。         | (A && B) 为假。   |
| \|\|   | 称为逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。 | (A \|\| B) 为真。 |
| !      | 称为逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。 | !(A && B) 为真。  |

**位运算符**

位运算符作用于位，并逐位执行操作。&、 | 和 ^ 的真值表如下所示：

| p    | q    | p & q | p \| q | p ^ q |
| :--- | :--- | :---- | :----- | :---- |
| 0    | 0    | 0     | 0      | 0     |
| 0    | 1    | 0     | 1      | 1     |
| 1    | 1    | 1     | 1      | 0     |
| 1    | 0    | 0     | 1      | 1     |

## C#程序控制

断结构要求程序员指定一个或多个要评估或测试的条件，以及条件为真时要执行的语句（必需的）和条件为假时要执行的语句（可选的）。

下面是大多数编程语言中典型的判断结构的一般形式：

![C# 中的判断语句](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201231234635.png)

```c#
Exp1 ? Exp2 : Exp3;
```

| 环类型                                                       | 描述                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [while 循环](https://www.runoob.com/csharp/csharp-while-loop.html) | 当给定条件为真时，重复语句或语句组。它会在执行循环主体之前测试条件。 |
| [for/foreach 循环](https://www.runoob.com/csharp/csharp-for-loop.html) | 多次执行一个语句序列，简化管理循环变量的代码。               |
| [do...while 循环](https://www.runoob.com/csharp/csharp-do-while-loop.html) | 除了它是在循环主体结尾测试条件外，其他与 while 语句类似。    |
| [嵌套循环](https://www.runoob.com/csharp/csharp-nested-loops.html) | 您可以在 while、for 或 do..while 循环内使用一个或多个循环。  |

| 控制语句                                                     | 描述                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [break 语句](https://www.runoob.com/csharp/csharp-break-statement.html) | 终止 **loop** 或 **switch** 语句，程序流将继续执行紧接着 loop 或 switch 的下一条语句。 |
| [continue 语句](https://www.runoob.com/csharp/csharp-continue-statement.html) | 引起循环跳过主体的剩余部分，立即重新开始测试条件。           |



## C#中的约定 空格 注释风格

## C# 封装

- public：所有对象都可以访问；
- private：对象本身在对象内部可以访问；
- protected：只有该类对象及其子类对象可以访问
- internal：同一个程序集的对象可以访问；
- protected internal：访问限于当前程序集或派生自包含类的类型。



 

# 面向对象编程

### 类

> 类的默认访问标识符是 **internal**，成员的默认访问标识符是 **private**。

- 类的特性和修饰符
- 类的名称
- 基类（从[基类](https://docs.microsoft.com/zh-cn/dotnet/csharp/tour-of-csharp/types#base-classes)继承时）
- 接口由该类实现。

```c#
public class Point
{
    public int X { get; }
    public int Y { get; }
    
    public Point(int x, int y) => (X, Y) = (x, y);
}

var p1 = new Point(0, 0);
var p2 = new Point(10, 20);
```

#### 构造函数与析构函数

> 类的 **构造函数** 是类的一个特殊的成员函数，当创建类的新对象时执行。
>
> 构造函数的名称与类的名称完全相同，它没有任何返回类型。

> 类的 **析构函数** 是类的一个特殊的成员函数，当类的对象超出范围时执行。
>
> 析构函数的名称是在类的名称前加上一个波浪形（~）作为前缀，它不返回值，也不带任何参数。
>
> 析构函数用于在结束程序（比如关闭文件、释放内存等）之前释放资源。析构函数不能继承或重载。

#### 方法和成员

> 可以把一个**成员函数**声明为 **static**。这样的函数只能访问静态变量。静态函数在对象被创建之前就已经存在

一个方法是把一些相关的语句组织在一起，用来执行一个任务的语句块。每一个 C# 程序至少有一个带有 Main 方法的类。

要使用一个方法，您需要：

- 定义方法

  ```c#
  <Access Specifier> <Return Type> <Method Name>(Parameter List)
  {
     Method Body
  }
  ```

- 调用方法

### 异常处理

异常提供了一种把程序控制权从某个部分转移到另一个部分的方式。C# 异常处理时建立在四个关键词之上的：**try**、**catch**、**finally** 和 **throw**。

- **try**：一个 try 块标识了一个将被激活的特定的异常的代码块。后跟一个或多个 catch 块。
- **catch**：程序通过异常处理程序捕获异常。catch 关键字表示异常的捕获。
- **finally**：finally 块用于执行给定的语句，不管异常是否被抛出都会执行。例如，如果您打开一个文件，不管是否出现异常文件都要被关闭。
- **throw**：当问题出现时，程序抛出一个异常。使用 throw 关键字来完成。

| 异常类                            | 描述                                           |
| :-------------------------------- | :--------------------------------------------- |
| System.IO.IOException             | 处理 I/O 错误。                                |
| System.IndexOutOfRangeException   | 处理当方法指向超出范围的数组索引时生成的错误。 |
| System.ArrayTypeMismatchException | 处理当数组类型不匹配时生成的错误。             |
| System.NullReferenceException     | 处理当依从一个空对象时生成的错误。             |
| System.DivideByZeroException      | 处理当除以零时生成的错误。                     |
| System.InvalidCastException       | 处理在类型转换期间生成的错误。                 |
| System.OutOfMemoryException       | 处理空闲内存不足生成的错误。                   |
| System.StackOverflowException     | 处理栈溢出生成的错误。                         |



### 继承

> #### 一个类可以派生自多个类或接口，这意味着它可以从多个基类或接口继承数据和函数。
>
> **多重继承**指的是一个类别可以同时从多于一个父类继承行为与特征的功能。

### 多态

> #### **多态性**意味着有多重形式。在面向对象编程范式中，多态性往往表现为"一个接口，多个功能"。
>
> 多态性可以是静态的或动态的。在**静态多态性**中，函数的响应是在编译时发生的。在**动态多态性**中，函数的响应是在运行时发生的。

### 抽象

> C# 允许您使用关键字 **abstract** 创建抽象类
>
> - 您不能创建一个抽象类的实例。
> - 您不能在一个抽象类外部声明一个抽象方法。
> - 通过在类定义前面放置关键字 **sealed**，可以将类声明为**密封类**。当一个类被声明为 **sealed** 时，它不能被继承。抽象类不能被声明为 sealed。

重载运算符是具有特殊名称的函数，是通过关键字 **operator** 后跟运算符的符号来定义的。与其他函数一样，重载运算符有返回类型和参数列表。

### 接口

> 接口定义了所有类继承接口时应遵循的语法合同。接口定义了语法合同 **"是什么"** 部分，派生类定义了语法合同 **"怎么做"** 部分。

# C#基础进阶

## 正则表达式

(菜鸟教程)[https://www.runoob.com/csharp/csharp-regular-expressions.html]

```c#
using System;
using System.Text.RegularExpressions;

public class Example
{
   public static void Main()
   {
      string input = "1851 1999 1950 1905 2003";
      string pattern = @"(?<=19)\d{2}\b";

      foreach (Match match in Regex.Matches(input, pattern))
         Console.WriteLine(match.Value);
   }
}
```

下面的实例匹配了以 'S' 开头的单词：

```c#
using System;
using System.Text.RegularExpressions;

namespace RegExApplication
{
   class Program
   {
      private static void showMatch(string text, string expr)
      {
         Console.WriteLine("The Expression: " + expr);
         MatchCollection mc = Regex.Matches(text, expr);
         foreach (Match m in mc)
         {
            Console.WriteLine(m);
         }
      }
      static void Main(string[] args)
      {
         string str = "A Thousand Splendid Suns";

         Console.WriteLine("Matching words that start with 'S': ");
         showMatch(str, @"\bS\S*");
         Console.ReadKey();
      }
   }
}
```

下面的实例匹配了以 'm' 开头以 'e' 结尾的单词：

```c#
using System;
using System.Text.RegularExpressions;

namespace RegExApplication
{
   class Program
   {
      private static void showMatch(string text, string expr)
      {
         Console.WriteLine("The Expression: " + expr);
         MatchCollection mc = Regex.Matches(text, expr);
         foreach (Match m in mc)
         {
            Console.WriteLine(m);
         }
      }
      static void Main(string[] args)
      {
         string str = "make maze and manage to measure it";

         Console.WriteLine("Matching words start with 'm' and ends with 'e':");
         showMatch(str, @"\bm\S*e\b");
         Console.ReadKey();
      }
   }
}
```

下面的实例替换掉多余的空格：

```c#
using System;
using System.Text.RegularExpressions;

namespace RegExApplication
{
   class Program
   {
      static void Main(string[] args)
      {
         string input = "Hello   World   ";
         string pattern = "\\s+";
         string replacement = " ";
         Regex rgx = new Regex(pattern);
         string result = rgx.Replace(input, replacement);

         Console.WriteLine("Original String: {0}", input);
         Console.WriteLine("Replacement String: {0}", result);    
         Console.ReadKey();
      }
   }
}
```

## IO流操作

> 一个 **文件** 是一个存储在磁盘中带有指定名称和目录路径的数据集合。当打开文件进行读写时，它变成一个 **流**。
>
> 从根本上说，流是通过通信路径传递的字节序列。有两个主要的流：**输入流** 和 **输出流**。**输入流**用于从文件读取数据（读操作），**输出流**用于向文件写入数据（写操作）。

System.IO 命名空间有各种不同的类，用于执行各种文件操作，如创建和删除文件、读取或写入文件，关闭文件等。

下表列出了一些 System.IO 命名空间中常用的非抽象类：

| I/O 类         | 描述                               |
| :------------- | :--------------------------------- |
| BinaryReader   | 从二进制流读取原始数据。           |
| BinaryWriter   | 以二进制格式写入原始数据。         |
| BufferedStream | 字节流的临时存储。                 |
| Directory      | 有助于操作目录结构。               |
| DirectoryInfo  | 用于对目录执行操作。               |
| DriveInfo      | 提供驱动器的信息。                 |
| File           | 有助于处理文件。                   |
| FileInfo       | 用于对文件执行操作。               |
| FileStream     | 用于文件中任何位置的读写。         |
| MemoryStream   | 用于随机访问存储在内存中的数据流。 |
| Path           | 对路径信息执行操作。               |
| StreamReader   | 用于从字节流中读取字符。           |
| StreamWriter   | 用于向一个流中写入字符。           |
| StringReader   | 用于读取字符串缓冲区。             |
| StringWriter   | 用于写入字符串缓冲区。             |

### FileStream 类

System.IO 命名空间中的 **FileStream** 类有助于文件的读写与关闭。该类派生自抽象类 Stream。

您需要创建一个 **FileStream** 对象来创建一个新的文件，或打开一个已有的文件。创建 **FileStream** 对象的语法如下：

```
FileStream <object_name> = new FileStream( <file_name>,
<FileMode Enumerator>, <FileAccess Enumerator>, <FileShare Enumerator>);
```

例如，创建一个 FileStream 对象 **F** 来读取名为 **sample.txt** 的文件：

```
FileStream F = new FileStream("sample.txt", FileMode.Open, FileAccess.Read, FileShare.Read);
```

### 文本文件的读写

> **StreamReader** 和 **StreamWriter** 类用于文本文件的数据读写。这些类从抽象基类 Stream 继承，Stream 支持文件流的字节读写。

| 序号 | 方法 & 描述                                                  |
| :--- | :----------------------------------------------------------- |
| 1    | **public override void Close()** 关闭 StreamReader 对象和基础流，并释放任何与读者相关的系统资源。 |
| 2    | **public override int Peek()** 返回下一个可用的字符，但不使用它。 |
| 3    | **public override int Read()** 从输入流中读取下一个字符，并把字符位置往前移一个字符。 |

下面的实例演示了读取名为 Jamaica.txt 的文件。文件如下：

```
Down the way where the nights are gay
And the sun shines daily on the mountain top
I took a trip on a sailing ship
And when I reached Jamaica
I made a stop
```

```c#
using System;
using System.IO;

namespace FileApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                // 创建一个 StreamReader 的实例来读取文件 
                // using 语句也能关闭 StreamReader
                using (StreamReader sr = new StreamReader("c:/jamaica.txt"))
                {
                    string line;
                   
                    // 从文件读取并显示行，直到文件的末尾 
                    while ((line = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(line);
                    }
                }
            }
            catch (Exception e)
            {
                // 向用户显示出错消息
                Console.WriteLine("The file could not be read:");
                Console.WriteLine(e.Message);
            }
            Console.ReadKey();
        }
    }
}
```

| 序号 | 方法 & 描述                                                  |
| :--- | :----------------------------------------------------------- |
| 1    | **public override void Close()** 关闭当前的 StreamWriter 对象和基础流。 |
| 2    | **public override void Flush()** 清理当前编写器的所有缓冲区，使得所有缓冲数据写入基础流。 |
| 3    | **public virtual void Write(bool value)** 把一个布尔值的文本表示形式写入到文本字符串或流。（继承自 TextWriter。） |
| 4    | **public override void Write( char value )** 把一个字符写入到流。 |
| 5    | **public virtual void Write( decimal value )** 把一个十进制值的文本表示形式写入到文本字符串或流。 |
| 6    | **public virtual void Write( double value )** 把一个 8 字节浮点值的文本表示形式写入到文本字符串或流。 |
| 7    | **public virtual void Write( int value )** 把一个 4 字节有符号整数的文本表示形式写入到文本字符串或流。 |
| 8    | **public override void Write( string value )** 把一个字符串写入到流。 |
| 9    | **public virtual void WriteLine()** 把行结束符写入到文本字符串或流。 |

下面的实例演示了使用 StreamWriter 类向文件写入文本数据：

```c#
using System;
using System.IO;

namespace FileApplication
{
    class Program
    {
        static void Main(string[] args)
        {

            string[] names = new string[] {"Zara Ali", "Nuha Ali"};
            using (StreamWriter sw = new StreamWriter("names.txt"))
            {
                foreach (string s in names)
                {
                    sw.WriteLine(s);

                }
            }

            // 从文件中读取并显示每行
            string line = "";
            using (StreamReader sr = new StreamReader("names.txt"))
            {
                while ((line = sr.ReadLine()) != null)
                {
                    Console.WriteLine(line);
                }
            }
            Console.ReadKey();
        }
    }
}
```

### windows文件系统的操作

```c#
using System;
using System.IO;

namespace WindowsFileApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            // 创建一个 DirectoryInfo 对象
            DirectoryInfo mydir = new DirectoryInfo(@"c:\Windows");

            // 获取目录中的文件以及它们的名称和大小
            FileInfo [] f = mydir.GetFiles();
            foreach (FileInfo file in f)
            {
                Console.WriteLine("File Name: {0} Size: {1}",
                    file.Name, file.Length);
            }
            Console.ReadKey();
        }
    }
}
```

## 特性(Attribute)

> **特性（Attribute）**是用于在运行时传递程序中各种元素（比如类、方法、结构、枚举、组件等）的行为信息的声明性标签。您可以通过使用特性向程序添加声明性信息。一个声明性标签是通过放置在它所应用的元素前面的方括号（[ ]）来描述的。
>
> 特性（Attribute）用于添加元数据，如编译器指令和注释、描述、方法、类等其他信息。.Net 框架提供了两种类型的特性：*预定义*特性和*自定义*特性。

## 反射

> 反射指程序可以访问、检测和修改它本身状态或行为的一种能力。
>
> 程序集包含模块，而模块包含类型，类型又包含成员。反射则提供了封装程序集、模块和类型的对象。
>
> 您可以使用反射动态地创建类型的实例，将类型绑定到现有对象，或从现有对象中获取类型。然后，可以调用类型的方法或访问其字段和属性。
>
> ### 优缺点
>
> 优点：
>
> - 1、反射提高了程序的灵活性和扩展性。
> - 2、降低耦合性，提高自适应能力。
> - 3、它允许程序创建和控制任何类的对象，无需提前硬编码目标类。
>
> 缺点：
>
> - 1、性能问题：使用反射基本上是一种解释操作，用于字段和方法接入时要远慢于直接代码。因此反射机制主要应用在对灵活性和拓展性要求很高的系统框架上，普通程序不建议使用。
> - 2、使用反射会模糊程序内部逻辑；程序员希望在源代码中看到程序的逻辑，反射却绕过了源代码的技术，因而会带来维护的问题，反射代码比相应的直接代码更复杂。
>
> ## 反射（Reflection）的用途
>
> 反射（Reflection）有下列用途：
>
> - 它允许在运行时查看特性（attribute）信息。
> - 它允许审查集合中的各种类型，以及实例化这些类型。
> - 它允许延迟绑定的方法和属性（property）。
> - 它允许在运行时创建新类型，然后使用这些类型执行一些任务。

# C#创建.NET应用程序

1. 登录沙盒

   ```bash
   git clone https://github.com/MicrosoftDocs/mslearn-dotnet-files && cd mslearn-dotnet-files
   ```

   ```bash
   dotnet new console -n files-module -o .
   ```

2. 编写项目

   ```bash
   code .
   ```


## 读取和写入文件

## 从文件读取数据

通过 `File` 类上的 `ReadAllText` 方法读取文件。

```csharp
File.ReadAllText($"stores{Path.DirectorySeparatorChar}201{Path.DirectorySeparatorChar}sales.json");
```

`ReadAllText` 的返回对象是一个字符串。

```json
{
  "total": 22385.32
}
```

## 分析文件中的数据

字符串格式的此数据并没有太大好处。 它仍然只是一些字符，但现在采用了一种可以读取的格式。 你希望能够将此数据分析为可通过编程方式使用的格式。

使用 .NET 分析 JSON 文件的方法有很多，包括名为 Json.NET 的社区库。

使用 NuGet 将 Json.NET 包添加到项目中。

```bash
dotnet add package Newtonsoft.Json
```

然后，将 `using Newtonsoft.Json` 添加到类文件的顶部，再使用 `JsonConvert.DeserializeObject` 方法。

```c#
class SalesTotal
{
  public double Total { get; set; }
}

var data = JsonConvert.DeserializeObject<SalesTotal>($"stores{Path.DirectorySeparatorChar}201{Path.DirectorySeparatorChar}sales.json");

Console.WriteLine(data.Total);
```

## 将数据写入文件

```c#
var data = JsonConvert.DeserializeObject<SalesTotal>($"stores{Path.DirectorySeparatorChar}201{Path.DirectorySeparatorChar}sales.json");

File.WriteAllText($"SalesTotals{Path.DirectorySeparatorChar}totals.txt", data.Total.ToString());

// totals.txt
// 22385.32
```

### 将数据追加到文件

> 在前面的示例中，每次对文件进行写入时，都会覆盖该文件。 有时无需这样做。 有时，只是需要将数据追加到文件；而不是完全替换。 可以使用 `File.AppendAllText` 方法追加数据。 默认情况下，如果文件尚不存在，`File.AppendAllText` 将创建该文件。

```c#
var data = JsonConvert.DeserializeObject<SalesTotal>($"stores{Path.DirectorySeparatorChar}201{Path.DirectorySeparatorChar}sales.json");

File.AppendAllText($"SalesTotals{Path.DirectorySeparatorChar}totals.txt", $"{data.Total}{Environment.NewLine}");

// totals.txt
// 22385.32
// 22385.32
```

## 案例

```c#
using System;
//在文件顶部导入 System.IO 和 System.Collections.Generic 命名空间。
using System.IO;
using System.Collections.Generic;

namespace files_module
{
    class Program
    {
        //从 Main 函数调用此新的 FindFiles 函数。 传入“stores”文件夹名称作为文件的搜索位置。
        static void Main(string[] args)
        {
            var salesFiles = FindFiles("stores");

            foreach (var file in salesFiles)
            {
                Console.WriteLine(file);
            }
        }

        //创建一个名为 FindFiles 的新函数，该函数采用 folderName 参数
        static IEnumerable<string> FindFiles(string folderName){
            List<string> saleFiles=new List<string>();

            var foundFiles=Directory.EnumerateFiles(folderName,"*",SearchOption.AllDirectories);

            foreach(var file in foundFiles){
                if(file.EndsWith("sales.json")){
                    saleFiles.Add(file);
                }
            }
            return saleFiles;
        }
    }
}

```

### 查找所有 .json 文件

```c#
using System;
using System.IO;
using System.Collections.Generic;

namespace files_module
{
    class Program
    {
        static void Main(string[] args)
        {
            var currentDirectory = Directory.GetCurrentDirectory();
            var storesDirectory = Path.Combine(currentDirectory, "stores");

            var salesFiles = FindFiles(storesDirectory);

            foreach (var file in salesFiles)
            {
                Console.WriteLine(file);
            }
        }

        static IEnumerable<string> FindFiles(string folderName)
        {
            List<string> salesFiles = new List<string>();

            var foundFiles = Directory.EnumerateFiles(folderName, "*", SearchOption.AllDirectories);

            foreach (var file in foundFiles)
            {
                var extension = Path.GetExtension(file);

                if (extension == ".json")
                    salesFiles.Add(file);
            }

            return salesFiles;
        }
    }
}
```

### 创建文件和目录

```c#
using System;
using System.IO;
using System.Collections.Generic;

namespace files_module
{
    class Program
    {
        static void Main(string[] args)
        {
            var currentDirectory = Directory.GetCurrentDirectory();
            var storesDirectory = Path.Combine(currentDirectory, "stores");

            var salesTotalDir = Path.Combine(currentDirectory, "salesTotalDir");
            Directory.CreateDirectory(salesTotalDir);

            var salesFiles = FindFiles(storesDirectory);

            File.WriteAllText(Path.Combine(salesTotalDir, "totals.txt"), String.Empty);

            foreach (var file in salesFiles)
            {
                Console.WriteLine(file);
            }
        }

        static IEnumerable<string> FindFiles(string folderName)
        {
            List<string> salesFiles = new List<string>();

            var foundFiles = Directory.EnumerateFiles(folderName, "*", SearchOption.AllDirectories);

            foreach (var file in foundFiles)
            {
                var extension = Path.GetExtension(file);

                if (extension == ".json")
                    salesFiles.Add(file);
            }

            return salesFiles;
        }
    }
}
```

