# 了解Object

> Java中所有的类都直接或间接地继承了Object, 他会隐式地继承

![image-20201027145850429](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201027150009.png)

## toString

返回该对象的字符串表示。 通常， toString方法返回一个字符串“以文本表示”该对象。 其结果应是一个简明而丰富的表示，这样便于人们阅读。 建议所有子类重写此方法。
所述toString用于类方法Object返回一个由其中的对象是一个实例，该符号字符`的类的名称的字符串@ ”，并且对象的哈希码的无符号的十六进制表示。 换句话说，此方法返回一个字符串等于的值：
       

```java
getClass().getName() + '@' + Integer.toHexString(hashCode())
```

​       

一般地重写tostring

```java
@Override
    public String toString() {
        return getClass().getName()+"{" +
                "name='" + name + '\'' +
                ", salary=" + salary +
                '}';
    }
```

## quals

指示某个其他对象是否“等于”这一项。

该equals方法实现对非空对象引用的一个等价关系：

​	**自反性**：对于任何非空的参考值x ， x.equals(x)应该返回true 。
​	**它是对称的**：对于任何非空引用值x和y ， x.equals(y)应返回true当且仅当y.equals(x)返回true 。
​	**传递性**：对于任何非空引用值x ， y ，和z ，如果x.equals(y)返回true和y.equals(z)返回true ，那么x.equals(z)应该返回true 。
​	**它是一致的**：对于任何非空引用值x和y ，多次调用x.equals(y)始终返回true或始终返回false ，没有设置中使用的信息equals比较上的对象被修改。
​	对于任何**非空引用**值x ， x.equals(null)应该返回false 。

该equals类方法Object实现对象上差别可能性最大的相等关系; 即，对于任何非空引用值x和y ，此方法返回true当且仅当x和y指代相同的对象（ x == y的值为true ）。

- 如果 x 为null Object.equals(x,y) 返回falest  而 x.equals(y) 会报错

请注意，这是**通常需要覆盖hashCode每当这个方法被覆盖的方法**，从而保持对一般合同hashCode方法，其中指出相等的对象必须具有相同的散列码。

### 完整栗子

```java
/**
 * overrider
 * @param otherObject
 * @return
 */
public boolean equals(Object otherObject) {
    // 快速测试以查看对象是否相同
    if (this == otherObject) return true;
    // 如果显式参数为null，则必须返回false
    if (otherObject == null) return false;
    // 检查otherObject是否为Item
    if (getClass() != otherObject.getClass()) return false;
    // 测试实例变量是否具有相同的值
    Item other = (Item) otherObject;
    return Objects.equals(description, other.description)
        && price == other.price;
}

public int hashCode() {
    return Objects.hash(description, price);
}
```

## hashCode

哈希码(hash code) 是一个整数  哈希吗原本应该是杂乱无序的  如果两个数不相等 他们hasecode很可能不相等

例如String 中的hashcode

```java
返回此字符串的哈希码。 要的哈希码String对象被计算为
       s[0]*31^(n-1) + s[1]*31^(n-2) + ... + s[n-1]
```

## clone克隆

创建并返回此对象的副本。 的“副本”的准确含义可能依赖于对象的类。 总的意图是，对于任何对象x中，表述：
       x.clone() != x
将是真实的，该表达式：
       x.clone().getClass() == x.getClass()
将true ，但这些都不是绝对的要求。 虽然这是通常的情况是：
       x.clone().equals(x)
将true ，这不是一个绝对的要求。

按照惯例，返回的对象应该通过调用获得super.clone 。 如果一个类及其所有的超类（除了Object ）遵守这个约定，它会是这样的情况x.clone().getClass() == x.getClass()

百度了解 浅拷贝 和 深拷贝

```java
package chapter.ch04.sec02;

import java.util.ArrayList;

/**
 * 邮箱消息类
 * ArrayList 类实现了Clone方法 产生一个浅拷贝对象
 * 源列表和克隆列表共享元素引用
 */
public final class Message {
    private String sender;//发件人
    private ArrayList<String> recipients;//收件人s
    private String text;//内容


    /**
     * 初始化构造函数
     * @param sender
     * @param text
     */
    public Message(String sender, String text) {
        this.sender = sender;
        this.text = text;
        recipients = new ArrayList<>();
    }

    /**
     * 添加收件人
     * @param recipient
     */
    public void addRecipient(String recipient) { 
        recipients.add(recipient);
    };

    /**
     * 拷贝的完整实现
     * @return
     */
    public Message clone() {
        try {
            Message cloned = (Message) super.clone();
            @SuppressWarnings("unchecked") ArrayList<String> clonedRecipients 
                = (ArrayList<String>) recipients.clone();
            cloned.recipients = clonedRecipients; 
            return cloned;
        } catch (CloneNotSupportedException ex) {
            return null;    //不会发生? 应为Message是Cloneable 和final的 并且Arraylist.clone 没有异常抛出
        }
    }
}
```

```java
package chapter.ch04.sec02;

/**
 * 关于拷贝
 * 如果实现一个类 有三种情况考虑 是否提供clone方法
 *  继承Clone 什么也不做
 *  实现Cloneable 接口 
 */
public class Employee implements  Cloneable{
    private String name;
    private double salary;
        
    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }

    public void raiseSalary(double byPercent) {
        double raise = salary * byPercent / 100;
        salary += raise;    
    }
    
    public final String getName() {
        return name;
    }
    
    public double getSalary() {
        return salary;
    }
    
    public String toString() {
        return getClass().getName() + "[name=" + name
            + ",salary=" + salary + "]";
    }

    /**
     * 深拷贝
     * @return
     * @throws CloneNotSupportedException
     */
    public Employee clone() throws CloneNotSupportedException {
        return (Employee) super.clone();
    }
}
```

