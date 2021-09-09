# 创建rest客户端

## 先决条件

 [.NET Core 下载](https://dotnet.microsoft.com/download)

[Visual Studio Code](https://code.visualstudio.com/)

## 创建应用程序

创建一个单独文件夹,运行控制台命令

```bash
dotnet new console --name WebAPIClient
```

## 添加新的依赖项

**应用程序可以处理 JSON 响应。**

```.net cli
dotnet add package System.Text.Json
```

## 发出web请求

首先，打开项目目录中的 `program.cs` 文件，然后向 `Program` 类添加以下方法：

```c#
private static async Task ProcessRepositories()
{
}
```

需要在 `Main` 方法的最上面添加 `using` 指令，以便 C# 编译器能够识别 [Task](https://docs.microsoft.com/zh-cn/dotnet/api/system.threading.tasks.task) 类型：

```c#
using System.Threading.Tasks;
```

1. 更新 `Main` 方法以调用 `ProcessRepositories` 方法

2. `ProcessRepositories` 方法会返回一个任务，不应在此任务完成前退出程序

   添加 `async` 修饰符，并将返回类型更改为 `Task`

3. 在方法的主体中，添加对 `ProcessRepositories` 的调用。 向该方法调用添加 `await` 关键字：

```c#
static async Task Main(string[] args)
{
    await ProcessRepositories();
}
```

生成了一个不执行任何操作但具备异步功能的程序

### 改进web请求

1. 首先需要一个能从 Web 检索数据的对象；可使用 [HttpClient](https://docs.microsoft.com/zh-cn/dotnet/api/system.net.http.httpclient) 执行此操作。 此对象负责处理请求和响应。 在 Program.cs 文件内的 `Program` 类中初始化该类型的一个实例。

   ```c#
   namespace WebAPIClient
   {
       class Program
       {
           private static readonly HttpClient client = new HttpClient();
   
           static async Task Main(string[] args)
           {
               //...
           }
       }
   }
   ```

   

2. 让我们回到 `ProcessRepositories` 方法，并填充它的第一个版本：

   ```c#
   private static async Task ProcessRepositories()
   {
       client.DefaultRequestHeaders.Accept.Clear();
       client.DefaultRequestHeaders.Accept.Add(
           new MediaTypeWithQualityHeaderValue("application/vnd.github.v3+json"));
       client.DefaultRequestHeaders.Add("User-Agent", ".NET Foundation Repository Reporter");
   
       var stringTask = client.GetStringAsync("https://api.github.com/orgs/dotnet/repos");
   
       var msg = await stringTask;
       Console.Write(msg);
   }
   ```

   

3. 为了让编译能够顺利进行，还需要在文件的最上面添加两个新的 `using` 指令：

   ```c#
   using System.Net.Http;
   using System.Net.Http.Headers;
   ```

   

## 处理JSON结果

1. 将相应的 JSON 响应转换成 C# 对象

```c#
using System;

namespace WebAPIClient
{
    public class Repository
    {
        public string name { get; set; }
    }
}
```

将以上代码添加到“repo.cs”新文件中。 此版本的类表示处理 JSON 数据的最简单路径

2. 使用序列化程序将 JSON 转换成 C# 对象。 使用以下行替换 `ProcessRepositories` 方法中对 [GetStringAsync(String)](https://docs.microsoft.com/zh-cn/dotnet/api/system.net.http.httpclient.getstringasync#System_Net_Http_HttpClient_GetStringAsync_System_String_) 的调用：

   ```c#
   var streamTask = client.GetStreamAsync("https://api.github.com/orgs/dotnet/repos");
   var repositories = await JsonSerializer.DeserializeAsync<List<Repository>>(await streamTask);
   ```

   文件顶部 添加命名空间

   ```c#
   using System.Collections.Generic;
   using System.Text.Json;
   ```

3. 显示每个存储库的名称

   ```C#
   foreach (var repo in repositories)
       Console.WriteLine(repo.name);
   ```

4. 编译并运行该应用程序。 将打印属于 .NET Foundation 的存储库的名称。

## 控制序列化

1. 在添加更多功能之前，让我们通过使用 `[JsonPropertyName]` 特性来处理 `name` 属性。 对 repo.cs 中的 `name` 字段声明执行以下更改：

   ```c#
   //using System.Text.Json.Serialization;
   [JsonPropertyName("name")]
   public string Name { get; set; }
   ```

   更改意味着需要更改用于在 program.cs 中写入每个存储库名称的代码：

   ```c#
   Console.WriteLine(repo.Name);
   ```

   运行 dotnet run 查看输出

2. `ProcessRepositories` 方法可以执行异步工作，并返回一组存储库。 我们将使用此方法返回 `List<Repository>`，并将用于写入信息的代码移到 `Main` 方法中。

   ```c#
   private static async Task<List<Repository>> ProcessRepositories()
   ```

   然后，在处理 JSON 响应后仅返回存储库：

   ```c#
   var streamTask = client.GetStreamAsync("https://api.github.com/orgs/dotnet/repos");
   var repositories = await JsonSerializer.DeserializeAsync<List<Repository>>(await streamTask);
   return repositories;
   ```

   编译器将生成返回内容的 `Task<T>` 对象，因为你已将此方法标记为 `async`。 然后，我们将把 `Main` 方法修改为，捕获这些结果并将每个存储库名称写入控制台。 现在，`Main` 方法如下所示：

   ```c#
   public static async Task Main(string[] args)
   {
       var repositories = await ProcessRepositories();
   
       foreach (var repo in repositories)
           Console.WriteLine(repo.Name);
   }
   ```

   

## 读取详细信息

1. 处理 GitHub API 发送的 JSON 数据包中的其他一些属性

2. 将其他一些简单类型添加到 `Repository` 类定义中。 将这些属性添加到此类：

   ```c#
   [JsonPropertyName("description")]
   public string Description { get; set; }
   
   [JsonPropertyName("html_url")]
   public Uri GitHubHomeUrl { get; set; }
   
   [JsonPropertyName("homepage")]
   public Uri Homepage { get; set; }
   
   [JsonPropertyName("watchers")]
   public int Watchers { get; set; }
   ```

   添加这些元素后，将 `Main` 方法更新为显示它们：

   ```c#
   foreach (var repo in repositories)
   {
       Console.WriteLine(repo.Name);
       Console.WriteLine(repo.Description);
       Console.WriteLine(repo.GitHubHomeUrl);
       Console.WriteLine(repo.Homepage);
       Console.WriteLine(repo.Watchers);
       Console.WriteLine();
   }
   ```

3. 让我们添加最后一次推送操作的信息。 此信息按如下方式在 JSON 响应中进行格式化：

   ```json
   2016-02-08T21:27:00Z
   ```

   该格式为协调世界时 (UTC)，因此，你将获得一个 [DateTime](https://docs.microsoft.com/zh-cn/dotnet/api/system.datetime) 值，该值的 [Kind](https://docs.microsoft.com/zh-cn/dotnet/api/system.datetime.kind) 属性为 [Utc](https://docs.microsoft.com/zh-cn/dotnet/api/system.datetimekind#System_DateTimeKind_Utc)。 如果你倾向于以时区表示的日期，则需要编写自定义转换方法。 首先，定义一个 `public` 属性，该属性将保存 `Repository` 类中日期和时间的 UTC 表示形式，并定义一个 `LastPush` `readonly` 属性，该属性返回转换为本地时间的日期：

   ```c#
   [JsonPropertyName("pushed_at")]
   public DateTime LastPushUtc { get; set; }
   
   public DateTime LastPush => LastPushUtc.ToLocalTime();
   ```

   在控制台中再添加一个输出语句，然后就可以再次生成并运行此应用程序：

   ```c#
   Console.WriteLine(repo.LastPush);
   ```

   

