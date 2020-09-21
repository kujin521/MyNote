### IDEA新建sping boot选择 DevTools

***\*spring-boot-devtools 模块能够实现热部署，添加类  添加方法  修改配置文件  修改页面等 都能实现热部署
   原理就是重启项目，但比手动重启快多了，其深层原理是使用了两个ClassLoader，一个Classloader加载那些不会改变的类（第三方Jar包），另一个ClassLoader加载会更改的类，称为  restart ClassLoader,这样在有代码更改的时候，原来的restart ClassLoader 被丢弃，重新创建一个restart ClassLoader，由于需要加载的类相比较少，所以实现了较快的重启时间（5秒以内）\****

第一步 引入jar+插件<dependency>            <groupId>org.springframework.boot</groupId>            <artifactId>spring-boot-devtools</artifactId>            <optional>true</optional>    不能被其它模块继承，如果多个子模块可以去掉  不必须           <scope>runtime</scope>     只在运行时起作用  打包时不打进去</dependency>    添加spring-boot-maven-plugin：<build>        <plugins>            <plugin>                <groupId>org.springframework.boot</groupId>                <artifactId>spring-boot-maven-plugin</artifactId>                <configuration>                      <!--fork :  如果没有该项配置，肯呢个devtools不会起作用，即应用不会restart   这个要手动加进去 -->                    <fork>true</fork>                </configuration>            </plugin>        </plugins>   </build>

**第二部 启动项目即可**

**1. devtools会监听classpath下的文件变动，并且会立即重启应用（发生在保存时机），注意：因为其采用的虚拟机机制，该项重启是很快的。
\2. devtools可以实现页面热部署（即页面修改后会立即生效，这个可以直接在application.properties文件中配置spring.thymeleaf.cache=false来实现(这里注意不同的模板配置不一样)**

### 如果使用idea，必须确保开启运行时编译才行

1，设置File ->Setting ->Compile： 勾选“Make project automatically”选项

![img](https://img-blog.csdn.net/20170628101259378?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZGlhb21lbmcxMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

使用快捷键ctrl+alt+shift+/，选择选项Registry，打开下面的界面 并找到图中红框的选项"compller.automake.allow.when.app.running"并勾选

![img](https://img-blog.csdn.net/20170628101839728?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZGlhb21lbmcxMQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

3、重启idea即可

 

idea新建一个spring-boot工程，勾选DevTools即可，pom就会引入相应jar ，该jar默认是runtime 也就是只在运行时使用，打包时不打进去


![img](https://img-blog.csdn.net/2018092111365621?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI3ODg2OTk3/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

 

## devtools 原理说明

Spring Boot 包括一组额外的工具，可以使应用程序开发体验更加愉快。 spring-boot-devtools 模块可以包含在任何项目中，它可以节省大量的时间。 想要使用devtools支持，只需将模块依赖关系添加到你的构建中：

**Maven:**

```
<dependencies>



    <dependency>



        <groupId>org.springframework.boot</groupId>



        <artifactId>spring-boot-devtools</artifactId>



        <optional>true</optional>



    </dependency>



</dependencies>
```

**Gradle:**

```
dependencies {



    compile("org.springframework.boot:spring-boot-devtools")



}
```

运行打包的应用程序时，开发人员工具会自动禁用。如果你通过 Java -jar 或者其他特殊的类加载器进行启动时，都会被认为是“生产环境的应用”。

将依赖标记为 optional 可选是一种最佳做法，可以防止将devtools依赖传递到其他模块中。Gradle 不支持开箱即用的optional依赖项，你可以参考propdeps-plugin。

## 属性默认设置

Spring Boot 支持的一些库中会使用缓存来提高性能。例如模版引擎将缓存编译后的模板，以避免重复解析模板文件。 此外，Spring MVC可以在服务静态资源时向响应中添加HTTP缓存头。

虽然缓存在生产中非常有益，但它在开发过程中可能会产生反效果，它会阻止你看到刚刚在应用程序中进行的更改。 因此，spring-boot-devtools 将默认禁用这些缓存选项。

缓存选项通常在application.properties 文件中配置。例如，Thymeleaf提供了spring.thymeleaf.cache属性。spring-boot-devtools 模块不需要手动设置这些属性，而是自动应用合理的开发时配置。

## 自动重启

spring-boot-devtools会在类路径上的文件发生更改时自动重启。 这在IDE中工作时可能是一个有用的功能，因为它为代码更改提供了非常快的反馈循环。 默认情况下会监视类路径上的所有变动，但请注意，某些资源（如静态资源和视图模板）不需要重启应用程序。

```
触发重启



 



当DevTools监视类路径资源时，触发重启的唯一方法是更新类路径。 导致类路径更新的方式取决于你正在使用的IDE。在Eclipse中，保存修改的文件将导致类路径被更新并触发重启。 在IntelliJ IDEA中，构建项目（ Build -> Make Project ）将具有相同的效果。



 



重新启动和重新加载



 



Spring Boot提供的重新启动技术使用了两个类加载器。 不改变的类（例如，来自第三方jar的）被加载到 base 类加载器中。 你正在开发的类被加载到 restart 类加载器中。 当应用程序重启时， restart加载器将被丢弃，并创建一个新的类加载器。 这种方法意味着应用程序重启通常比“冷启动”快得多，因为 base 加载器已经已加载并且可用。
```

**1. 排除资源**

某些资源在更改时不一定需要触发重启。 例如，可以直接编辑Thymeleaf模板。 默认情况下，更改/META-INF/maven ， /META-INF/resources ， /resources ， /static ， /public或/templates中的资源不会触发重启，但会触发实时重新加载。 如果要自定义这些排除项，可以使用spring.devtools.restart.exclude属性。 例如，要仅排除/static和/public你将设置以下内容：

```
spring.devtools.restart.exclude = static / **，public / ** 
```

如果你想保留上面的默认（情况下的）值并添加其他的排除项，你可以使用

spring.devtools.restart.additional-exclude 属性。

**2. 监控额外的路径**

当你对不在类路径中的文件进行更改时，可能需要重启或重新加载应用程序。为此，请使用spring.devtools.restart.additional-paths 属性来配置监视其他路径的更改。你可以使用上述的 spring.devtools.restart.exclude 属性来控制附加路径下的更改是否会触发完全重启或只是实时重新加载 。

**3. 禁用重启**

如果不想使用重启功能，可以使用spring.devtools.restart.enabled属性来禁用它。 在大多数情况下，你可以在application.properties中设置此项（这仍将初始化重启类加载器，但不会监视文件更改）。

例如，如果你需要完全禁用重启支持，因为它不适用于特定库，则需要在调用SpringApplication.run(…)之前设置System属性。 例如：

```
public static void main(String[] args) {



    System.setProperty("spring.devtools.restart.enabled", "false");



    SpringApplication.run(MyApp.class, args);



} 
```

**4. 使用触发文件**

如果你使用自动编译已更改文件的IDE，则可能希望仅在特定时间触发重启。 为此，你可以使用“触发文件”，这是一个特殊文件，当你要实际触发重启检查时，必须修改它。 更改文件只会触发检查，只有在Devtools检测到它必须执行某些操作时才会重启。 触发文件可以手动更新，也可以通过IDE插件更新。

要使用触发器文件，请使用spring.devtools.restart.trigger-file属性。

如果你希望将spring.devtools.restart.trigger-file设置为全局配置，可以参考下面第四小节。

**5. 自定义重启类加载器**

如上面重新启动和重新加载部分所述，重启功能是通过使用两个类加载器实现的。 对于大多数应用程序，此方法运行良好，但有时可能会导致类加载问题。

默认情况下，IDE中的任何打开的项目都会使用“restart”类加载器加载，任何常规.jar文件将使用“base”类加载器加载。 如果你在多模块项目上工作，但不是每个模块都导入到IDE中，则可能需要自定义配置。 为此，你可以创建一个META-INF/spring-devtools.properties文件。

spring-devtools.properties文件可以包含restart.exclude. 和restart.include. 前缀的属性。 include元素是应该被放入“restart”类加载器的项目， exclude元素是应该放入“base”类加载器的项目。 属性的值是应用于类路径下的正则表达式。

例如：

```
restart.exclude.companycommonlibs=/mycorp-common-[\\w-]+\.jar



restart.include.projectcommon=/mycorp-myproj-[\\w-]+\.jar
```

针对通用Mapper，可以做如下配置：

```
restart.include.mapper=/mapper-[\\w-\\.]+jar
```

所有属性的键值（名字，companycommonlibs 部分）必须是唯一的，只有 restart.exclude. 和 restart.include. 开头的属性有效。

所有类路径下面的 META-INF/spring-devtools.properties 配置文件都会生效，所以你可以把该配置打包到每个模块中。

注：新版本的Mapper(3.4.1+)会默认增加该配置。

**6. 已知限制**

重启功能对使用标准ObjectInputStream对象序列化的对象不是很好 。如果需要反序列化数据，可能需要使用Spring的ConfigurableObjectInputStream配合Thread.currentThread().getContextClassLoader() 使用。

不幸的是，一些第三方库都不考虑在使用上下文类加载器的情况下反序列化。 如果你发现这样的问题，你需要向原作者请求修复。

## 实时加载

spring-boot-devtools模块包含嵌入式LiveReload服务器，可以在资源更改时用于触发浏览器刷新。 LiveReload浏览器扩展程序支持Chrome，Firefox和Safari，你可以从livereload.com免费下载。

如果你不想在应用程序运行时启动LiveReload服务器，则可以将spring.devtools.livereload.enabled属性设置为false 。

同一时间只能运行一个LiveReload服务器。 开始应用程序之前，请确保没有其他LiveReload服务器正在运行。如果从IDE启动多个应用程序，则只有第一个应用程序将支持LiveReload。

## 全局设置

你可以通过向$HOME文件夹添加名为.spring-boot-devtools.properties的文件来配置全局devtools设置（请注意，文件名以“.”开头）。 添加到此文件的任何属性将适用于你的计算机上使用devtools的所有 Spring Boot应用程序。 例如，要配置重启始终使用触发器文件 ，你可以添加以下内容：

```
〜/ .spring-boot-devtools.properties
```

-  

```
spring.devtools.reload.trigger-file=.reloadtrigger
```

- 1参考：http://blog.csdn.net/isea533/article/details/70495714