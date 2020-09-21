1、引入swagger maven依赖

```html
<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger2</artifactId>
			<version>2.8.0</version>
		</dependency>
		<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger-ui</artifactId>
			<version>2.8.0</version>
		</dependency>
```

2、编写swagger配置类：Swagger2Config.java

```java
@Configuration
@EnableSwagger2
public class Swagger2Config {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).select()
            	//控制器 所在的包路径 todo
                .apis(RequestHandlerSelectors.basePackage("com.kujin.springboot_fileupload.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("Restful API")
                .description("swagger Restful API文档")
                .version("1.1.0").build();
    }

}
```

3、编写测试接口：HelloController.java

```java
@RestController
@Api(tags = "测试接口-API")
public class HelloController {

    @GetMapping("/hello")
    @ApiOperation("hello的测试接口")
    @ApiImplicitParam(name = "name", value = "名称", required = true, dataType = "String")
    public String index(@RequestParam(required = true) final String name) {
        return "hello " + name;
    }

    @PostMapping("/sum")
    @ApiOperation("两整数求和接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "a", value = "参数a", required = true, dataType = "int"),
            @ApiImplicitParam(name = "b", value = "参数b", required = true, dataType = "int") })
    public String sum(@RequestParam(required = true) final Integer a, @RequestParam(required = true) final Integer b) {
        int sum = a + b;
        return "a + b = " + sum;
    }

}
```

4、启动项目，在浏览器输入http://127.0.0.1:8080/swagger-ui.html查看接口信息

![img](https://img-blog.csdnimg.cn/20181026152723782.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0xEWTEwMTY=,size_27,color_FFFFFF,t_70)

5、点击“测试接口-API”展开接口列表

![img](https://img-blog.csdnimg.cn/20181026152946118.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0xEWTEwMTY=,size_27,color_FFFFFF,t_70)

6、 测试接口：点击指定的接口，然后点击 “Tty it out”

![img](https://img-blog.csdnimg.cn/2018102615315931.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0xEWTEwMTY=,size_27,color_FFFFFF,t_70)

 7、测试接口：输入参数

![img](https://img-blog.csdnimg.cn/20181026153335621.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0xEWTEwMTY=,size_27,color_FFFFFF,t_70)

8、测试接口：点击下方的“Execute”按钮提交请求，执行结果如下

![img](https://img-blog.csdnimg.cn/20181026153611907.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0xEWTEwMTY=,size_27,color_FFFFFF,t_70)

9、swagger2常用注解说明

```properties
1、@Api：用在请求的类上，表示对类的说明
    tags="说明该类的作用，可以在UI界面上看到的注解" 
    value="该参数没什么意义，在UI界面上也看到，所以不需要配置" 
 
2、@ApiOperation：用在请求的方法上，说明方法的用途、作用 
    value="说明方法的用途、作用" 
    notes="方法的备注说明" 
 
3、@ApiImplicitParams：用在请求的方法上，表示一组参数说明 
    @ApiImplicitParam：用在@ApiImplicitParams注解中，或者单独用在只有一个参数的方法上，指定具体某一个请求参数的详细信息 
        name：参数名 
        value：参数的汉字说明、解释 
        required：参数是否必须传 
        paramType：参数放在哪个地方 
            · header --> 请求参数的获取：@RequestHeader 
            · query --> 请求参数的获取：@RequestParam 
            · path（用于restful接口）--> 请求参数的获取：@PathVariable 
            · body（不常用） 
            · form（不常用） 
        dataType：参数类型，默认String，其它值dataType="Integer" defaultValue：参数的默认值 
 
4、@ApiModel：用于响应类上，表示一个返回响应数据的信息 （这种一般用在post创建的时候，使用@RequestBody这样的场景， 请求参数无法使用@ApiImplicitParam注解进行描述的时候
    @ApiModelProperty：用在属性上，描述响应类的属性
 
5、@ApiIgnore：使用该注解忽略这个API
```

