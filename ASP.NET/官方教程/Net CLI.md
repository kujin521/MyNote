## 示例

- 通过指定模板名称，创建 C# 控制台应用程序项目：

  ```dotnetcli
  dotnet new "Console Application"
  ```

- 在指定的目录中创建 .NET Standard 类库项目：

  ```dotnetcli
  dotnet new classlib -lang VB -o MyLibrary
  ```

- 在当前目录中新建没有设置身份验证的 ASP.NET Core C# MVC 项目：

  ```dotnetcli
  dotnet new mvc -au None
  ```

- 创建新的 xUnit 项目：

  ```dotnetcli
  dotnet new xunit
  ```

- 列出可用于单页应用程序 (SPA) 模板的所有模板：

  ```dotnetcli
  dotnet new spa -l
  ```

- 列出与“we”子字符串匹配的所有模板。 找不到完全匹配，因此子字符串匹配针对短名称和名称列运行。

  ```dotnetcli
  dotnet new we -l
  ```

- 尝试调用与 ng 匹配的模板。 如果无法确定单个匹配项，请列出部分匹配项的模板。

  ```dotnetcli
  dotnet new ng
  ```

- 安装 ASP.NET Core 的 SPA 模板 2.0 版：

  ```dotnetcli
  dotnet new -i Microsoft.DotNet.Web.Spa.ProjectTemplates::2.0.0
  ```

- 列出已安装的模板及其详细信息，包括如何卸载它们：

  ```dotnetcli
  dotnet new -u
  ```

- 在当前目录中创建 global.json，将 SDK 版本设置为 3.1.101：

  ```dotnetcli
  dotnet new globaljson --sdk-version 3.1.101
  ```