# LINQ查询简介

>   查询*是一种从数据源检索数据的表达式。 查询通常用专门的查询语言来表示。 随着时间的推移，人们已经为各种数据源开发了不同的语言；例如，用于关系数据库的 SQL 和用于 XML 的 XQuery。 因此，开发人员对于他们必须支持的每种数据源或数据格式，都不得不学习一种新的查询语言。 LINQ 通过提供处理各种数据源和数据格式的数据的一致模型，简化了这一情况。 在 LINQ 查询中，始终会用到对象。 可以使用相同的基本编码模式来查询和转换 XML 文档、SQL 数据库、ADO.NET 数据集、.NET 集合中的数据以及 LINQ 提供程序可用的任何其他格式的数据。

## 查询操作

1. 获取数据源
2. 创建查询
3. 执行查询

演示代码

```c#
class IntroToLINQ
{
    static void Main()
    {
        // The Three Parts of a LINQ Query:
        // 1. Data source.
        int[] numbers = new int[7] { 0, 1, 2, 3, 4, 5, 6 };

        // 2. Query creation.
        // numQuery is an IEnumerable<int>
        var numQuery =
            from num in numbers
            where (num % 2) == 0
            select num;

        // 3. Query execution.
        foreach (int num in numQuery)
        {
            Console.Write("{0,1} ", num);
        }
    }
}
```

![完整 LINQ 查询运算的图表。](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20210310172744.png)

## 基本条件

### 关键字 **where**

LINQ 查询的条款*限制了*输出序列。只有匹配条件的元素才会添加到输出序列中。`where`

> 此示例使用 where 来查找小于5的数组的所有元素。它演示了查询的组件，包括过滤小数的 where 子句。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

var lowNums = from num in numbers
              where num < 5
              select num;

Console.WriteLine("Numbers < 5:");
foreach (var x in lowNums)
{
    Console.WriteLine(x);
}
```

> 此示例演示了一个索引 Where 子句，该子句返回名称短于其值的数字。

```c#
string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

var shortDigits = digits.Where((digit, index) => digit.Length < index);

Console.WriteLine("Short digits:");
foreach (var d in shortDigits)
{
    Console.WriteLine($"The word {d} is shorter than its value.");
}
```

### 关键字 **select**

LINQ 查询的 select 子句投影输出序列。它将每个输入元素转换为输出序列的形状

> 此示例使用 select 生成一个比现有 int 数组中的 int 高一个的 int 序列。它演示了 select 如何修改输入序列。

```C#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

var numsPlusOne = from n in numbers
                  select n + 1;

Console.WriteLine("Numbers + 1:");
foreach (var i in numsPlusOne)
{
    Console.WriteLine(i);
}
```

> 此示例使用 select 生成一个字符串序列，该字符串表示一个 int 序列的文本版本。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

var textNums = from n in numbers
               select strings[n];

Console.WriteLine("Number strings:");
foreach (var s in textNums)
{
    Console.WriteLine(s);
}
```

> 此示例使用 select 生成原始数组中每个单词的大写和小写版本的序列。输出序列中的项是匿名类型。这意味着编译器为它们生成具有相关属性的类，但该类型只有编译器知道其名称。

```C#
string[] words = { "aPPLE", "BlUeBeRrY", "cHeRry" };

var upperLowerWords = from w in words
                      select new { Upper = w.ToUpper(), Lower = w.ToLower() };

foreach (var ul in upperLowerWords)
{
    Console.WriteLine($"Uppercase: {ul.Upper}, Lowercase: {ul.Lower}");
}
```

C# 语法改进

```c#
string[] words = { "aPPLE", "BlUeBeRrY", "cHeRry" };

var upperLowerWords = from w in words
                      select (Upper: w.ToUpper(), Lower: w.ToLower());

foreach (var ul in upperLowerWords)
{
    Console.WriteLine($"Uppercase: {ul.Upper}, Lowercase: {ul.Lower}");
}
```

> 此示例使用 select 生成一个序列，该序列包含数字的文本表示以及它们的长度是偶数还是奇数。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

var digitOddEvens = from n in numbers
                    select new { Digit = strings[n], Even = (n % 2 == 0) };

foreach (var d in digitOddEvens)
{
    Console.WriteLine($"The digit {d.Digit} is {(d.Even ? "even" : "odd")}.");
}
```

使用匿名类或元组

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

var digitOddEvens = from n in numbers
                    select (Digit: strings[n], Even: (n % 2 == 0));

foreach (var d in digitOddEvens)
{
    Console.WriteLine($"The digit {d.Digit} is {(d.Even ? "even" : "odd")}.");
}
```

> 此示例结合 select 和 where 进行一个简单查询，该查询返回每个小于5的数字的文本形式。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };
string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

var lowNums = from n in numbers
              where n < 5
              select digits[n];

Console.WriteLine("Numbers < 5:");
foreach (var num in lowNums)
{
    Console.WriteLine(num);
}
```

### 从多个输入序列中选择

> 这个示例使用一个复合子句进行查询，该查询返回两个数组中的所有数对，以便从中得到的数小于从中得到的数

```c#
int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 };
int[] numbersB = { 1, 3, 5, 7, 8 };

var pairs = from a in numbersA
            from b in numbersB
            where a < b
            select (a, b);

Console.WriteLine("Pairs where a < b:");
foreach (var pair in pairs)
{
    Console.WriteLine($"{pair.a} is less than {pair.b}");
}
```

## 分区操作符

方法 Take、 Skip、 TakeWhile 和 SkipWhile 对输出序列进行分区。您可以使用它们来限制传输到输出序列的输入序列的部分。

### Take

> 此示例使用 Take 只获取数组的前3个元素。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

var first3Numbers = numbers.Take(3);

Console.WriteLine("First 3 numbers:");
foreach (var n in first3Numbers)
{
    Console.WriteLine(n);
}
```

### Skip

> 此示例使用 Skip 获取数组中除前4个元素以外的所有元素。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

var allButFirst4Numbers = numbers.Skip(4);

Console.WriteLine("All but first 4 numbers:");
foreach (var n in allButFirst4Numbers)
{
    Console.WriteLine(n);
}
```

### TakeWhile

> 此示例使用 TakeWhile 返回元素，从数组的开头开始，直到命中一个不小于6的数字。

```c#
int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

var firstNumbersLessThan6 = numbers.TakeWhile(n => n < 6);

Console.WriteLine("First numbers less than 6:");
foreach (var num in firstNumbersLessThan6)
{
    Console.WriteLine(num);
}
```















