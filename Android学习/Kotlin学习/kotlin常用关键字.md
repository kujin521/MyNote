官方地址:https://www.kotlincn.net/docs/reference/keyword-reference.html

## 硬关键字

以下符号会始终解释为关键字，不能用作标识符：

- ```
  as
  ```

  - 用于[类型转换](https://www.kotlincn.net/docs/reference/typecasts.html#不安全的转换操作符)
  - 为[导入指定一个别名](https://www.kotlincn.net/docs/reference/packages.html#导入)

- `as?` 用于[安全类型转换](https://www.kotlincn.net/docs/reference/typecasts.html#安全的可空转换操作符)

- `break` [终止循环的执行](https://www.kotlincn.net/docs/reference/returns.html)

- `class` 声明一个[类](https://www.kotlincn.net/docs/reference/classes.html)

- `continue` [继续最近层循环的下一步](https://www.kotlincn.net/docs/reference/returns.html)

- `do` 开始一个 [do/while 循环](https://www.kotlincn.net/docs/reference/control-flow.html#while-循环)（后置条件的循环）

- `else` 定义一个 [if 表达式](https://www.kotlincn.net/docs/reference/control-flow.html#if-表达式)条件为 false 时执行的分支

- `false` 指定[布尔类型](https://www.kotlincn.net/docs/reference/basic-types.html#布尔)的“假”值

- `for` 开始一个 [for 循环](https://www.kotlincn.net/docs/reference/control-flow.html#for-循环)

- `fun` 声明一个[函数](https://www.kotlincn.net/docs/reference/functions.html)

- `if` 开始一个 [if 表达式](https://www.kotlincn.net/docs/reference/control-flow.html#if-表达式)

- ```
  in
  ```

  - 指定在 [for 循环](https://www.kotlincn.net/docs/reference/control-flow.html#for-循环)中迭代的对象
  - 用作中缀操作符以检测一个值属于[一个区间](https://www.kotlincn.net/docs/reference/ranges.html)、 一个集合或者其他[定义“contains”方法](https://www.kotlincn.net/docs/reference/operator-overloading.html#in)的实体
  - 在 [when 表达式中](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)用于上述目的
  - 将一个类型参数标记为[逆变](https://www.kotlincn.net/docs/reference/generics.html#声明处型变)

- ```
  !in
  ```

  - 用作中缀操作符以检测一个值**不**属于[一个区间](https://www.kotlincn.net/docs/reference/ranges.html)、 一个集合或者其他[定义“contains”方法](https://www.kotlincn.net/docs/reference/operator-overloading.html#in)的实体
  - 在 [when 表达式中](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)用于上述目的

- `interface` 声明一个[接口](https://www.kotlincn.net/docs/reference/interfaces.html)

- ```
  is
  ```

  - 检测[一个值具有指定类型](https://www.kotlincn.net/docs/reference/typecasts.html#is-与-is-操作符)
  - 在 [when 表达式中](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)用于上述目的

- ```
  !is
  ```

  - 检测[一个值**不**具有指定类型](https://www.kotlincn.net/docs/reference/typecasts.html#is-与-is-操作符)
  - 在 [when 表达式中](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)用于上述目的

- `null` 是表示不指向任何对象的对象引用的常量

- `object` 同时声明[一个类及其实例](https://www.kotlincn.net/docs/reference/object-declarations.html)

- `package` 指定[当前文件的包](https://www.kotlincn.net/docs/reference/packages.html)

- `return` [从最近层的函数或匿名函数返回](https://www.kotlincn.net/docs/reference/returns.html)

- ```
  super
  ```

  - [引用一个方法或属性的超类实现](https://www.kotlincn.net/docs/reference/classes.html#调用超类实现)
  - [在次构造函数中调用超类构造函数](https://www.kotlincn.net/docs/reference/classes.html#继承)

- ```
  this
  ```

  - 引用[当前接收者](https://www.kotlincn.net/docs/reference/this-expressions.html)
  - [在次构造函数中调用同一个类的另一个构造函数](https://www.kotlincn.net/docs/reference/classes.html#构造函数)

- `throw` [抛出一个异常](https://www.kotlincn.net/docs/reference/exceptions.html)

- `true` 指定[布尔类型](https://www.kotlincn.net/docs/reference/basic-types.html#布尔)的“真”值

- `try` [开始一个异常处理块](https://www.kotlincn.net/docs/reference/exceptions.html)

- `typealias` 声明一个[类型别名](https://www.kotlincn.net/docs/reference/type-aliases.html)

- `typeof` 保留以供未来使用

- `val` 声明一个只读[属性](https://www.kotlincn.net/docs/reference/properties.html)或[局部变量](https://www.kotlincn.net/docs/reference/basic-syntax.html#defining-variables)

- `var` 声明一个可变[属性](https://www.kotlincn.net/docs/reference/properties.html)或[局部变量](https://www.kotlincn.net/docs/reference/basic-syntax.html#defining-variables)

- `when` 开始一个 [when 表达式](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)（执行其中一个给定分支）

- `while` 开始一个 [while 循环](https://www.kotlincn.net/docs/reference/control-flow.html#while-循环)（前置条件的循环）

## 软关键字

以下符号在适用的上下文中充当关键字，而在其他上下文中可用作标识符：

- ```
  by
  ```

  - [将接口的实现委托给另一个对象](https://www.kotlincn.net/docs/reference/delegation.html)
  - [将属性访问器的实现委托给另一个对象](https://www.kotlincn.net/docs/reference/delegated-properties.html)

- `catch` 开始一个[处理指定异常类型](https://www.kotlincn.net/docs/reference/exceptions.html)的块

- `constructor` 声明一个[主构造函数或次构造函数](https://www.kotlincn.net/docs/reference/classes.html#构造函数)

- `delegate` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `dynamic` 引用一个 Kotlin/JS 代码中的[动态类型](https://www.kotlincn.net/docs/reference/dynamic-type.html)

- `field` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `file` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `finally` 开始一个[当 try 块退出时总会执行的块](https://www.kotlincn.net/docs/reference/exceptions.html)

- ```
  get
  ```

  - 声明[属性的 getter](https://www.kotlincn.net/docs/reference/properties.html#getters-与-setters)
  - 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `import` [将另一个包中的声明导入当前文件](https://www.kotlincn.net/docs/reference/packages.html)

- `init` 开始一个[初始化块](https://www.kotlincn.net/docs/reference/classes.html#构造函数)

- `param` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `property` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `receiver`用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- ```
  set
  ```

  - 声明[属性的 setter](https://www.kotlincn.net/docs/reference/properties.html#getters-与-setters)
  - 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `setparam` 用作[注解使用处目标](https://www.kotlincn.net/docs/reference/annotations.html#注解使用处目标)

- `where` 指定[泛型类型参数的约束](https://www.kotlincn.net/docs/reference/generics.html#上界)

## 修饰符关键字

以下符号作为声明中修饰符列表中的关键字，并可用作其他上下文中的标识符：

- `actual` 表示[多平台项目](https://www.kotlincn.net/docs/reference/multiplatform.html)中的一个平台相关实现
- `abstract` 将一个类或成员标记为[抽象](https://www.kotlincn.net/docs/reference/classes.html#抽象类)
- `annotation` 声明一个[注解类](https://www.kotlincn.net/docs/reference/annotations.html)
- `companion` 声明一个[伴生对象](https://www.kotlincn.net/docs/reference/object-declarations.html#伴生对象)
- `const` 将属性标记为[编译期常量](https://www.kotlincn.net/docs/reference/properties.html#编译期常量)
- `crossinline` 禁止[传递给内联函数的 lambda 中的非局部返回](https://www.kotlincn.net/docs/reference/inline-functions.html#非局部返回)
- `data` 指示编译器[为类生成典型成员](https://www.kotlincn.net/docs/reference/data-classes.html)
- `enum` 声明一个[枚举](https://www.kotlincn.net/docs/reference/enum-classes.html)
- `expect` 将一个声明标记为[平台相关](https://www.kotlincn.net/docs/reference/multiplatform.html)，并期待在平台模块中实现。
- `external` 将一个声明标记为不是在 Kotlin 中实现（通过 [JNI](https://www.kotlincn.net/docs/reference/java-interop.html#在-kotlin-中使用-jni) 访问或者在 [JavaScript](https://www.kotlincn.net/docs/reference/js-interop.html#external-修饰符) 中实现）
- `final` 禁止[成员覆盖](https://www.kotlincn.net/docs/reference/classes.html#覆盖方法)
- `infix` 允许以[中缀表示法](https://www.kotlincn.net/docs/reference/functions.html#中缀表示法)调用函数
- `inline` 告诉编译器[在调用处内联传给它的函数和 lambda 表达式](https://www.kotlincn.net/docs/reference/inline-functions.html)
- `inner` 允许在[嵌套类](https://www.kotlincn.net/docs/reference/nested-classes.html)中引用外部类实例
- `internal` 将一个声明标记为[在当前模块中可见](https://www.kotlincn.net/docs/reference/visibility-modifiers.html)
- `lateinit` 允许[在构造函数之外初始化非空属性](https://www.kotlincn.net/docs/reference/properties.html#延迟初始化属性与变量)
- `noinline` 关闭[传给内联函数的 lambda 表达式的内联](https://www.kotlincn.net/docs/reference/inline-functions.html#禁用内联)
- `open` 允许[一个类子类化或覆盖成员](https://www.kotlincn.net/docs/reference/classes.html#继承)
- `operator` 将一个函数标记为[重载一个操作符或者实现一个约定](https://www.kotlincn.net/docs/reference/operator-overloading.html)
- `out` 将类型参数标记为[协变](https://www.kotlincn.net/docs/reference/generics.html#声明处型变)
- `override` 将一个成员标记为[超类成员的覆盖](https://www.kotlincn.net/docs/reference/classes.html#覆盖方法)
- `private` 将一个声明标记为[在当前类或文件中可见](https://www.kotlincn.net/docs/reference/visibility-modifiers.html)
- `protected` 将一个声明标记为[在当前类及其子类中可见](https://www.kotlincn.net/docs/reference/visibility-modifiers.html)
- `public` 将一个声明标记为[在任何地方可见](https://www.kotlincn.net/docs/reference/visibility-modifiers.html)
- `reified` 将内联函数的类型参数标记为[在运行时可访问](https://www.kotlincn.net/docs/reference/inline-functions.html#具体化的类型参数)
- `sealed` 声明一个[密封类](https://www.kotlincn.net/docs/reference/sealed-classes.html)（限制子类化的类）
- `suspend` 将一个函数或 lambda 表达式标记为挂起式（可用做[协程](https://www.kotlincn.net/docs/reference/coroutines.html)）
- `tailrec` 将一个函数标记为[尾递归](https://www.kotlincn.net/docs/reference/functions.html#尾递归函数)（允许编译器将递归替换为迭代）
- `vararg` 允许[一个参数传入可变数量的参数](https://www.kotlincn.net/docs/reference/functions.html#可变数量的参数varargs)

## 特殊标识符

以下标识符由编译器在指定上下文中定义，并且可以用作其他上下文中的常规标识符：

- `field` 用在属性访问器内部来引用该[属性的幕后字段](https://www.kotlincn.net/docs/reference/properties.html#幕后字段)
- `it` 用在 lambda 表达式内部来[隐式引用其参数](https://www.kotlincn.net/docs/reference/lambdas.html#it单个参数的隐式名称)

## 操作符和特殊符号

Kotlin 支持以下操作符和特殊符号：

- ```
  + - * / %
  ```

  —— 数学操作符

  - `*` 也用于[将数组传递给 vararg 参数](https://www.kotlincn.net/docs/reference/functions.html#可变数量的参数varargs)

- ```
  =
  ```

  - 赋值操作符
  - 也用于指定[参数的默认值](https://www.kotlincn.net/docs/reference/functions.html#默认参数)

- `+=`、 `-=`、 `*=`、 `/=`、 `%=` —— [广义赋值操作符](https://www.kotlincn.net/docs/reference/operator-overloading.html#assignments)

- `++`、 `--` —— [递增与递减操作符](https://www.kotlincn.net/docs/reference/operator-overloading.html#递增与递减)

- `&&`、 `||`、 `!` —— 逻辑“与”、“或”、“非”操作符（对于位运算，请使用相应的[中缀函数](https://www.kotlincn.net/docs/reference/basic-types.html#运算)）

- `==`、 `!=` —— [相等操作符](https://www.kotlincn.net/docs/reference/operator-overloading.html#equals)（对于非原生类型会翻译为调用 `equals()`）

- `===`、 `!==` —— [引用相等操作符](https://www.kotlincn.net/docs/reference/equality.html#引用相等)

- `<`、 `>`、 `<=`、 `>=` —— [比较操作符](https://www.kotlincn.net/docs/reference/operator-overloading.html#comparison)（对于非原生类型会翻译为调用 `compareTo()`）

- `[`、 `]` —— [索引访问操作符](https://www.kotlincn.net/docs/reference/operator-overloading.html#indexed)（会翻译为调用 `get` 与 `set`）

- `!!` [断言一个表达式非空](https://www.kotlincn.net/docs/reference/null-safety.html#-操作符)

- `?.` 执行[安全调用](https://www.kotlincn.net/docs/reference/null-safety.html#安全的调用)（如果接收者非空，就调用一个方法或访问一个属性）

- `?:` 如果左侧的值为空，就取右侧的值（[elvis 操作符](https://www.kotlincn.net/docs/reference/null-safety.html#elvis-操作符)）

- `::` 创建一个[成员引用](https://www.kotlincn.net/docs/reference/reflection.html#函数引用)或者一个[类引用](https://www.kotlincn.net/docs/reference/reflection.html#类引用)

- `..` 创建一个[区间](https://www.kotlincn.net/docs/reference/ranges.html)

- `:` 分隔声明中的名称与类型

- `?` 将类型标记为[可空](https://www.kotlincn.net/docs/reference/null-safety.html#可空类型与非空类型)

- ```
  ->
  ```

  - 分隔 [lambda 表达式](https://www.kotlincn.net/docs/reference/lambdas.html#lambda-表达式语法)的参数与主体
  - 分隔在[函数类型](https://www.kotlincn.net/docs/reference/lambdas.html#函数类型)中的参数类型与返回类型声明
  - 分隔 [when 表达式](https://www.kotlincn.net/docs/reference/control-flow.html#when-表达式)分支的条件与代码体

- ```
  @
  ```

  - 引入一个[注解](https://www.kotlincn.net/docs/reference/annotations.html#用法)
  - 引入或引用一个[循环标签](https://www.kotlincn.net/docs/reference/returns.html#break-与-continue-标签)
  - 引入或引用一个 [lambda 表达式标签](https://www.kotlincn.net/docs/reference/returns.html#返回到标签)
  - 引用一个来自外部作用域的 [“this”表达式](https://www.kotlincn.net/docs/reference/this-expressions.html#限定的-this)
  - 引用一个[外部超类](https://www.kotlincn.net/docs/reference/classes.html#调用超类实现)

- `;` 分隔位于同一行的多个语句

- `$` 在[字符串模版](https://www.kotlincn.net/docs/reference/basic-types.html#字符串模板)中引用变量或者表达式

- ```
  _
  ```

  - 在 [lambda 表达式](https://www.kotlincn.net/docs/reference/lambdas.html#下划线用于未使用的变量自-11-起)中代替未使用的参数
  - 在[解构声明](https://www.kotlincn.net/docs/reference/multi-declarations.html#下划线用于未使用的变量自-11-起)中代替未使用的参数