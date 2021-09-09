Swagger (OpenAPI) 是一个与语言无关的规范，用于描述 REST API。 它使计算机和用户无需直接访问源代码即可了解 REST API 的功能。 其主要目标是：

- 尽量减少连接分离的服务所需的工作量。
- 减少准确记录服务所需的时间。

- OpenAPI 是一种规范。
- Swagger 是一种使用 OpenAPI 规范的工具。 例如，OpenAPIGenerator 和 SwaggerUI。

## OpenAPI 规范 (openapi.json)

```json
[
  {
    "date": "2021-03-				"20T12:11:13.847Z",
    "temperatureC": 0,
    "temperatureF": 0,
    "summary": "string"
  }
]
```

## Swagger UI

[Swagger UI](https://swagger.io/swagger-ui/) 提供了基于 Web 的 UI，它使用生成的 OpenAPI 规范提供有关服务的信息。 Swashbuckle 和 NSwag 均包含 Swagger UI 的嵌入式版本，因此可使用中间件注册调用将该嵌入式版本托管在 ASP.NET Core 应用中。 Web UI 如下所示：

![Swagger UI](https://docs.microsoft.com/zh-cn/aspnet/core/tutorials/web-api-help-pages-using-swagger/_static/swagger-ui.png?view=aspnetcore-5.0)



































