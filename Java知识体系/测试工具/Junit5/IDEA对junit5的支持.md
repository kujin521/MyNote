# 在 IntelliJ IDEA 中使用 JUnit 5

发表于八月 2， 2016由[特里莎吉](https://blog.jetbrains.com/author/trishagee)

IntelliJ IDEA 2016.2 中的新功能之一是支持新的[JUnit 5](http://junit.org/junit5/)测试框架。几乎所有的Java开发人员都会在某个时候使用JUnit，因此发现最新版本已经与时俱进，并提供了许多新功能，其中一些功能可能为使用其他框架的人所熟悉，这非常令人兴奋。

IntelliJ IDEA 支持实际运行为 JUnit 5 编写的测试的能力 – 无需使用其他库（[例如 Gradle](http://junit.org/junit5/docs/5.0.0-M2/user-guide/#running-tests-build-gradle)或[Maven](http://junit.org/junit5/docs/5.0.0-M2/user-guide/#running-tests-build-maven)插件），您只需要包括 JUnit 5 依赖项。在这里，我们使用[Gradle](https://gradle.org/)包括对M2版本的依赖项：

![Setting up dependencies](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-1Dependencies.png)

完成此项工作后，可以开始编写使用新注释的测试：

![Simple JUnit 5 test](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-2FirstTest.png)

运行这些测试将在 IntelliJ IDEA 运行窗口中为您提供熟悉的结果：

![JUnit 5 test results](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-3RunResults.png)

您会注意到[JUnit Jupiter](http://junit.org/junit5/docs/current/user-guide/#overview-what-is-junit-5)是新 JUnit 测试的测试引擎，您可以同时运行新测试和旧测试。

乍一看，新的 JUnit 5 测试与 JUnit 4 测试没有什么不同，只是从不同的包导入的注释，并在结果上显示两种类型的运行程序。

但 JUnit 5 附带了一些新功能，例如为测试添加可读名称或说明的功能，因此您不再需要依赖方法名称，使用 ：`@DisplayName`

![Using @DisplayName](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-4DisplayName.png)

您可以对断言进行分组，以便运行所有断言，无论一个（或更多）是否失败，都能更好地查看失败的真实状态：

[![Grouping assertions](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-7GroupedAssertions.png)](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-7GroupedAssertions.png)

您可以使用注释，因此可以编写 BDD 样式的测试或按某些维度对类中的测试进行分组：`@Nested`

![Running @Nested tests](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-5Nested.png)

JUnit 5 还有一种新的处理预期异常的方法，允许您断言引发特定的异常

![JUnit 5 can expect exceptions](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-6ExpectExceptions.png)

您甚至可以获取引发异常以检查更多详细信息：

![Inspect Exception](https://blog.jetbrains.com/wp-content/uploads/2016/08/idea-8InspectException.png)

这些只是 JUnit 5 中可用的一些功能，IntelliJ 对新框架的支持也在不断发展。

如果您认为 Junit 5 看起来很有趣， 请下载[Intellij Idea 2016.2](https://www.jetbrains.com/idea/specials/idea/whatsnew.html?landing)并查看：

- [JUnit 5 用户指南](http://junit.org/junit5/docs/current/user-guide/)，供参考和示例
- [JUnit 5 = 早期](https://www.infoq.com/articles/JUnit-5-Early-Test-Drive)试驾，用于演练新功能
- [JUnit 5 上的 vJUG 会话](https://youtu.be/ct9sIsrnE9Y)。

当然，您也可以查看[IntelliJ IDEA 2016.2 中提供的功能](https://blog.jetbrains.com/idea/2016/07/intellij-idea-2016-2-is-here/)。