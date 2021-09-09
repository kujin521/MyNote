## 数据处理

### 数据转换

- 使用强制转换运算符将值强制转换为其他数据类型。
- 使用转换方法将值转换为其他数据类型。
- 在执行强制转换或转换操作时防止数据丢失。
- 使用 `TryParse()` 方法安全地将字符串转换为数字数据类型。

```c#
decimal myDecimal = 3.14m;
Console.WriteLine($"decimal: {myDecimal}");

int myInt = (int)myDecimal;
Console.WriteLine($"int: {myInt}");
```

```bash
decimal: 3.14
int: 3
```

### 使用 TryParse()

TryParse() 方法可同时执行多项操作：

- 它会尝试将字符串分析成给定的数字数据类型。
- 如果成功，它会将转换后的值存储在 out 参数中。
- 它会返回布尔值来指示操作是否成功。

```c#
string[] values = { "12.3", "45", "ABC", "11", "DEF" };

decimal total = 0m;
string message = "";

foreach (var value in values)
{
    decimal number;
    if (decimal.TryParse(value, out number))
    {
        total += number;
    }
    else
    {
        message += value;
    }
}

Console.WriteLine($"Message: {message}");
Console.WriteLine($"Total: {total}");
```



## 数组

- 排列和反向排列数组元素。

  > - Array 类具有可以操纵数组大小和内容的方法。
  > - 使用 `Sort()` 方法，根据数组的给定数据类型来操纵顺序。
  > - 使用 `Reverse()` 方法来调转数组中元素的顺序。

  ```c#
  string[] pallets = { "B14", "A11", "B12", "A13" };
  
  Console.WriteLine("Sorted...");
  Array.Sort(pallets);
  foreach (var pallet in pallets)
  {
      Console.WriteLine($"-- {pallet}");
  }
  
  Console.WriteLine("");
  Console.WriteLine("Reversed...");
  Array.Reverse(pallets);
  foreach (var pallete in pallets)
  {
      Console.WriteLine($"-- {pallete}");
  }
  ```

  

- 清除数组元素及调整其大小。

- 将字符串拆分为字符串或字符 (`char`) 的数组。

- 将数组元素加入字符串。

```c#
// 反向打印单词

//原始字符串
string pangram="The quick brown fox jumps over the lazy dog";

//单词分割
string[] message=pangram.Split(' ');
//新单词组,用于存放反转单词
string[] newMessage=new string[message.Length];

//循环遍历单词
for(int i=0; i<message.Length;i++){
    char[] letters=message[i].ToCharArray();
    Array.Reverse(letters);
    newMessage[i]=new string(letters);
}

//合并new单词组
string result=String.Join(" ",newMessage);
Console.WriteLine(result);
```

遍历打印符合条件的字符串

```c#
string orderStream = "B123,C234,A345,C15,B177,G3003,C235,B179";

// Your code here
//1. 分割字符串
string[] items=orderStream.Split(',');
//2. 遍历字符串数组
foreach(var item in items){
    //3. 将B开头的ID进行打印
    if(item.StartsWith("B")){
        Console.WriteLine(item);
    }
}
```

字符串数字数据

