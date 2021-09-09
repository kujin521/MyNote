# Agile SDK Client文档翻译记录

## 跨职能协同业务流程

编码申请流程

文档审批流程

工程变更流程（通知、实施）

工艺评审

设计审批流程

设计验证流程

图纸和数据发放流程

新产品开发项目立项

材料消耗清单申请流程

委托开发/转产申请流程

跨部门项目Gate审批

## Agile工作流

ECR: Engineering Chg Request 工程变更请求

ECO: Engineering Chg Order 工程变更令

MCO: Mfg Chg Order 制造变更订单

DEV: Deviation 偏差

SS: Stop Ship 停船

SCO: Site Change 站点变更





# 1. 启动敏捷Api程序

**安装**

■敏捷 API 库 ( AgileAPI.jar )

■Java 进程扩展 API 库 ( pxapi.jar )

■Apache Axis 库 ( axis.jar )



1. 获取服务端示例
2. 为Agile PLM 创建会话

示例2-1创建会话并登录

```java
public static final String USERNAME = "fjones";
public static final String PASSWORD = "agilepwd";
public static final String URL = "http://yourcompany.com:7001/Agile";
public static IAgileSession session = null;
public static AgileSessionFactory factory;

factory = AgileSessionFactory.getInstance(URL);
HashMap params = new HashMap();
params.put(AgileSessionFactory.USERNAME, USERNAME);
params.put(AgileSessionFactory.PASSWORD, PASSWORD);
session = factory.createSession(params);
```

您的 Oracle Agile PLM 协议决定了最大并发数

每个用户帐户打开与 Agile Application Server 的会话。如果超过这个

最大数量，服务器阻止您登录。因此，重要的是使用IAgileSession.close()方法正确注销并关闭会话

当您的程序完成运行时。如果敏捷 PLM 系统托管在 Oracle 上应用程序服务器，每个线程只能有一个会话。

# 2 Agile API 入门

### Agile API类和接口的类型

Agile API 在 AgileAPI.jar 库中包含几个不同的类和接口。这些文件根据它们支持的功能进一步分为以下几组：

■**聚合接口**-这些接口聚集适用功能接口用于一个特定对象的类型。为例如，所述的iItem界面延伸的IDataObject，IRevisioned，IManufacturingSiteSelectable，IAttachmentContainer，IHistoryManager ，和IReferenced 。大多数 SDK功能都属于这些接口。Agile API 的底层实现类（未公开）实现了这些接口。     

■**功能单元接口**——这些接口包含扩展到其他接口的功能单元。对于例如，IAttachmentContainer提供一种方便的方式来访问附件表的任何物体。该组中的其他接口（如IChange和IItem）扩展了IAttachmentContainer接口。IRoutable是另一个类的是提供作为一个功能单元; 它提供的方法对任何对象是你可以路由到另一个敏捷PLM用户; IChange，IPackage ，并ITransferOrder所有扩展IRoutable 。     

■**元数据接口**——这组类定义元数据（和     

元元数据）用于敏捷应用服务器。元数据只是描述其他数据的数据。该元数据接口包括类，例如如IAgileClass，索引节点，IRoutableDesc，ITableDesc ，和IWorkflow 。

■**工厂****类**- AgileSessionFactory是一个工厂类是被使用来创建一个会话（IAgileSession ）和访问事务管理。IAgileSession是也是一个工厂对象允许您实例化其他对象。许多敏捷API对象，在反过来，是工厂对象为表或其他引用的对象。反过来，表是行的工厂。 

**异常类**- 只有一个异常类，APIException 。     

■**常量**- 这些类包含属性、表、类等的ID。只含常量所有的类具有类名称的结尾为“常量”，举例来说，ChangeConstants，ItemConstants，UserConstants ，并因此上。  



## 2-1 加载和创建敏捷PLM对象

| IChange            | IManufacturer                      | IRequestForQuote             |
| ------------------ | ---------------------------------- | ---------------------------- |
| ICommodity 商品    | IManufacturerPart 制造商部分       | IServiceRequest 服务请求     |
| ICustomer 客户     | IManufacturingSite 制造现场        | ISpecification 规格          |
| IDeclaration 声明  | IPackage 包                        | ISubstance 物质              |
| IDesign 设计       | IPrice 价格                        | ISupplier 供应商             |
| IDiscussion 讨论   | IProgram 程序                      | ISupplierResponse 供应商响应 |
| IFileFolder 文件夹 | IProject 项目                      | ITransferOrder 转单          |
| IFolder 文件       | IQualityChangeRequest 质量变更请求 | IUser 用户                   |
| IItem 项目         | IQuery 查询                        | IUserGroup 用户组            |

> 首先要获取Session，使用IAgileSession.getObject()加载Agile PLM 对象并使用createObject()创建对象

### 加载对象

IAgileObject getObject(int objectType, Object params)     

**注意：**如果不被指定的用户，对象将根据总是加载它们的基类，其是衍生自的子类或类。当对象的派生基类正确时，对象也将正确加载。但是，当无效类的派生基类与对象的派生基类相同时，即使为该对象传递了无效子类，SDK 也会加载该对象。



**指定对象类型**

该2的getObject （）方法使你到指定的的objectType参数使用这些值：

■一个IAgileClass实例是代表一个的的敏捷PLM类。     

■甲类ID （对于例如，ItemConstants.CLASS_PART对应于该部件类）。预定义类的ID都可以在中各种*常量文件提供敏捷API。     

■一种OBJECT_TYPE恒定，例如如IItem.OBJECT_TYPE或IChange.OBJECT_TYPE     

■类名（例如Part ）。但是，Oracle不建议使用类名来实例化对象，因为在类名可以被修改，并不能保证是唯一的。     



**注意：**当您使用getObject () 方法加载对象时，您可以指定抽象或具体的 Agile PLM 类。有关详细信息，请参阅[“具体类和抽象类” （第 22-9 页）。](https://translate.googleusercontent.com/translate_f#_bookmark566)



**指定对象参数**

该PARAMS参数为所述的getObject （）方法可以是一个地图或字符串。如果您指定PARAMS参数Map对象，它必须包含属性（或者属性的ID或IAttribute对象）和它们对应的值。该地图必须包含所有的识别相关的信息。例如，当您加载IManufacturerPart 时，必须同时指定制造商名称和制造商零件编号。

如果您为 params 参数指定的Map对象包含标识信息以外的其他属性，则这些属性将被忽略。服务器仅使用标识信息来检索对象。有关用于唯一标识 Agile PLM 对象的完整属性列表，请参阅*SDK 开发人员指南 - 开发 PLM 扩展中的*“标识 Agile PLM 类的属性” 。

此示例显示如何使用指定属性 ( ItemConstants.ATT_TITLE_BLOCK_NUMBER ) 和值的 Map 参数加载部件 1000-02 。



**示例 2–5 使用字符串加载零件**





**示例 2–6 使用地图加载零件**

Map params = new HashMap(); params.put(ItemConstants.ATT_TITLE_BLOCK_NUMBER, "1000-02");       

IItem item = (IItem)m_session.getObject(ItemConstants.CLASS_PART, params);;



**加载不同类型的对象**

以下示例加载不同类型的 Agile PLM 对象。



**示例 2–7 加载 Agile PLM 项目、制造商和制造商零件对象**





**示例 2–8 加载 Agile PLM 客户和声明对象**





**示例 2–9 加载 Agile PLM Discussion、File Folder 和 Folder 对象**





**示例 2–10 加载 Agile PLM 包、价格、程序、PSR 和 QCR 对象**





**示例 2–11 加载 Agile PLM 变更、商品和供应商对象**

//加载更改

IChange change = (IChange)m_session.getObject(IChange.OBJECT_TYPE, "C00002"); System.out.println("更改：" + change.getName());

//加载一个商品ICommodity comm =

(ICommodity)m_session.getObject(ICommodity.OBJECT_TYPE, "Res"); System.out.println("商品：" + comm.getName());



//加载一个供应商网上供应商的供应商=

(ISupplier)m_session.getObject(ISupplier.OBJECT_TYPE, "SUP20013"); System.out.println("供应商：" + supply.getName());



IProgram接口代表所有Project对象，程序、阶段、任务和阀门



# 3 创建和加载查询

## 关于查询

> IQuery是一个定义如何搜索AgilePLM数据的对象。
>
> 它定义了一个类似于您可以在AgileWeb客户端中使用的搜索的搜索。
>
> 搜索可以有多个搜索条件（如AgileWeb客户端中的高级搜索），也可以是仅指定一个标准的简单搜索。

## 创建一个查询

> 若要创建和执行查询，必须首先创建IQuery对象。
>
> 与其他AgileAPI对象类似，您可以使用IAgileSession.createObject()方法创建该对象。
>
> 在其最简单的形式中，使用创建对象()方法传递以创建查询的参数是IQuery对象类型和搜索中使用的查询类

```java
/**
 * todo 创建查询
 *  您使用createObject()方法指定的查询类还包括来自其所有子类的对象。
 *  例如，如果您在 Item 类中搜索对象，结果将包括部件和文档。
 *  如果在 Change 类中搜索对象，结果将包括所有 Change 子类（Deviation、ECO、ECR、MCO、PCO、SCO 和 Stop Ship）中的对象。
 *  如果只想搜索特定的子类，则应明确指定该类。
 */
@Test
public void t3_1(){
    try {
        //创建查询对象
        IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE,ItemConstants.CLASS_ITEM_BASE_CLASS);
        //是否区分大小写
        query.setCaseSensitive(false);
        //设置查询标准
        query.setCriteria("[描述] starts with 's'");
        //执行查询
        ITable results = query.execute();
        SoutTable(results);
    } catch (APIException e) {
        e.printStackTrace();
    }
}
```

```java
/**
 * todo 指定名为 文件夹 的查询子类
 * 高级搜索 打印全部项目
 */
@Test
public void t3_2(){
    try {
        IAdmin admin = session.getAdminInstance();
        IAgileClass cls = admin.getAgileClass("项目");
        IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE, cls);
        ITable execute = query.execute();
        SoutTable(execute);
    } catch (APIException e) {
        e.printStackTrace();
    }
}
```

## 将查询结果保存到文件夹中

```java
/**
 *  todo 示例 3–3 命名查询并将其添加到文件夹
 * @throws APIException
 */
@Test
public void t3_3() throws APIException {
    //创建 高级搜索 查询
    IAdmin admin = session.getAdminInstance();
    //查询类别
    IAgileClass cls = admin.getAgileClass("项目");
    IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE, cls);
    //设置区分大小写
    query.setCaseSensitive(false);
    //设置查询语句
    query.setCriteria("[名称] starts with 'P'");
    //查询结果命名
    query.setName("编号以 P 开头的项目");
    //获取存在的文件夹
    IFolder folder = (IFolder)session.getObject(IFolder.OBJECT_TYPE,
                    "/个人文件夹");
    //将查询放到文件夹下
    folder.addChild(query);
}
```

```java
/**
 *  todo 示例 3–4 使用 IQuery.saveAs() 将查询保存到文件夹
 *  所有项目
 * @throws APIException
 */
@Test
public void t3_4() throws APIException {
    //创建 高级搜索 查询
    IAdmin admin = session.getAdminInstance();
    IAgileClass cls = admin.getAgileClass("项目");
    IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE, cls);
    //设置区分大小写
    query.setCaseSensitive(false);
    //设置查询语句
    //query.setCriteria("[名称] starts with 'P'");
    //
    IFolder folder = (IFolder)session.getObject(IFolder.OBJECT_TYPE,
            "/个人文件夹");
    query.saveAs("查询所有项目",folder);
}
```

## 查询结果排序

为了提高查询性能，SDK提供了以下方法，以返回未按默认顺序排序的结果。但是，如果查询条件以条件开始，那么结果总是对该属性进行排序，并且在执行中传递为true（布尔）不会跳过排序

```java
/**
 *  todo 示例 3–5 在查询结果中跳过排序
 *  RowId = 1 DataObjectId = class: 5 subclass:5 id:1020309 version:-456
 * Cells = peptide mapping(RP-HPLC), null, 未开始, , Admin 系统管理员, 生物制品子项目, 默认活动, 任务
 * @throws APIException
 */
@Test
public void t3_5() throws APIException {
    //创建 高级搜索 查询
    IAdmin admin = session.getAdminInstance();
    IAgileClass cls = admin.getAgileClass("项目");
    IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE, cls);
    //设置区分大小写
    query.setCaseSensitive(false);
    //设置查询语句
    query.setCriteria("[名称] starts with 'P'");
    // 布尔值设置为 true 以跳过排序
    ITable results = query.execute(true);
    SoutTable(results);
}
```

## 创建查询时指定查询属性

> 在创建查询时，不能只传递查询类，而是可以使用更高级形式的创建对象()方法，并传递包含一个或多个属性值的Map对象，而不是只传递查询类。
>
> 查询常量类包含多个查询属性的常量，您可以在创建查询时设置这些常量。这些都是AgilePLM数据库中不存在的虚拟属性，但您可以使用它们在运行时定义查询。  

| **ATT_CRITERIA_CLASS** | **查询类**                     |
| ---------------------- | ------------------------------ |
| ATT_CRITERIA_PARAM     | 参数化搜索条件的搜索条件参数值 |
| ATT_CRITERIA_STRING    | 搜索条件字符串                 |
| ATT_PARENT_FOLDER      | 查询所在的父文件夹             |
| ATT_QUERY_NAME         | 查询名称                       |

以下示例说明了如何在创建查询时设置查询类、搜索条件、父文件夹和查询名称。

```java
/**
 *  todo 示例 3–6 在创建查询时指定查询属性
 *  以下示例说明了如何在创建查询时设置查询类、搜索条件、父文件夹和查询名称
 * @throws APIException
 */
@Test
public void t3_6() throws APIException {
    //查询条件
    String condition = "[标题块.编号] starts with 'P'";
    //文件夹对象
    IFolder parent = (IFolder)session.getObject(IFolder.OBJECT_TYPE, "/个人文件夹/测试");
    //定义属性
    HashMap map = new HashMap();
    //查询常量-查询类  项目常量-类
    map.put(QueryConstants.ATT_CRITERIA_CLASS,
            ItemConstants.CLASS_DOCUMENTS_CLASS);
    //搜索条件字符串
    map.put(QueryConstants.ATT_CRITERIA_STRING, condition);
    //把查询放到文件夹下
    map.put(QueryConstants.ATT_PARENT_FOLDER, parent);
    //查询名称
    map.put(QueryConstants.ATT_QUERY_NAME, "测试-类文件类");

    IQuery query = (IQuery)session.createObject(IQuery.OBJECT_TYPE, map);
    ITable results = query.execute();

    //遍历table 表
    SoutTable(results);

}
```

## 查询语句关键字

| and      | does      | less  | or     | to    |
| -------- | --------- | ----- | ------ | ----- |
| asc      | equal     | like  | order  | union |
| between  | from      | minus | phrase | where |
| by       | greater   | none  | select | with  |
| contain  | in        | not   | start  | word  |
| contains | intersect | null  | starts | words |
| desc     | is        | of    | than   | than  |

> 查询语言关键字未本地化。无论语言环境如何，您都必须使用英语关键字。您可以使用小写或大写的关键字。除了关键字之外，您还可以使用 Agile PLM 变量，例如$USER （对于当前用户）和 敏捷 API 查询中的$TODAY （今天的日期）。

注：“in”运算符不支持（集）查询条件中的多列表。

## 指定搜索属性

| **属性参考**       | **例子**      |
| ------------------ | ------------- |
| 属性 ID 号         | [ 1001]       |
| 完全限定的属性名称 | [标题块.编号] |
| 短属性名           | [数字]        |

> **注意：**由于属性名称可以修改，Oracle 建议通过 ID 号或常量来引用属性。但是，本章中的许多示例都按名称引用了属性，只是为了使它们更具可读性。如果您选择按名称引用属性，请使用完全限定的属性名称而不是短名称。短属性名称不能保证是唯一的，因此可能会导致您的查询失败或产生意外结果。

> 属性名称，无论使用长格式还是短格式，都不区分大小写。例如，[Title Block.Number]和[TITLE BLOCK.NUMBER]都是允许的。**属性名称也已本地化**。Agile PLM 属性的名称因 Agile Application Server的区域设置而异。如果您正在创建将在不同语言环境的服务器上使用的查询，您应该通过 ID 号（或等效常量）而不是名称来引用属性。
>













## 将SQL语法用于搜索条件

> 除了标准查询语言之外，Agile API 还支持类似 SQL 的搜索条件语法。如果您熟悉如何编写 SQL 语句，您可能会发现这种扩展查询语言更易于使用、更灵活且更强大。它将查询结果属性的规范、查询类、搜索条件和排序列组合在一个操作中。







# 4 使用表格

> 要处理 Agile PLM 表中的数据，请执行以下基本步骤：
>
> ​	1.创建或获取一个对象（例如，一个项目或一个变更单）。
>
> ​	2.检索表（例如，BOM 表）。
>
> ​	3.遍历表行以检索行。
>
> ​	4.获取或设置所选行的一个或多个属性值。ITable ，喜欢的iFolder ，
>
> 扩展java.util.Collection中，并支持所有方法由那个超级接口提供。这意味着您可以使用ITable对象就像使用任何 Java 集合一样。









# 5 工作与数据单元格

## 关于数据单元 

> 一个ICELL对象是一个数据字段的一个敏捷PLM对象是您已经加载或者在你的程序中创建。一个单元格可以对应于 Agile Web Client 中选项卡上的一个字段，也可以对应于表中的单个单元格。所述ICELL目的在于描述一个单元的当前状态的几个特性。您的敏捷 API 程序执行的大多数数据操作都将涉及更改单元格的值或属性。

## 数据类型  

与 getValue() 和 setValue() 方法关联的对象类型取决于单元格的数据类型。下表列出了 getValue() 和 setValue() 方法的单元格值的对象类型。

| **数据类型常量** | **与 getValue 和 setValue 关联的对象类型** |
| ---------------- | ------------------------------------------ |
| TYPE_DATE        | 日期                                       |
| TYPE_DOUBLE      | 双倍的                                     |
| TYPE_INTEGER     | 整数                                       |
| TYPE_MONEY       | 货币格式                                   |
| TYPE_MULTILIST   | 敏捷列表                                   |
| TYPE_OBJECT      | 目的                                       |
| TYPE_SINGLELIST  | 敏捷列表                                   |
| TYPE_STRING      | 细绳                                       |

## 检查单元格是否为只读单元格 



## 获取价值



## 设置值 



## 获取和设置列表值  



## 使用参考指示符单元格 



# 13 工作与附件和文件夹对象

## 关于附件和文件夹



## 工作用的文件夹

## 工作带附件表的的对象

## 签出文件夹

## 取消文件夹签出

## 将文件和URL添加到附件表













