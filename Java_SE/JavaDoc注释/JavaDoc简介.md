## 	一：简介

Javadoc用于描述类或者方法的作用。Javadoc可以写在类上面和方法上面。

https://docs.oracle.com/javase/7/docs/technotes/tools/windows/javadoc.html

## 二：写在类上面的Javadoc

写在类上的文档标注一般分为三段：

- 第一段：概要描述，通常用一句或者一段话简要描述该类的作用，以英文句号作为结束
- 第二段：详细描述，通常用一段或者多段话来详细描述该类的作用，一般每段话都以英文句号作为结束
- 第三段：文档标注，用于标注作者、创建时间、参阅类等信息

### 1. @link：{@link 包名.类名#方法名(参数类型)} 用于快速链接到相关代码

#### 2. @code： {@code text} 将文本标记为code

#### 3. @param

一般类中支持泛型时会通过@param来解释泛型的类型

#### 4. @author

详细描述后面一般使用@author来标记作者，如果一个文件有多个作者来维护就标记多个@author，@author 后面可以跟作者姓名(也可以附带邮箱地址)、组织	名称(也可以附带组织官网地址)

#### 5. @see 另请参阅

#### 6. @since 从以下版本开始

#### 7. @version 版本

## 三：写在方法上的Javadoc

写在方法上的文档标注一般分为三段：

- 第一段：概要描述，通常用一句或者一段话简要描述该方法的作用，以英文句号作为结束
- 第二段：详细描述，通常用一段或者多段话来详细描述该方法的作用，一般每段话都以英文句号作为结束
- 第三段：文档标注，用于标注参数、返回值、异常、参阅等

#### 8. @param

@param 后面跟参数名，再跟参数描述

#### 9. @return

@return 跟返回值的描述

#### 10. @throws

@throws 跟异常类型 异常描述 , 用于描述方法内部可能抛出的异常

#### 11. @exception

用于描述方法签名throws对应的异常

#### 12. @see

@see既可以用来类上也可以用在方法上，表示可以参考的类或者方法

#### 13. @value

用于标注在常量上，{@value} 用于表示常量的值

#### 14. @inheritDoc

@inheritDoc用于注解在重写方法或者子类上，用于继承父类中的Javadoc

- 基类的文档注释被继承到了子类
- 子类可以再加入自己的注释（特殊化扩展）
- @return @param @throws 也会被继承

## 生成Javadoc

idea生成javadoc https://www.cnblogs.com/cyberniuniu/p/5021910.html

通过IDEA生成Javadoc： Tools --> Generate JavaDoc -->
注意要配置编码，如果不配送为生成乱码，还需要配置Output directory