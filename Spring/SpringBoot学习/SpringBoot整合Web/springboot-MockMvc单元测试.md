## 什么是Mock

在面向对象的程序设计中，模拟对象（英语：mock object）是以可控的方式模拟真实对象行为的假对象。在编程过程中，通常通过模拟一些输入数据，来验证程序是否达到预期结果。

## 为什么使用Mock对象

使用模拟对象，可以模拟复杂的、真实的对象行为。如果在单元测试中无法使用真实对象，可采用模拟对象进行替代。

在以下情况可以采用模拟对象来替代真实对象：

- 真实对象的行为是不确定的（例如，当前的时间或温度）；
- 真实对象很难搭建起来；
- 真实对象的行为很难触发（例如，网络错误）；
- 真实对象速度很慢（例如，一个完整的数据库，在测试之前可能需要初始化）；
- 真实的对象是用户界面，或包括用户界面在内；
- 真实的对象使用了回调机制；
- 真实对象可能还不存在；
- 真实对象可能包含不能用作测试（而不是为实际工作）的信息和方法。

使用Mockito一般分三个步骤：1、模拟测试类所需的外部依赖；2、执行测试代码；3、判断执行结果是否达到预期；

## MockMvc

MockMvc是由spring-test包提供，实现了对Http请求的模拟，能够直接使用网络的形式，转换到Controller的调用，使得测试速度快、不依赖网络环境。同时提供了一套验证的工具，结果的验证十分方便。

接口MockMvcBuilder，提供一个唯一的build方法，用来构造MockMvc。主要有两个实现：StandaloneMockMvcBuilder和DefaultMockMvcBuilder，分别对应两种测试方式，即独立安装和集成Web环境测试（并不会集成真正的web环境，而是通过相应的Mock API进行模拟测试，无须启动服务器）。MockMvcBuilders提供了对应的创建方法standaloneSetup方法和webAppContextSetup方法，在使用时直接调用即可。

## SpringBoot中使用

第一步：jar包引入。创建SpringBoot项目中默认引入的spring-boot-starter-test间接引入了spring-test，因此无需再额外引入jar包。

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
</dependency>
```

第二步：创建HelloWorldController类，并提供hello方法作为待测试的业务接口。

```java
@RestController
public class HelloWorldController {
    @RequestMapping("/hello")
    public String hello(String name){
        return "Hello " + name + "!";
    }
}
```

第三步：编写测试类。实例化MockMvc有两种形式，一种是使用StandaloneMockMvcBuilder，另外一种是使用DefaultMockMvcBuilder。测试类及初始化MockMvc初始化：

```java
//SpringBoot1.4版本之前用的是SpringJUnit4ClassRunner.class
@RunWith(SpringRunner.class)
//SpringBoot1.4版本之前用的是@SpringApplicationConfiguration(classes = Application.class)
@SpringBootTest
//测试环境使用，用来表示测试环境使用的ApplicationContext将是WebApplicationContext类型的
@WebAppConfiguration
public class HelloWorldTest {

	private MockMvc mockMvc;

	@Autowired
	private WebApplicationContext webApplicationContext;

	@Before
	public void setup() {
		// 实例化方式一
		mockMvc = MockMvcBuilders.standaloneSetup(new HelloWorldController()).build();
		// 实例化方式二
//		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}
```

单元测试方法：

```java
@Test
public void testHello() throws Exception {

	/*
	 * 1、mockMvc.perform执行一个请求。
	 * 2、MockMvcRequestBuilders.get("XXX")构造一个请求。
	 * 3、ResultActions.param添加请求传值
	 * 4、ResultActions.accept(MediaType.TEXT_HTML_VALUE))设置返回类型
	 * 5、ResultActions.andExpect添加执行完成后的断言。
	 * 6、ResultActions.andDo添加一个结果处理器，表示要对结果做点什么事情
	 *   比如此处使用MockMvcResultHandlers.print()输出整个响应结果信息。
	 * 7、ResultActions.andReturn表示执行完成后返回相应的结果。
	 */
	mockMvc.perform(MockMvcRequestBuilders
			.get("/hello")
			// 设置返回值类型为utf-8，否则默认为ISO-8859-1
			.accept(MediaType.APPLICATION_JSON_UTF8_VALUE)
			.param("name", "Tom"))
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.content().string("Hello Tom!"))
			.andDo(MockMvcResultHandlers.print());
}
```

测试结果打印：

```bash
FlashMap:
       Attributes = null

MockHttpServletResponse:
           Status = 200
    Error message = null
          Headers = [Content-Type:"application/json;charset=UTF-8", Content-Length:"10"]
     Content type = application/json;charset=UTF-8
             Body = Hello Tom!
    Forwarded URL = null
   Redirected URL = null
          Cookies = []
2019-04-02 21:34:27.954  INFO 6937 --- [       Thread-2] o.s.s.concurrent.ThreadPoolTaskExecutor  : Shutting down ExecutorService 'applicationTaskExecutor'
```

整个过程如下：
1、准备测试环境
2、通过MockMvc执行请求
3、添加验证断言
4、添加结果处理器
5、得到MvcResult进行自定义断言/进行下一步的异步请求
6、卸载测试环境

注意事项：如果使用DefaultMockMvcBuilder进行MockMvc实例化时需在SpringBoot启动类上添加组件扫描的package的指定，否则会出现404。如：

```java
@ComponentScan(basePackages = "com.secbro2")
```

## 相关API

RequestBuilder提供了一个方法buildRequest(ServletContext servletContext)用于构建MockHttpServletRequest；其主要有两个子类MockHttpServletRequestBuilder和MockMultipartHttpServletRequestBuilder（如文件上传使用）。

MockMvcRequestBuilders提供get、post等多种方法用来实例化RequestBuilder。

ResultActions，MockMvc.perform(RequestBuilder requestBuilder)的返回值，提供三种能力：andExpect，添加断言判断结果是否达到预期；andDo，添加结果处理器，比如示例中的打印；andReturn，返回验证成功后的MvcResult，用于自定义验证/下一步的异步处理。

## 一些常用的测试

1.测试普通控制器

```java
mockMvc.perform(get("/user/{id}", 1)) //执行请求  
            .andExpect(model().attributeExists("user")) //验证存储模型数据  
            .andExpect(view().name("user/view")) //验证viewName  
            .andExpect(forwardedUrl("/WEB-INF/jsp/user/view.jsp"))//验证视图渲染时forward到的jsp  
            .andExpect(status().isOk())//验证状态码  
            .andDo(print()); //输出MvcResult到控制台
```

2.得到MvcResult自定义验证

```java
MvcResult result = mockMvc.perform(get("/user/{id}", 1))//执行请求  
        .andReturn(); //返回MvcResult  
Assert.assertNotNull(result.getModelAndView().getModel().get("user")); //自定义断言 
```

3.验证请求参数绑定到模型数据及Flash属性

```
mockMvc.perform(post("/user").param("name", "zhang")) //执行传递参数的POST请求(也可以post("/user?name=zhang"))  
            .andExpect(handler().handlerType(UserController.class)) //验证执行的控制器类型  
            .andExpect(handler().methodName("create")) //验证执行的控制器方法名  
            .andExpect(model().hasNoErrors()) //验证页面没有错误  
            .andExpect(flash().attributeExists("success")) //验证存在flash属性  
            .andExpect(view().name("redirect:/user")); //验证视图  
123456
```

4.文件上传

```java
byte[] bytes = new byte[] {1, 2};  
mockMvc.perform(fileUpload("/user/{id}/icon", 1L).file("icon", bytes)) //执行文件上传  
        .andExpect(model().attribute("icon", bytes)) //验证属性相等性  
        .andExpect(view().name("success")); //验证视图 
```

5.JSON请求/响应验证

```java
String requestBody = "{\"id\":1, \"name\":\"zhang\"}";  
    mockMvc.perform(post("/user")  
            .contentType(MediaType.APPLICATION_JSON).content(requestBody)  
            .accept(MediaType.APPLICATION_JSON)) //执行请求  
            .andExpect(content().contentType(MediaType.APPLICATION_JSON)) //验证响应contentType  
            .andExpect(jsonPath("$.id").value(1)); //使用Json path验证JSON 请参考http://goessner.net/articles/JsonPath/  
      
    String errorBody = "{id:1, name:zhang}";  
    MvcResult result = mockMvc.perform(post("/user")  
            .contentType(MediaType.APPLICATION_JSON).content(errorBody)  
            .accept(MediaType.APPLICATION_JSON)) //执行请求  
            .andExpect(status().isBadRequest()) //400错误请求  
            .andReturn();  
      
    Assert.assertTrue(HttpMessageNotReadableException.class.isAssignableFrom(result.getResolvedException().getClass()));//错误的请求内容体
```

6.异步测试

```java
//Callable  
    MvcResult result = mockMvc.perform(get("/user/async1?id=1&name=zhang")) //执行请求  
            .andExpect(request().asyncStarted())  
            .andExpect(request().asyncResult(CoreMatchers.instanceOf(User.class))) //默认会等10秒超时  
            .andReturn();  
      
    mockMvc.perform(asyncDispatch(result))  
            .andExpect(status().isOk())  
            .andExpect(content().contentType(MediaType.APPLICATION_JSON))  
            .andExpect(jsonPath("$.id").value(1));  
```

7.全局配置

```java
mockMvc = webAppContextSetup(wac)  
            .defaultRequest(get("/user/1").requestAttr("default", true)) //默认请求 如果其是Mergeable类型的，会自动合并的哦mockMvc.perform中的RequestBuilder  
            .alwaysDo(print())  //默认每次执行请求后都做的动作  
            .alwaysExpect(request().attribute("default", true)) //默认每次执行后进行验证的断言  
            .build();  
      
    mockMvc.perform(get("/user/1"))  
            .andExpect(model().attributeExists("user"));
```