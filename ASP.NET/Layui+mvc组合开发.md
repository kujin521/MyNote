# Layui+mvc组合开发

## 01 EF Code-First使用

### EF Core入门

- 1. 创建项目

  ```shell
  dotnet new console -o EFGetStarted
  cd EFGetStarted
  ```

- 2. 安装对应数据库支持

  ```bash
  dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 5.0.5
  ```

- 3. 创建模型

  ```asp
  - using System.Collections.Generic;
    using Microsoft.EntityFrameworkCore;
  
  namespace EFGetStarted
  {
      public class BloggingContext : DbContext
      {
          public DbSet<Blog> Blogs { get; set; }
          public DbSet<Post> Posts { get; set; }
  
  ​    // The following configures EF to create a Sqlite database file as `C:\blogging.db`.
  ​    // For Mac or Linux, change this to `/tmp/blogging.db` or any other absolute path.
  ​    protected override void OnConfiguring(DbContextOptionsBuilder options)
  ​        => options.UseSqlite(@"Data Source=C:\blogging.db");
  }
  
  public class Blog
  {
      public int BlogId { get; set; }
      public string Url { get; set; }
  
  ​    public List<Post> Posts { get; } = new List<Post>();
  }
  
  public class Post
  {
      public int PostId { get; set; }
      public string Title { get; set; }
      public string Content { get; set; }
  
  ​    public int BlogId { get; set; }
  ​    public Blog Blog { get; set; }
  }
  
  }
  ```

  

- 4. 生成数据库

  ```bash
  dotnet tool install --global dotnet-ef
  dotnet add package Microsoft.EntityFrameworkCore.Design
  dotnet ef migrations add InitialCreate
  dotnet ef database update
  ```

  

- 5. 增删改查

     ```c#
     using System;
     using System.Linq;
     
     namespace EFGetStarted
     {
         internal class Program
         {
             private static void Main()
             {
                 using (var db = new BloggingContext())
                 {
                     // Note: This sample requires the database to be created before running.
     
                     // Create
                     Console.WriteLine("Inserting a new blog");
                     db.Add(new Blog { Url = "http://blogs.msdn.com/adonet" });
                     db.SaveChanges();
         
                     // Read
                     Console.WriteLine("Querying for a blog");
                     var blog = db.Blogs
                         .OrderBy(b => b.BlogId)
                         .First();
         
                     // Update
                     Console.WriteLine("Updating the blog and adding a post");
                     blog.Url = "https://devblogs.microsoft.com/dotnet";
                     blog.Posts.Add(
                         new Post { Title = "Hello World", Content = "I wrote an app using EF Core!" });
                     db.SaveChanges();
         
                     // Delete
                     Console.WriteLine("Delete the blog");
                     db.Remove(blog);
                     db.SaveChanges();
                 }
             }
         }
     }
     
     ```

     


### 两种创建方式

- DB-First:先创建数据库，通过数据库生成实体类与数据库上下文类
- Code-First：根据实体类和和数据库上下文类通过EntityFramework生成数据库

  - 1. 创建实体类2. 创建数据库上下文类3. 配置连接字符串
  - 注意：

  	- 连接字符串名称必须与数据上下文类的类名一致
  	- 实体类中以（实体类名+Id）命名的并且为int类型的属性将会被默认配置为主键和自增
  	- 实体类中以外键实体类名为导航导航属性且以外键导航属性+Id命名的属性会被配置默认为外键
  	- 数据库上下文类中以(实体类名+s)命名的DbSet类型的属性名在数据库中会被自动配置为表名

  - 注释

  	- 主键：Key
  	- 非空：Required
  	- 数据长度：StringLength 
  	- 是否映射：NotMapped 
  	- 列名：Colum 
  	- 表名：Table
  	- 外键：ForeignKey

  - 数据迁移

    - 手动迁移（建议）

      ```bash
      #开启迁移功能
      enable-migrations
      #添加配置文件
      add-migration
      #更新到数据库
      update-databse
      ```

      

    - 自动迁移（第一次）

    	- 1. 在Migtaions文件夹中的Conﬁguration类中设置：//允许自动迁移AutomaticMigrationsEnabled=true;
    	- 2. 在数据库上下文类中，设置数据库自动迁移的初始化策略
    	
    	     ```c#
    	     Database.SetInitializer(newMigrateDatabaseToLatestVersion<EfContext,Configuration>());
    	     ```
    	
    	     

## 02 layui简介

### 理解前后端

- 前端：在浏览器中可以被识别的内容(html、css、javascript)
- 后台：web应用依托于web服务器，在服务中托管的内容（处理业务逻辑、与数据库进行通信）

### 流行的前端框架

- vue/react/augular:最前沿，构建SPA（单页面），学习成本比较高，适合前后端完全分离的中大型项目
- Bootstrap:

	- 支持响应式
	- 提供了CSS
	- 封装了一些常用的组件

- Layui

	- 封装了很多交互的组件
	- 国内开发：适用与国内的开发环境
	- 原生的js/css封装的，学习门槛相对较低

### Layui基本使用

- 1. 将下载的layui文件夹中内容全部复制到mvc项目中(通常放在web应用程序中的文件夹) 2. 在项目 Views 文件夹中创建一个名为Shared文件夹，新增一个视图名为_Layout作为项目的布局页
3. 在布局页里面添加Layui的引用：
注意：
只需要引入layui.css和layui.js这两个文件就可以了
4. 为了让所有的使用布局页的页面都引入layui,通常会在Views文件里里面创建一个名为_ViewStart视图，这个视
图会在所有的视图之前运行，指定布局页
- 在layui中，封装了很多的组件模块，以便开发者做数据交互，在layui.js中，封装了对应的方法，允许开发人员动
态地引入layui的组件，提升性能。
layui组件的引入方式：
layui.use(mods,callback):动态地引入Layui中的模块，在实际开发中，先在页面中将需要用到的组件先使用
此方法一次性得加载出来，然后在对应的回调函数里面去写js代码。
关于jquery的引入：
在layui中已经内置了jq,并且将jq封装成layui的合法组件，在项目中如果要使用jq的话，直接写
layui.use('jquery',function(){})
在同一个页面引入多个组件，使用 layui.use（） 方法的第一个参数可以写成数组
在页面中也可使用 layui.module 来初始化layui的组件

## 03 项目搭建及数据表格使用

### mvc+ef web项目入门

#### 学生信息管理

- 01. 入门

  - 创建asp core web mvc项目
  - 设置网站样式

    - 修改布局文件

    	-  Views/Shared/_Layout.cshtml

    	  ```html
    	  <!DOCTYPE html>
    	  <html lang="en">
    	  <head>
    	      <meta charset="utf-8"/>
    	      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    	      @* 标题名称 *@
    	      <title>@ViewData["Title"] - 家里蹲大学</title>
    	      @* 导入css样式 *@
    	      <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.min.css"/>
    	      <link rel="stylesheet" href="~/css/site.css"/>
    	  </head>
    	  <body>
    	  @* 导航栏 *@
    	  <header>
    	      <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
    	          <div class="container">
    	              <a class="navbar-brand" asp-area="" asp-controller="Home" asp-action="Index">家里蹲大学</a>
    	              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent"
    	                      aria-expanded="false" aria-label="Toggle navigation">
    	                  <span class="navbar-toggler-icon"></span>
    	              </button>
    	              <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
    	                  <ul class="navbar-nav flex-grow-1">
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Home" asp-action="Index">主页</a>
    	                      </li>
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Students" asp-action="Index">学生</a>
    	                      </li>
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Courses" asp-action="Index">课程</a>
    	                      </li>
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Instructors" asp-action="Index">讲师</a>
    	                      </li>
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Departments" asp-action="Index">部门</a>
    	                      </li>
    	                      <li class="nav-item">
    	                          <a class="nav-link text-dark" asp-area="" asp-controller="Home" asp-action="Privacy">隐私</a>
    	                      </li>
    	                  </ul>
    	              </div>
    	          </div>
    	      </nav>
    	  </header>
    	  @* 主内容区域 *@
    	  <div class="container">
    	      <main role="main" class="pb-3">
    	          @RenderBody()
    	      </main>
    	  </div>
    	  @* 底部 *@
    	  <footer class="border-top footer text-muted">
    	      <div class="container">
    	          &copy; 2021 - 家里蹲大学 - <a asp-area="" asp-controller="Home" asp-action="Privacy">Privacy</a>
    	      </div>
    	  </footer>
    	  @* 导入js *@
    	  <script src="~/lib/jquery/dist/jquery.min.js"></script>
    	  <script src="~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    	  <script src="~/js/site.js" asp-append-version="true"></script>
    	  @await RenderSectionAsync("Scripts", required: false)
    	  </body>
    	  </html>
    	  ```
    	  
    	  
    	  

  - 添加EF Core相关包
  - 添加数据库模型
  - 创建数据库上下文
  - 测试上下文
  - 使用测试数据初始化数据
  - 创建视图控制器
  - 运行查看

- 02. 实现CRUD功能

- 相关知识

	- 约定

		- DbSet 类型的属性用作表名。 如果实体未被 DbSet 属性引用，实体类名称用作表名称。
		- 使用实体属性名作为列名。
		- 命名为 ID 或 classnameID 的实体属性识别为 PK 属性。
		- 如果将属性命名为<导航属性名称><PK 属性名称>，则该属性解释为 FK 属性。 例如 Student 导航属性的 StudentID，因为 Student 实体的 PK 为 ID。 还可以将 FK 属性命名为 <主键属性名称>。 例如 EnrollmentID，因为 Enrollment 实体的 PK 为 EnrollmentID。

	- 异步代码

		- 异步编程是 ASP.NET Core 和 EF Core 的默认模式。
		
		- 异步代码在运行时，会引入的少量开销，在低流量时对性能的影响可以忽略不计，但在针对高流量情况下潜在的性能提升是可观的。

      ```c#
  public async Task<IActionResult> Index()
  {
		  return View(await _context.Students.ToListAsync());
		  }
		  ```
		
  
		
  - async 关键字用于告知编译器该方法主体将生成回调并自动创建 Task<IActionResult> 返回对象。
		  - 返回类型 Task<IActionResult> 表示正在进行的工作返回的结果为 IActionResult 类型。
		  - await 关键字会使得编译器将方法拆分为两个部分。 第一部分是以异步方式结束已启动的操作。 第二部分是当操作完成时注入调用回调方法的地方。
		  - ToListAsync 是 ToList 扩展方法的异步版本

		- 注意事项

			- 只有导致查询或发送数据库命令的语句才能以异步方式执行。 包括 ToListAsync， SingleOrDefaultAsync，和 SaveChangesAsync。 不包括只需更改 IQueryable 的语句，如 var students = context.Students.Where(s => s.LastName == "Davolio")。
			- EF 上下文是线程不安全的： 请勿尝试并行执行多个操作。 当调用异步 EF 方法时，始终使用 await 关键字。
			- 若要利用异步代码的性能优势，请确保所使用的任何库包在它们调用导致发送至数据库的查询的任何 EF 方法时也使用异步。
		
		- 官方详解
		
			- https://docs.microsoft.com/zh-cn/dotnet/standard/async

## 04 Layui数据表格的高级应用

## 05 Layui弹窗及使用Ajax提交表单

## 06 表单高级应用

## 07 项目框架搭建及全局异常处理

## 08 后台管理系统界面搭建

## 09 用户账户管理实现
