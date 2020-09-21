[TOC]

## 开启远程连接

### 开放端口6379

```
firewall-cmd --zone=public --list-ports #查看防火墙开放的端口
firewall-cmd --zone=public --add-port=6379/tcp --permanent   # 开放6379端口
firewall-cmd --reload   # 配置立即生效
firewall-cmd --zone=public --list-ports
```

![image-20200723141553131](images/Java%E5%AE%A2%E6%88%B7%E7%AB%AF/image-20200723141553131.png)

Redis默认不支持远程连接，需要手动开启

### 修改redis.conf文件

1. 注释bind 127.0.0.1

2. 开启密码校验 

   ```
   requirepass kujin
   ```

   ![image-20200723140632512](images/Java%E5%AE%A2%E6%88%B7%E7%AB%AF/image-20200723140632512.png)

3. 保存退出，重启redis 

   ```shell
   redis-server redis.conf
   ```

![image-20200723141850375](images/Java%E5%AE%A2%E6%88%B7%E7%AB%AF/image-20200723141850375.png)

## Jedis

maven仓库：https://mvnrepository.com/artifact/redis.clients/jedis

### 1. 添加依赖

```groovy
compile group: 'redis.clients', name: 'jedis', version: '3.3.0'
```

### 2. java代码测试

```java
package com.kujin.springredis;

import redis.clients.jedis.Jedis;

/**
 * 类：在java中使用Redis
 * 编写人：kujin
 * 创建时间：2020/7/23
 * 修改时间：2020/7/23
 */
public class Java_Redis_Text {
    public static void main(String[] args) {
        Jedis jedis=new Jedis("192.168.2.168",6379);//连接redis
        jedis.auth("kujin");//输入密码

        int i=0;//记录操作次数
        try {
            long start = System.currentTimeMillis();//开始时间
            while (true){
                long end = System.currentTimeMillis();//结束时间
                if (end-start>=1000){//时间大于1秒，退出
                    break;
                }
                i++;
                jedis.set("test"+i,i+"");
            }
        }finally {//关闭连接
            jedis.close();
        }
        System.out.println("redis每秒操作 "+ i+ "次");

    }
}

```

![image-20200723143421382](images/Java%E5%AE%A2%E6%88%B7%E7%AB%AF/image-20200723143421382.png)

### 3. 连接池

#### 1. 定义接口约束

```java
public interface CllWithJedis {
    void call(Jedis jedis);
}
```

#### 2. 规范redis连接创建

```java
public class Redis {
    //定义redis连接池
    private JedisPool pool;
    public Redis() {
        //配置连接参数
        GenericObjectPoolConfig config=new GenericObjectPoolConfig();
        config.setMaxIdle(50);//最大空闲数
        config.setMaxTotal(100);//最大连接数
        config.setTestOnBorrow(true);//在空闲时检查有效性
        //配置参数，地址，端口，超时时间，密码
        pool=new JedisPool(config,"192.168.2.168",6379,20000,"kujin");
    }
    public void execute(CllWithJedis cllWithJedis){
        //在try里获取单个连接
        try (Jedis jedis=pool.getResource()){
            cllWithJedis.call(jedis);
        }
    }
}
```

#### 3. 使用redis

```java
public static void main(String[] args) {
        Redis redis=new Redis();
        redis.execute(jedis1 -> {
            System.out.println(jedis1.ping());
        });
    }
```

## Lettuce（简单了解）

Github[官方地址](https://github.com/lettuce-io/lettuce-core)

###  1. 添加依赖

```groovy
compile group: 'io.lettuce', name: 'lettuce-core', version: '6.0.0.M1'
```

### 2. 简单测试案例

```java
public class LettuceTest {
    static RedisClient client = RedisClient.create("redis://kujin@192.168.2.168");//获取redis实例
    public static void main(String[] args) {
        baseUsage();//基本用法
    }

    private static void baseUsage() {
        StatefulRedisConnection<String, String> connection = client.connect();
        RedisStringCommands sync = connection.sync();//同步对象
        sync.set("ku","jin");//设置值
        String ku = (String) sync.get("ku");//获取值
        System.out.println(ku);
    }
}
```

## Jedis和Lettuce比较

1. Jedis在实现过程中是直接连接Redis的，在多个线程之间共享一个Jedis实例，这是线程不安全的，如果在多线程创建下使用需要创建连接池，这样每个jedis都有redis实例
2. Lettuce基于Netty NIO框架构建，所以克服了jedis中线程不安全的问题，Lettuce支持同步，异步，以及响应调用，多个线程可以共享一个实例

## Spring中使用Redis

### 1.添加依赖

```groovy
compile group: 'org.springframework.data', name: 'spring-data-redis', version: '2.3.2.RELEASE'
```

### 2.配置文件

appcationContext.xml

```xml
<!--	Spring配置JedisPoolConfig对象-->
	<bean id="poolConfig" class="redis.clients.jedis.JedisPoolConfig">
		<!--最大空闲数 -->
		<property name="maxIdle" value="50" />
		<!--最大连接数 -->
		<property name="maxTotal" value="100" />
		<!--最大等待时间 -->
		<property name="maxWaitMillis" value="20000" />
	</bean>

<!--spring配置JedisConnectionFactory-->
	<bean id="connectionFactory"
		class="org.springframework.data.redis.connection.jedis.JedisConnectionFactory">
		<property name="hostName" value="192.168.2.168" />
		<property name="port" value="6379" />
		<property name="password" value="kujin"/>
		<property name="poolConfig" ref="poolConfig" />
	</bean>

<!--Spring配置RedisTemplate-->
	<bean id="jdkSerializationRedisSerializer"
		class="org.springframework.data.redis.serializer.JdkSerializationRedisSerializer" />
		
	<bean id="stringRedisSerializer"
		class="org.springframework.data.redis.serializer.StringRedisSerializer" />
		
	<bean id="redisTemplate" class="org.springframework.data.redis.core.RedisTemplate">
		<property name="connectionFactory" ref="connectionFactory" />
		<property name="keySerializer" ref="stringRedisSerializer" />
		<property name="valueSerializer" ref="jdkSerializationRedisSerializer" />
	</bean>
```

### 3.关键代码

pojo

```java
public class Role implements Serializable {
	
	private static final long serialVersionUID = 6977402643848374753L;

	private long id;
	private String roleName;
	private String note;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
```

main.java

```java
private static void testSpring() {
		//spring配置
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		//获取redis
		RedisTemplate redisTemplate = applicationContext.getBean(RedisTemplate.class);
		//角色实体
		Role role = new Role();
		role.setId(1L);
		role.setRoleName("role_name_1");
		role.setNote("note_1");
		//redsi操作
		redisTemplate.opsForValue().set("role_1", role);
		Role role1 = (Role) redisTemplate.opsForValue().get("role_1");

		System.out.println(role1.getRoleName());
	}
```

### 4. 优化

SessionCallback接口对redis连接进行了封装，可以把多个命令放入到同一个Redis连接中执行

```java
private static void testSessionCallback() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		RedisTemplate redisTemplate = applicationContext.getBean(RedisTemplate.class);
		Role role = new Role();
		role.setId(1);
		role.setRoleName("role_name_1");
		role.setNote("role_note_1");
		//SessionCallback接口对redis连接进行了封装，可以把多个命令放入到同一个Redis连接中执行
		SessionCallback callBack = new SessionCallback<Role>() {
			@Override
			public Role execute(RedisOperations ops) throws DataAccessException {
				ops.boundValueOps("role_1").set(role);
				return (Role) ops.boundValueOps("role_1").get();
			}
		};
		Role savedRole = (Role) redisTemplate.execute(callBack);
		System.out.println(savedRole.getId());
	}
```

