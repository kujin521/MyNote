## 认识反射机制

参考:

​	https://docs.oracle.com/javase/9/docs/api/java/lang/Class.html

> 在java语言中,之所以会有如此众多的**开源技术**支撑,很大的一部分来源于java最大特征--**反射机制.**能够灵活的去使用反射机制进行项目的开发与设计,才能够真正接触到java的精髓.所有的技术实现的目标只有一点:**重用性.**
> --对于反射技术,首先应该考虑**"反"与"正"的概念**,所谓的"正"操作指的是当你要使用一个类的时候,要先导入程序所在的包,而后根据类进行对象的实例化,并且依靠对象调用类中的方法.但是"反"则为,根据实例化对象,**反推出其类型**.

### 功能

- 在运行时判断任意一个对象所属的类；
- 在运行时构造任意一个类的对象；
- 在运行时判断任意一个类所具有的成员变量和方法；
- 在运行时调用任意一个对象的方法；

### **反射的动态性**

- 静态加载类:编译时加载类
- 动态加载类:运行时加载类

**加载**:类加载过程的一个阶段：通过一个类的完全限定查找此类字节码文件，并利用字节码文件创建一个Class对象

**验证**:目的在于确保Class文件的字节流中包含信息符合当前虚拟机要求，不会危害虚拟机自身安全。主要包括四种验证，文件格式验证，元数据验证，字节码验证，符号引用验证。

**准备**：为类变量(即static修饰的字段变量)分配内存并且设置该类变量的初始值即0(如static int i=5;这里只将i初始化为0，至于5的值将在初始化时赋值)，这里不包含用final修饰的static，因为final在编译的时候就会分配了，注意这里不会为实例变量分配初始化，类变量会分配在方法区中，而实例变量是会随着对象一起分配到Java堆中。

**解析**：主要将常量池中的符号引用替换为直接引用的过程。符号引用就是一组符号来描述目标，可以是任何字面量，而直接引用就是直接指向目标的指针、相对偏移量或一个间接定位到目标的句柄。有类或接口的解析，字段解析，类方法解析，接口方法解析(这里涉及到字节码变量的引用，如需更详细了解，可参考《深入Java虚拟机》)。

**初始化**：类加载最后阶段，若该类具有超类，则对其进行初始化，执行静态初始化器和静态初始化成员变量(如前面只初始化了默认值的static变量将会在这个阶段赋值，成员变量也将被初始化)。

![img](https://img-blog.csdn.net/20170430160610299?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvamF2YXplamlhbg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 类加载器

### 概述

在虚拟机提供了3种类加载器，引导（Bootstrap）类加载器、扩展（Extension）类加载器、系统（System）类加载器（也称应用类加载器）

![image-20201001151052771](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201001151052.png)

### 分类

`启动（Bootstrap）类加载器`：启动类加载器是用本地代码实现的类加载器，它负责将JAVA_HOME/lib下面的核心类库或-Xbootclasspath选项指定的jar包等虚拟机识别的类库加载到内存中。由于启动类加载器涉及到虚拟机本地实现细节，开发者无法直接获取到启动类加载器的引用。具体可由启动类加载器加载到的路径可通过`System.getProperty(“sun.boot.class.path”)`查看。

`扩展（Extension）类加载器`：扩展类加载器是由Sun的ExtClassLoader（sun.misc.Launcher$ExtClassLoader）实现的，它负责将JAVA_HOME /lib/ext或者由系统变量-Djava.ext.dir指定位置中的类库加载到内存中。开发者可以直接使用标准扩展类加载器，具体可由扩展类加载器加载到的路径可通过`System.getProperty("java.ext.dirs")`查看。

`系统（System）类加载器`：系统类加载器是由 Sun 的 AppClassLoader（sun.misc.Launcher$AppClassLoader）实现的，它负责将用户类路径(java -classpath或-Djava.class.path变量所指的目录，即当前类所在路径及其引用的第三方类库的路径，如第四节中的问题6所述)下的类库加载到内存中。开发者可以

### 作用

## 案例

### 榨汁机

```java
package com.kujin.reflect;

import java.io.*;

/**
 * 水果榨汁机-学习反射机制
 * @author kujin
 * 创建时间：2020/10/1
 * @version 1
 */
public class Juicer_Reflect {
    public static void main(String[] args) throws IOException, ClassNotFoundException, IllegalAccessException, InstantiationException {
        //demo1_interfacse();

        //由于接口 也需要不断改变main函数 的代码 有此产生 通过修改配置文件的方式 实现代码的更新
        // 如果找不到路径 可以创建一下 然后编辑 包路径.Apple(具体的类)
        File file=new File("config.properties");
        if (!file.exists()){
            file.createNewFile();
        }
        // 读取配置 文件,利用配置文件进行反射
        BufferedReader bufferedReader=new BufferedReader(new FileReader(file));
        Class<?> aClass = Class.forName(bufferedReader.readLine());
        Fruit fruit= (Fruit) aClass.newInstance();
        Juicer juicer = new Juicer();
        juicer.run(fruit);
    }

    private static void demo1_interfacse() {
        Juicer juicer = new Juicer();
        juicer.run(new Apple());
//        juicer.run(new Orange()); //需要创建一个接口 利用多态 实现 子类对象
        juicer.run(new Orange());
    }
}
class Juicer{
//    public void run(Apple o){ //只能实现一种类型
//        o.squeeze();
//    }
    public void run(Fruit fruit){   //利用接口实现多种水果类型
        fruit.squeeze();
    }
}

/**
 * 定义水果接口
 */
interface Fruit{
    public void squeeze();
}

/**
 * 定义苹果 实现水果接口
 */
class Apple implements Fruit{
    public void squeeze(){
        System.out.println("榨出一杯苹果汁");
    }
}

/**
 * 定义橙子 实现 水果接口
 */
class Orange implements Fruit{
    public void squeeze(){
        System.out.println("榨出一杯橙汁");
    }
}
```