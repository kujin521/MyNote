## 概括

> A:DateFormat类的概述
> 			* DateFormat 是日期/时间格式化子类的抽象类，它以与语言无关的方式格式化并解析日期或时间。是抽象类，所以使用其子类SimpleDateFormat
> 		* B:SimpleDateFormat构造方法
> 			* public SimpleDateFormat()
> 			* public SimpleDateFormat(String pattern)
> 		* C:成员方法
> 			* public final String format(Date date)
> 			* public Date parse(String source)

## 将时间字符串转换成日期对象

```java
//将时间字符串转换成日期对象
		String str = "2000年08月08日 08:08:08";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		Date d = sdf.parse(str);						//将时间字符串转换成日期对象
		System.out.println(d);
```

## 将日期对象转换为字符串

```java
Date d = new Date();							//获取当前时间对象
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//创建日期格式化类对象
		System.out.println(sdf.format(d));				//将日期对象转换为字符串
```

## 获取当前时间对象

```java
Date d = new Date();							//获取当前时间对象
		SimpleDateFormat sdf = new SimpleDateFormat();	//创建日期格式化类对象
		System.out.println(sdf.format(d));	 			//88-6-6 下午9:31
```

## 创建对象

```java
//DateFormat df = new DateFormat();				//DateFormat是抽象类,不允许实例化
		//DateFormat df1 = new SimpleDateFormat();
		DateFormat df1 = DateFormat.getDateInstance();	//相当于父类引用指向子类对象,右边的方法返回一个子类对象 
```

