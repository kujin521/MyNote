## 枚举

```java
package chapter.ch04.sec03;

/**
 * 枚举 栗子
 * 对于枚举类型的值 只需要==比较即可
 */
public enum Size {
    SMALL("S"), MEDIUM("M"), LARGE("L"), EXTRA_LARGE("XL");

    private String abbreviation;//缩写

    /**
     * 必须是私有的构造函数 可以省略不写,只被执行一次
     * @param abbreviation
     */
    Size(String abbreviation) {
        this.abbreviation = abbreviation;
    }

    /**
     * 方法
     * @return
     */
    public String getAbbreviation() { return abbreviation; }
}
```

```java
package chapter.ch04.sec03;

public class EnumDemo {
    public static void main(String[] args) {
        Size notMySize = Size.valueOf("SMALL");
        System.out.println(notMySize);
        
        for (Size s : Size.values()) { System.out.println(s); }
        
        System.out.println(Size.MEDIUM.ordinal());
    }
}
```

计算器栗子

```java
package chapter.ch04.sec03;

/**
 * 这里实现一个计算器操作的枚举
 */
public enum Operation {
    ADD("+") {
        public int eval(int arg1, int arg2) { return arg1 + arg2; }
    },
    SUBTRACT("-") {
        public int eval(int arg1, int arg2) { return arg1 - arg2; }
    },
    MULTIPLY("*") {
        public int eval(int arg1, int arg2) { return arg1 * arg2; }
    },
    DIVIDE("/") {
        public int eval(int arg1, int arg2) { return arg1 / arg2; }
    };

    private String symbol;
    Operation(String symbol) { this.symbol = symbol; }
    public String getSymbol() { return symbol; }
    
    public abstract int eval(int arg1, int arg2);
}
```

```java
package chapter.ch04.sec03;

import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("第一个操作数: ");
        int a = in.nextInt();
        System.out.print("操作符: ");
        String opSymbol = in.next();
        System.out.print("第二操作数: ");
        int b = in.nextInt();
        /**
         * 循环遍历操作符
         */
        for (Operation op : Operation.values()) {
            //如果操作符存在
            if (op.getSymbol().equals(opSymbol)) {
                int result = op.eval(a, b);//执行运算
                System.out.println(result);
            } 
        }
    }
}
```

利用switch枚举

```java
package chapter.ch04.sec03;

import java.util.Scanner;

/**
 * switch枚举对象
 * enum Opration {ADD,SUBTRACT,MULTIPLY,DIVIDE}
 * public static int eval(Opration op,int arg1,int agr2){
 *     int result=0;
 *     switch(op){
 *         case ADD:result=arg1+arg2;break;
 *         case SUBTRACT:result=arg1-arg2;break;
 *         case MULTIPLY:result=arg1*arg2;break;
 *         case DIVIDE:result=arg1/arg2;break;
 *     }
 *     return result;
 * }
 */
public class Calculator2 {

    public static int eval(Operation op, int arg1, int arg2) {
        int result = 0;
        switch (op) {
            case ADD: result = arg1 + arg2; break;
            case SUBTRACT: result = arg1 - arg2; break;
            case MULTIPLY: result = arg1 * arg2; break;
            case DIVIDE: result = arg1 / arg2; break;
        }
        return result;
    }
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("First operand: ");
        int a = in.nextInt();
        System.out.print("Operator: ");
        String opSymbol = in.next();
        System.out.print("Second operand: ");
        int b = in.nextInt();
        for (Operation op : Operation.values()) {
            if (op.getSymbol().equals(opSymbol)) {
                System.out.println(eval(op, a, b));
            } 
        }
    }
}
```

