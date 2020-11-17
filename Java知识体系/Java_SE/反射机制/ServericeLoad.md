一种设施加载的服务的实现。
服务是公知的接口或类为其中零个，一个或多个服务提供者存在。 服务提供商（或只是提供商）是一类，它实现或小类中所述的公知的接口或类。 一个ServiceLoader是，在应用程序的选择的时间部署在运行时环境中找到并装载服务提供商的对象。 应用程序代码仅指服务，而不是服务提供者，并且被假定为能够在多个服务提供商之间进行区分，以及处理没有服务供应商所在的可能性。
获得服务装载机
一个应用程序通过调用的静态一个获得用于给定服务的服务加载器load的ServiceLoader的方法。 如果应用程序是一个模块，那么它的模块声明必须有一个用途的指令，指定服务; 这有助于找到供应商，并确保他们会可靠地执行。 此外，如果服务不是应用程序模块，模块声明必须有一个要求指令，指定哪个出口服务的模块。
服务加载器可用于通过所述的手段来查找并实例化服务的提供者iterator方法。 ServiceLoader还限定stream方法以获得能够被检查并过滤没有实例他们提供的流。
作为一个例子，假设服务是com.example.CodecFactory ，其限定用于制造编码器和解码器的方法的接口：

     package com.example;
     public interface CodecFactory {
         Encoder getEncoder(String encodingName);
         Decoder getDecoder(String encodingName);
     }

下面的代码获得用于一个服务加载器CodecFactory的服务，然后使用它的迭代器，位于服务提供者以得到实例（由增强-for循环自动创建的）：

     ServiceLoader<CodecFactory> loader = ServiceLoader.load(CodecFactory.class);
     for (CodecFactory factory : loader) {
         Encoder enc = factory.getEncoder("PNG");
         if (enc != null)
             ... use enc to encode a PNG file
             break;
         }

如果此代码驻留在一个模块中，然后以指com.example.CodecFactory接口，模块声明将要求其出口的接口模块。 该模块声明也将指定使用的com.example.CodecFactory ：

     requires com.example.codec.core;
     uses com.example.CodecFactory;

有时，一个应用程序可能希望将其实例化之前检查服务提供商，以确定该服务提供商的一个实例将是有益的。 例如，对于一个服务提供商CodecFactory能够产生一个“PNG”编码器可以与进行注释@PNG 。 下面的代码使用的服务加载的stream的方法的产率实例Provider<CodecFactory>对比如何的迭代器实例收率CodecFactory ：

     ServiceLoader<CodecFactory> loader = ServiceLoader.load(CodecFactory.class);
     Set<CodecFactory> pngFactories = loader
            .stream()                                              // Note a below
            .filter(p -> p.type().isAnnotationPresent(PNG.class))  // Note b
            .map(Provider::get)                                    // Note c
            .collect(Collectors.toSet());

的流Provider<CodecFactory>对象
p.type()产生一个Class<CodecFactory>
get()得到的实例CodecFactory
设计服务
服务是一单一类型的，通常是一个接口或抽象类。 一个具体的类可以使用，但不建议这样做。 该类型可能有任何无障碍。 服务的方法是高度特定领域的，所以这个API规范不能给他们的形式或功能的具体建议。 然而，一般有两个原则：
根据需要使服务提供商能够传达他们的特定领域的性能和质量的落实等因素的服务应该将尽可能多的方法声明。 然后获得服务加载器服务的应用程序可以调用一个服务提供商的每个实例这些方法，以选择应用程序的最佳供应商。
服务应表达其服务提供商是否打算成为服务的直接实现，或者是间接机制，如“代理”或“工厂”。 服务提供商往往是间接的机制时域特定的对象是相对昂贵的实例化; 在这种情况下，服务的设计应使服务提供商，其根据需要创建“真正”实现抽象。 例如， CodecFactory通过其名称服务表示，它的服务供应商工厂进行编解码器，而不是编解码器本身，因为它可能是昂贵或复杂，产生一定的编解码器。
开发服务提供商
服务提供者是一个类型，通常是一个具体的类。 接口或抽象类是允许的，因为它可能声明静态提供商方法，稍后讨论。 该类型必须是公开的，不能是一个内部类。
服务提供商和其支持代码可以一个模块，然后将其部署的应用程序模块路径上或在模块化图像中被开发。 可替代地，服务提供商和其支撑代码可以被封装为一个JAR文件和部署的应用程序类路径上。 开发一个模块中的服务提供商的优势是供应商可以完全封装，以隐藏其实现的所有细节。
其获得用于给定服务的服务加载器的应用是无所谓到服务提供商是否被部署在模块或封装为JAR文件。 应用程序通过服务装载机的迭代器实例化服务提供商，或者通过Provider对象的服务加载的数据流中，而服务提供者的位置的知识。
部署服务提供商为模块
这是一个模块中开发的服务供应商必须指定在提供在模块的声明指令。 该提供指令同时指定服务和服务提供者; 这有助于找到提供者当另一个模块，具有使用指令为服务宗旨，为获得该服务的服务加载器。 强烈建议模块不导出包含服务提供商的包。 有一个模块指定的支持，在提供指令，在另一模块中的服务提供商。
这是一个模块中开发的服务供应商，当它被实例化无法控制，因为这发生在应用程序的遗志，但它确实有过它是如何控制的实例：
如果服务提供商声明一个提供方法，则服务装载机调用该方法来获得所述服务提供商的一个实例。 提供者的方法是名为“供应商”没有正式的参数，这是分配给该服务的接口或类返回类型的公共静态方法。
在这种情况下，服务提供者本身不一定是分配给该服务的接口或类。
如果服务提供商不声明供应商的方法，那么服务提供商直接实例，通过其提供的构造函数。 提供者的构造是一个公共构造没有正式的参数。
在这种情况下，服务提供商必须分配给该服务的接口或类
被部署为服务提供商自动模块的应用模块路径上必须有一个供应商的构造。 有在这种情况下，提供方法的支持。
作为一个例子，假设一个模块指定以下指令：

     provides com.example.CodecFactory with com.example.impl.StandardCodecs;
     provides com.example.CodecFactory with com.example.impl.ExtendedCodecsFactory;

哪里
com.example.CodecFactory是从早期两法服务。
com.example.impl.StandardCodecs是一个公共类，它实现CodecFactory ，有一个公共的无参数的构造函数。
com.example.impl.ExtendedCodecsFactory是没有实现CodecFactory中一个公共类，但它声明了一个公共静态名为“供应商”与返回类型无参数的方法CodecFactory 。
服务加载器将实例StandardCodecs通过其构造，以及将实例ExtendedCodecsFactory通过调用其provider的方法。 要求提供程序构造函数或供应商的方法是公开有助于记录的意图，类（即服务提供商）将被实体进行实例化（即服务加载器），这是类的包外。
在类路径上部署服务提供商
被打包作为类路径的JAR文件服务提供者是通过放置提供者配置文件中的资源目录确定的META-INF/services 。 供应商的配置文件的名称是服务的完全限定二进制名称。 该供应商的配置文件中包含的服务提供商，每行一个完全合格的二进制名称的列表。
例如，假设服务提供商com.example.impl.StandardCodecs被包装在类路径的JAR文件。 该JAR文件将包含一个名为供应商的配置文件：
META-INF/services/com.example.CodecFactory
包含行：
com.example.impl.StandardCodecs # Standard codecs
的提供者配置文件必须以UTF-8编码。 周围的每个服务提供者的名称，以及空行空格，制表符，将被忽略。 注释字符为'#' （ '&#92;u0023'数字符号）; 在每一行的第一个注释字符的所有字符都被忽略。 如果服务提供商类的名字被列不止一次在供应商配置文件，然后重复被忽略。 如果服务提供商类是在超过一个配置文件命名，然后重复被忽略。
了在提供者配置文件提及的服务提供商可以位于同一个JAR文件作为提供者配置文件或在一个不同的JAR文件。 服务提供商必须从最初查询找到供应商的配置文件中的类加载器可见; 这不一定是类加载器，其最终定位该提供者配置文件。
提供商发现的时机
服务提供商正在加载并实例懒洋洋地，也就是需求。 服务加载器维护到目前为止已经加载的提供者缓存。 在每次调用iterator方法返回的Iterator ，首先产率从所有先前迭代中缓存的元素，在实例化命令，然后懒惰地定位并实例化的任何剩余提供商，加入每一个以依次缓存。 类似地，流的方法的每一次调用返回一个Stream ，首先处理所有提供商加载由以前的流操作，在负载顺序，然后懒惰地定位任何剩余的提供者。 缓存是通过清除reload方法。
错误
当使用的服务加载的iterator中， hasNext和next方法将失败ServiceConfigurationError如果发生错误定位，加载或实例化一个服务提供商。 当处理的服务加载的流然后ServiceConfigurationError可以通过一种使服务提供者将位于或加载的任何方法被抛出。
当加载或实例化一个模块中的服务提供商， ServiceConfigurationError可以抛出，原因如下：
服务提供商无法加载。
服务提供商不声明提供商法，要么是不能分配给该服务的接口/类或没有提供构造函数。
服务提供商声明了一个公共静态名为“供应商”这一说法是不能分配给该服务的接口或类返回类型，无参数的方法。
服务提供商的类文件有一个名为“一个以上的公共静态无参数方法provider ”。
服务提供商声明一个提供方法，它通过返回失败null或抛出异常。
服务提供商不声明供应商的方法，其提供的构造抛出一个异常失败。
当读取一个供应商的配置文件，或者加载或实例化的提供者配置文件命名为供应商类，然后ServiceConfigurationError可以抛出，原因如下：
的提供者配置文件的格式违反格式上面指定;
一个IOException而读取所述提供者配置文件时发生;
服务提供商无法加载;
服务提供者是不能分配给该服务的接口或类，或者没有定义提供商构造，或不能被实例化。
安全
服务装载机总是执行在迭代器或流方法调用者的安全上下文，并也可以由创建该服务加载器调用者的安全性上下文的限制。 受信任的系统代码通常应该在调用这个类中的方法，以及它们返回，从特权安全上下文中的迭代的方法。
并发
这个类的实例用于多个并发线程安全使用。
空操作
除非另有说明，传递一个null参数的任何方法在这个类会导致NullPointerException被抛出。
自从：
1.6
类型参数：
<S> - 类型的服务的受本加载器加载的