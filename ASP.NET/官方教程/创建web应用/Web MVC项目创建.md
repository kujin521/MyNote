## 利用工具生成web应用

启动Visual Studio创建新项目

选择Asp.NET Core web应用程序

项目名: Mvcsapace

.net core5.0 mvc选项

## 1. 添加控制器

选中Controller文件夹 右键 add Controller

选择 Empty(空的) HelloWorldController

```c#
using Microsoft.AspNetCore.Mvc;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers
{
    //继承Controller 表示该类是控制器
    public class HelloWorldController : Controller
    {
        // web url追加 get连接
        // https://localhost:5001/HelloWorld
        // GET: /HelloWorld/
        // 返回string字符串
        public string Index()
        {
            return "This is my default action...";
        }

        // 
        // GET: /HelloWorld/Welcome/ 

        public string Welcome()
        {
            return "This is the Welcome action method...";
        }
        
        // GET: /HelloWorld/Welcome/ 
        // Requires using System.Text.Encodings.Web;
        public string Welcome(string name, int ID = 1)
        {
            return HtmlEncoder.Default.Encode($"Hello {name}, ID: {ID}");
        }
    }
}
```

```c#
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
});
```

- 第三个 URL 段与路由参数 `id` 相匹配。
- `Welcome` 方法包含 `MapControllerRoute` 方法中匹配 URL 模板的参数 `id`。
- 后面的 `?`（`id?` 中）表示 `id` 参数可选。

## 2. 添加视图

修改HelloWorldController类 Index方法

```c#
public IActionResult Index()
{
    return View();
}
```

前面的代码：

- 调用该控制器的 [View](https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.aspnetcore.mvc.controller.view) 方法。
- 使用视图模板生成 HTML 响应。

控制器方法：

- 称为“操作方法”。 例如，上述代码中的 `Index` 操作方法。
- 通常返回 [IActionResult](https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.aspnetcore.mvc.iactionresult) 或从 [ActionResult](https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.aspnetcore.mvc.actionresult) 派生的类，而不是 `string` 这样的类型。

在View/HelloWorld文件夹(没有?新建)

> 添加视图 选择Razor视图

创建一个名为 Views/HelloWorld/Welcome.cshtml 的 Welcome 视图模板。

在 Welcome.cshtml 视图模板中创建一个循环，显示“Hello” `NumTimes`。 使用以下内容替换 Views/HelloWorld/Welcome.cshtml 的内容：

```cshtml
@{
    ViewData["Title"] = "Welcome";
}

<h2>Welcome</h2>

<ul>
    @for (int i = 0; i < (int)ViewData["NumTimes"]; i++)
    {
        <li>@ViewData["Message"]</li>
    }
</ul>
```



1. 更改视图和布局页面(所有页面都可使用)

   Views/Shared/_Layout.cshtml 

   

2. https://localhost:{PORT}/HelloWorld/Welcome?name=Rick&numtimes=4

示例中，我们使用 `ViewData` 字典将数据从控制器传递给视图

传递数据的视图模型方法比 `ViewData` 字典方法更为优先

## 添加构架模型

1. 添加Models文件夹下 Movie.cs类

   ```c#
   using System;
   using System.ComponentModel.DataAnnotations;
   
   namespace MvcMovie.Models
   {
       public class Movie
       {
           public int Id { get; set; }
           public string Title { get; set; }
   
           [DataType(DataType.Date)]
           public DateTime ReleaseDate { get; set; }
           public string Genre { get; set; }
           public decimal Price { get; set; }
       }
   }
   ```

   

2. 添加NuGet包

   ```bash
   Install-Package Microsoft.EntityFrameworkCore.SqlServer
   ```

   

3. 创建数据库上下文

   > 需要一个数据库上下文类来协调 `Movie` 模型的 EF Core 功能（创建、读取、更新和删除）。 数据库上下文派生自 [Microsoft.EntityFrameworkCore.DbContext](https://docs.microsoft.com/zh-cn/dotnet/api/microsoft.entityframeworkcore.dbcontext) 并指定要包含在数据模型中的实体。

   创建 Data文件夹  MvcMovieContext.cs 文件

   ```c#
   using Microsoft.EntityFrameworkCore;
   using MvcMovie.Models;
   
   namespace MvcMovie.Data
   {
       public class MvcMovieContext : DbContext
       {
           public MvcMovieContext (DbContextOptions<MvcMovieContext> options)
               : base(options)
           {
           }
   
           //前面的代码为实体集创建 DbSet<Movie> 属性。 在实体框架术语中，实体集通常与数据表相对应。 实体对应表中的行。
           public DbSet<Movie> Movie { get; set; }
       }
   }
   ```

4. 注册数据库上下文

   修改Startup.ConfigureServices MvcMovieContext(关键字)

   ```c#
   public void ConfigureServices(IServiceCollection services)
   {
       services.AddControllersWithViews();
   	//通过调用 DbContextOptions 对象中的一个方法将连接字符串名称传递到上下文。 进行本地开发时，ASP.NET Core 配置系统在 appsettings.json 文件中读取连接字符串。
       services.AddDbContext<MvcMovieContext>(options =>
               options.UseSqlServer(Configuration.GetConnectionString("MvcMovieContext")));
   }
   ```

5. **appsettings.json**添加连接数据库连接字符串 MvcMovieContext(关键字)

   ```json
   {
     "Logging": {
       "LogLevel": {
         "Default": "Information",
         "Microsoft": "Warning",
         "Microsoft.Hosting.Lifetime": "Information"
       }
     },
     "AllowedHosts": "*",
     "ConnectionStrings": {
       "MvcMovieContext": "Server=(localdb)\\mssqllocaldb;Database=MvcMovieContext-1;Trusted_Connection=True;MultipleActiveResultSets=true"
     }
   }
   ```

   ```
   Server=(localdb)\\mssqllocaldb;Database=MvcMovieContext-1;Trusted_Connection=True;MultipleActiveResultSets=true
   ```

6. 使用基架

   1. 右键单击“Controllers”文件夹 >“添加”>“新搭建基架的项目”
   2. 选择“包含视图的 MVC 控制器(使用 Entity Framework)”>“添加”
   3. 填写“添加控制器”对话框：
      - 模型类：Movie (MvcMovie.Models)
      - 数据上下文类：MvcMovieContext (MvcMovie.Data)

> Visual Studio 将创建：
>
> - 电影控制器 (Controllers/MoviesController.cs)
> - “创建”、“删除”、“详细信息”、“编辑”和“索引”页面的 Razor 视图文件 (Views/Movies/*.cshtml)
>
> 自动创建这些文件称为“基架”。

## 使用 EF Core [迁移](https://docs.microsoft.com/zh-cn/aspnet/core/data/ef-mvc/migrations?view=aspnetcore-3.1)功能来创建数据库

从“工具”菜单中，选择“NuGet 包管理器”>“包管理器控制台”(PMC)

```shell
Add-Migration InitialCreate
Update-Database
```

控制器依赖注入

```c#
public class MoviesController : Controller
{
    private readonly MvcMovieContext _context;

    public MoviesController(MvcMovieContext context)
    {
        _context = context;
    }
```

构造函数使用[依赖关系注入](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-3.1)将数据库上下文 (`MvcMovieContext`) 注入到控制器中。 数据库上下文将在控制器中的每个 [CRUD](https://wikipedia.org/wiki/Create,_read,_update_and_delete) 方法中使用。



## 使用数据库

`MvcMovieContext` 对象处理连接到数据库并将 `Movie` 对象映射到数据库记录的任务。 在 Startup.cs 文件的 `ConfigureServices` 方法中向[依赖关系注入](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-3.1)容器注册数据库上下文：

```c#
public void ConfigureServices(IServiceCollection services)
{
    services.AddControllersWithViews();

    services.AddDbContext<MvcMovieContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("MvcMovieContext")));
}
```

ASP.NET Core [配置](https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1)系统会读取 `ConnectionString`。 进行本地开发时，它从 *appsettings.json* 文件获取连接字符串：

```json
"ConnectionStrings": {
  "MvcMovieContext": "Server=(localdb)\\mssqllocaldb;Database=MvcMovieContext-2;Trusted_Connection=True;MultipleActiveResultSets=true"
}
```



## 添加搜索和验证