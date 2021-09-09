> ASP.NET Core 支持使用名为 Razor 的本地模板化引擎创建网页。 本模块介绍了如何使用 Razor 和 ASP.NET Core 创建网页。

通过学习本模块，你将能够：

- 了解在 ASP.NET Core 应用中使用 Razor Pages 的时机和原因。
- 使用 .NET CLI 创建新的应用页面。
- 创建一个支持应用的产品数据管理要求的窗体。
- 使用 Razor 的输入标记帮助程序添加客户端窗体输入验证。
- 使用数据注释添加服务器端模型验证。
- 在应用中使用 RESTful 服务以用于管理产品数据。
- 了解 HTTP 请求示例的生命周期。
- 部署并测试 Web 应用。

## 了解使用 Razor Pages 的时机和原因

Razor Pages 是一种以页面为中心的服务器端编程模型，用于使用 ASP.NET Core 构建 Web UI。 Razor Pages 具有以下优点：

- 只需使用 HTML、CSS 和 C# 的组合定义 UI 逻辑时，你可以轻松地开始构建动态 Web 应用。 与更复杂的模型-视图-控制器 (MVC) 应用模型相比，Razor Pages 提供更高的工作效率。
- 鼓励按功能组织文件，这样可简化对应用的维护。
- 可以泛指为 HTML 文件，你可以按照过去习惯的方式在其中使用标记。 你还可以使用 Razor 语法添加服务器端 C# 代码。

Razor Pages 在 C# `PageModel` 类中强制对与页面相关的数据属性和逻辑操作执行关注点分离。 模型对象通常定义数据属性，并封装与这些数据属性相关的任何逻辑或操作。 具体而言，`PageModel` ：

- 封装仅限于其 Razor 页面的数据属性和逻辑操作。
- 为发送到页面的 HTTP 请求和用于呈现页面的数据定义页面处理程序。

## 了解项目

| 名称                    | 说明                                                         |
| :---------------------- | :----------------------------------------------------------- |
| *Pages/*                | 包含 Razor Pages 和支持文件。 每个 Razor 页面都是一对文件： * 一个 .cshtml 文件，其中包含使用 Razor 语法且带有 C# 代码的标记。 * .cshtml.cs `PageModel` 类文件，用于定义页面处理程序方法和用于呈现页面的数据。 |
| *wwwroot/*              | 包含静态资产文件，例如 HTML、JavaScript 和 CSS。             |
| *Models/*               | 包含模型文件。 此项目使用一个中心模型文件进行模型验证。      |
| *ContosoPets.Ui.csproj* | 包含项目的配置元数据，例如依赖项。                           |
| *Program.cs*            | 用作应用的托管入口点。                                       |
| *Startup.cs*            | 配置应用行为，如页面之间的路由。                             |

此项目在 Models/Product.cs 中提供了 `Product` 模型。 `Product` 模型作为定义产品的数据属性的 C# [记录](https://docs.microsoft.com/zh-cn/dotnet/csharp/whats-new/csharp-9#record-types)实现。 以针对产品的 CRUD 操作为中心的所有 `PageModel` 都使用此 `Product` 模型。

## Pages/Shared 目录

按照约定，在多个 Razor Pages 上共享的分部标记元素位于 Pages/Shared 目录中。 ContosoPets.Ui 应用使用两个共享的分部视图，这些视图是在创建新的 ASP.NET Core Web 应用程序项目时包含的：

- *_Layout.cshtml*：在多个页面中提供公共布局元素。
- *_ValidationScriptsPartial.cshtml*：提供验证功能，如客户端窗体输入验证和跨站点防伪验证。 此分部视图可用于项目中的所有页面。

## Pages 目录结构和路由请求

下表提供了此模块完成的项目要用到的路由。

| URL                              | 映射到此 Razor 页面            |
| :------------------------------- | :----------------------------- |
| *www.domain.com*                 | *Pages/Index.cshtml*           |
| *www.domain.com/index*           | *Pages/Index.cshtml*           |
| *www.domain.com/products*        | *Pages/Products/Index.cshtml*  |
| *www.domain.com/products/create* | *Pages/Products/Create.cshtml* |

## 了解 Razor 页面的结构

```html
@page
@model ContosoPets.Ui.Pages.Products.CreateModel
@{
    ViewData["Title"] = "Create";
}

<h1>Create Product</h1>

<form method="post">
    <div class="form-group">
        <label asp-for="Product.Name" class="control-label"></label>
        <input asp-for="Product.Name" class="form-control" />
        <span asp-validation-for="Product.Name" class="text-danger"></span>
    </div>
    <div class="form-group">
        <label asp-for="Product.Price" class="control-label"></label>
        <input asp-for="Product.Price" class="form-control" />
        <span asp-validation-for="Product.Price" class="text-danger"></span>
    </div>
    <div class="form-group">
        <input type="submit" value="Save" class="btn btn-primary" />
    </div>
</form>

@section Scripts {
    <partial name="_ValidationScriptsPartial" />
}
```

> - `@page` 指令将页面变成了 Razor 页面。 它表示页面可处理 HTTP 请求。 `@page` 指令必须是 Razor 页面上的第一个指令。
> - `@model` 指令指定可用于 Razor 页面的模型类型。 在此示例中，该类型是 `PageModel` 派生的类名，并将其命名空间作为前缀。 如之前所述，该类是在 Pages/Products/Create.cshtml.cs 中定义的。

以下标记是 `@` 符号后跟 C# 代码的一个示例

```cshtml
@{
    ViewData["Title"] = "Create";
}
```

- 部分

  ```html
  <partial name="_ValidationScriptsPartial" />
  ```

- Label

  ```html
  <label asp-for="Product.Name" class="control-label"></label>
  ```

- 输入

  ```html
  <input asp-for="Product.Name" class="form-control" />
  ```

- 验证消息

  ```html
  <span asp-validation-for="Product.Price" class="text-danger"></span>
  ```

  ## 了解 Razor Pages `PageModel` 类的结构

  `CreateModel` 类使用空 `OnGet` 页面处理程序处理 HTTP GET 请求。 可以为任何 HTTP 谓词添加处理程序。 最常见的处理程序是：

  - `OnGet`，用于初始化页面所需的状态。
  - `OnPost`，用于处理窗体提交。

```c#
using ContosoPets.Ui.Models;
using ContosoPets.Ui.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Threading.Tasks;

namespace ContosoPets.Ui.Pages.Products
{
    public class CreateModel : PageModel
    {
        private readonly ProductService _productService;

        [BindProperty]
        public Product Product { get; set; }

        public CreateModel(ProductService productService)
        {
            _productService = productService;
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            await _productService.CreateProduct(Product);

            return RedirectToPage("Index");
        }
    }
}
```

`CreateModel` 类现在有一个异步 `OnPostAsync` 页面处理程序。 当用户发布“Create”页面的窗体时，`OnPostAsync` 将执行。 Async 命名后缀是可选的，但这是异步方法常用的命名约定。

`OnPostAsync` 页面处理程序需要为此应用执行以下任务：

- 验证发送到 `PageModel` 的用户提交数据是否有效。
- 如果尝试的 `PageModel` 更改无效，则再次向用户显示“Create”页面。 会显示一条阐明输入要求的消息。
- 如果 `PageModel` 更新有效，则会将数据更改传递到名为 `ProductService` 的服务。 `ProductService` 将处理 HTTP 请求的关注点并对 Web API 做出响应。

### 绑定模型

```c#
[BindProperty]
public Product Product { get; set; }
```

### 使用 ASP.NET Core 数据注释的内置服务器端模型验证

创建 ASP.NET Core Web 应用时提供了模型绑定和验证。 两者都在执行页面处理程序之前自动发生。 因此 `OnPostAsync` 处理程序仅需确定验证的结果。

```c#
if (!ModelState.IsValid)
{
    return Page();
}
```

> 在上述代码中，`ModelState` 表示模型绑定和验证中的错误。 如果 `ModelState` 无效，则再次向用户显示“Create”页面。 上一单元已介绍“Create”Razor 页面如何使用 ASP.NET Core 的内置客户端窗体输入验证来向用户提供响应式的输入验证反馈。
>
> 如果 `ModelState` 有效，`OnPostAsync` 页面处理程序将调用 `ProductService` 的实例。 `ProductService` 负责处理 Web API 的 HTTP 请求和响应。

```csharp
await _productService.CreateProduct(Product);
return RedirectToPage("Index");
```

