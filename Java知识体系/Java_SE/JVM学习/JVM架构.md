# JVM架构讲解

YouTube 

<iframe width="1131" height="636" src="https://www.youtube.com/embed/QHIWkwxs0AI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

JVM体系结构的3个主要组成部分，
类加载器，运行时数据区和执行引擎。

类加载器是JVM体系结构中的第一个主要组件，具有3个阶段的加载，链接和初始化。首先，让我们看一下类加载器组件的加载阶段。在加载阶段，我们有3种类型的类加载器。

类装载器有3种类型。引导类加载器，扩展类加载器和应用程序类加载器。 Bootstrap类加载器是负责从Rt点jar（rt.jar）（也称为运行时jar）加载类文件的加载器。扩展类加载器是负责从jre lib ext（jre / lib / ext）文件夹加载其他类文件的加载器。例如，如果我们正在研究与队列交互的程序，例如IBM mq，则可能需要特定于mq的jar才能连接到队列。或者，如果我们正在努力连接到oracle数据库，则需要ojdbc点jar。在这种情况下，我们将这些第三方jar文件添加到扩展文件夹中。应用程序类加载器是从特定于应用程序的jar加载类文件的加载器。这只是您创建的应用程序。编译完Java程序后，JVM将创建类文件。应用程序类加载器将这些类文件加载到内存区域。

JVM体系结构中的第二个主要组件是运行时数据区域。就像汽车需要道路，火车需要铁路一样，JVM也需要存储区域来存储类文件并执行它们。
有5种类型的存储数据区。它们是方法区域，堆内存，堆栈内存，PC寄存器和本机方法堆栈

方法区域-所有类别级别的数据都存储在该存储区域中。例如，类级别的静态变量存储在此存储区中。

堆内存–所有对象和实例变量都存储在此内存区域中。

堆栈内存–包含三部分内存区域。
 局部变量–存储区域，该区域存储方法中使用的所有局部变量
 操作数堆栈–包含方法中使用的所有操作数。
 帧数据–包含任何捕获块信息，以防方法中发生任何异常。

PC寄存器–该存储区保存当前执行指令

本机方法堆栈–存放本机方法信息的内存区域

JVM体系结构中的第三个主要组件是执行引擎。这是将字节码转换为机器代码并执行指令的实际引擎。它包含解释器，JIT编译器，垃圾收集器和Java Native方法接口。

解释器–解释器是一种读取类文件或字节码并逐一执行的解释器。解释器的问题在于，当一个方法被多次调用时，它将一次又一次地解释字节代码的那些行。

JIT编译器– JIT编译器有助于解决解释器的问题。当发生重复的方法调用时，JIT编译器会将字节码编译为本机代码。此本地代码将直接用于重复的方法调用。 JIT编译器包含一些组件来实现此功能
 中间代码生成器–生成中间代码
 代码优化器–优化中间代码以获得更好的性能
 目标代码生成器–将中间代码转换为本机代码
 Profiler –它负责查找热点，这些方法被重复调用。
垃圾收集器–垃圾收集器负责销毁不再使用的对象。
Java本机方法接口–它负责与本机库进行交互，并使其可用于JVM执行引擎。
在此视频中，我们看到JVM体系结构具有3个主要组件，即类加载器，运行时数据区域和执行引擎。
类加载器又具有3个子系统，分别是加载阶段，链接阶段和初始化阶段。
第二个主要组件是运行时数据区，它具有5个存储区，即方法区，堆存储区，堆栈存储区，PC寄存器和JNI。
第三个主要组件是执行引擎。它包含一些组件，例如解释器，JIT编译器，JNI和垃圾收集器。
在下一个视频中，我们将介绍“类结构和组件”

# 英文原版

This video explains about the internals of the JVM architecture. In this video, 

I am going to explain about the 3 major components of JVM architecture,

 Class Loader, runtime data area, and execution engine. 

class loader is the first main component in JVM architecture, which has 3 phases loading, linking, and initialization.

 First let’s look at the loading phase of class loader component. 

 In the loading phase, we have 3 types of class loaders. 

The class loaders are of 3 types.  bootstrap class loader, extension class loader, and application class loader. 

  Bootstrap class loader is the one that is responsible for loading the class files from Rt dot jar(rt.jar) also called as runtime jar. 

Extension class loader is the one that is responsible for loading the additional class files from jre lib ext (jre/lib/ext) folder. 

 For example, if we are working on programs that interact with queues like IBM mq,

 we may need mq specific jars to be able to connect to the queue. 

 Or if we are working on connecting to oracle databases, we need ojdbc dot jar. 

 in these scenario, we add these third-party jar files to the extension folder.  Application class loader is the one that loads the class files from the application specific jar.  This is nothing but the application that you created.  Once your java program is compiled, the JVM creates class files.  The Application class loader loads these class files to the memory area. Second main component in JVM architecture is the run time data area.  Just like how a car needs a road, or how a train needs a railway track to run, similarly JVM needs memory area to store the class files and execute them.   There are 5 types of memory data area.  They are method area, Heap memory, Stack memory, PC Registers, and Native method stacks Method area-  all the class level data are stored in this memory area.  For example, class level static variables are stored in this memory area. Heap memory – all the objects and instance variables are stored in this memory area. Stack memory – this contains three sections of memory areas. Local variable – memory area that stores all the local variables that is used within a method Operand stack – contains all the operands that are used within a method. Frame data – this contains any catch block information, in case any exception occurs within method. PC registers – this memory area holds the current executing instructions Native method stacks – memory area which holds the native method information The 3rd main component in JVM architecture is the execution engine.  This is the actual engine that converts the bytecode to machine code and executes the instructions.  This contains Interpreter, JIT compiler, Garbage collector, and Java Native method interface.   Interpreter – Interpreter is the one that reads the class files or bytecode and executes it one by one.  The problem with the interpreter is that, when a method is called multiple times, it interprets those lines of bytecode again and again. JIT compiler – JIT compiler helps in overcoming the problem of the interpreter.  When repeated method calls occur, JIT compiler compiles the bytecode to native code.  This native code will be used directly for repeated method calls.  JIT compiler contains few components to achieve this feature Intermediate code generator – generates intermediate code Code optimizer – optimizes the intermediate code for better performance Target code generator – converts intermediate code to native machine code Profiler – it is responsible for finding the hotspots, methods which are called repeatedly. Garbage collector – Garbage collector is responsible for destroying the objects that are no longer used. Java native method interface – It is responsible for interacting with native libraries and makes it available for the JVM execution engine. In this video, we saw that the JVM architecture has 3 main components namely  class loader, run time data area, and execution engine.   Class loader in turn has 3 subsystems, which are loading phase, linking phase, and initialization phase.   Second main component is the Runtime data area, which has 5 memory areas namely method area, heap memory, stack memory, PC registers and JNI.   The 3rd main component is the execution engine.  This contains some components like interpreter, JIT compiler, JNI, and Garbage collector. In the next video, we will look at the “Class structure and components”