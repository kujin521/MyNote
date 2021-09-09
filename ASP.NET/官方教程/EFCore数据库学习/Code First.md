## EF Code-First使用

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
  
      // The following configures EF to create a Sqlite database file as `C:\blogging.db`.
      // For Mac or Linux, change this to `/tmp/blogging.db` or any other absolute path.
      protected override void OnConfiguring(DbContextOptionsBuilder options)
          => options.UseSqlite(@"Data Source=C:\blogging.db");
  }
  
  public class Blog
  {
      public int BlogId { get; set; }
      public string Url { get; set; }
  
     public List<Post> Posts { get; } = new List<Post>();
  }
  
  public class Post
  {
      public int PostId { get; set; }
      public string Title { get; set; }
      public string Content { get; set; }
  
     public int BlogId { get; set; }
      public Blog Blog { get; set; }
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
      Update-Database
      ```

      

    - 自动迁移（第一次）

      - 1. 在Migtaions文件夹中的Conﬁguration类中设置：//允许自动迁移AutomaticMigrationsEnabled=true;

      - 2. 在数据库上下文类中，设置数据库自动迁移的初始化策略

           ```c#
           Database.SetInitializer(newMigrateDatabaseToLatestVersion<EfContext,Configuration>());
           ```

           