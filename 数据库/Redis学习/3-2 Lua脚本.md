# Lua脚本

> 在Redis的2.6以上版本中，可以使用Lua语言操作Redis
>
> Redis语言具有原子性，操作过程不会中断，有助于Redis对并发操作数据的一致性

## 1.Redis支持两种方法运行脚本

1. 直接输入Lua语言程序代码
2. 将Lua语言编写成文件

> Redis支持缓存脚本，它会使用SHA-1算法对脚本进行签名，然后通过把SHA-1标识返回回来，通过标识运行

**命令格式**

```shell
eval Lua-script key-num [key1 key2 ...][value1 value2 ...]
```

- eval 代表Lua语言命令
- Lua-script 代表Lua语言脚本
- key-num 代表有多少的key ，Redis中的key是从1开始的，如果key没有参数 那么写0
- [key1 key2 …]作为参数传递给Lua语言 需要和key-num对应起来
- [value1 value2 …]参数传递给Lua语言

## 2.举个栗子

这个脚本只是返回一个字符串，不需要任何参数

```shell
eval "return 'hello Lua'" 0
```

![image-20200725105545715](images/3-2%20Lua%E8%84%9A%E6%9C%AC/image-20200725105545715.png)

设置一个键值对，可以在Lua语言中采用redis.call(command,key[parm1,parm2 …])

- command是命令 set get del 等
- Key是被操作的键
- parm1，parm2 代表key的参数

```shell
eval "redis.call('set',KEYS[1],ARGV[1])" 1 lua-key lua-value
```

![image-20200725110256564](images/3-2%20Lua%E8%84%9A%E6%9C%AC/image-20200725110256564.png)

> 脚本中的KEY[1]代表读取传递给Lua脚本的第一个key参数，
>
> 而ARGV[1]代表第一个非key参数。

## 3.使用加密算法

**有时候需要多次执行同样一段代码脚本，这时候可以使用Redis缓存脚本的功能，在Redis中脚本会通过SHA-1签名算法加密脚本，然后返回一个标识字符串**

**通过这个字符串执行加密脚本，好处是如果脚本很长，客户端传输需要很长时间，使用标识符，则需要传递32位字符即可，从而提高传输效率，提高性能**

```shell
script load script
```

```
evalsha shastring keynum [key1 key2 ..] [parm1 parm2 ...]
```

### 1.举个栗子

```shell
script load "redis.call('set',KEYS[1],ARGV[1])"
evalsha 7cfb4342127e7ab3d63ac05e0d3615fd50b45b06 1 sha-key val
get sha-key
```

![image-20200725113303421](images/3-2%20Lua%E8%84%9A%E6%9C%AC/image-20200725113303421.png)

## 4.java代码使用Lua脚本

```java
		//执行简单的脚本
        String helloJava = (String) jedis.eval("return 'hello java'");
        System.out.println(helloJava);
        
        //执行带参数的脚本
        jedis.eval("redis.call('set',KEYS[1],ARGV[1])",1,"lua-key","lua-value");
        String luaKey = jedis.get("lua-key");
        System.out.println(luaKey);
        
        //缓存脚本，返回sha1签名标识
        String sha1 = jedis.scriptLoad("redis.call('set',KEYS[1],ARGV[1])");
        //通过标识执行脚本
        jedis.evalsha(sha1,1,new String[]{"sha-key","sha-val"});
        //获取执行脚本后的数据
        String shaVal = jedis.get("sha-key");
        System.out.println(shaVal);
```

## 5.使用RedisScript接口对象通过Lua脚本操作对象

```java
/**
     * 使用RedisScript接口对象通过Lua脚本操作对象
     */
    @Test
    public void redisScript_Lua(){
        //1.定义默认脚本封装类
        DefaultRedisScript<Role> redisScript = new DefaultRedisScript<>();
        //2. 设置脚本
        redisScript.setScriptText("redis.call('set',KEYS[1],ARGV[1]) return redis.call('get',KEYS[1])");
        //3. 定义操作key的列表
        ArrayList<String> keyList = new ArrayList<>();
        keyList.add("role1");
        //4. 需要序列化保存和读取的对象
        Role role = new Role();
        role.setId(1L);
        role.setRoleName("role_name_1");
        role.setNote("note_1");
        //5. 获取标识字符串
        String sha1 = redisScript.getSha1();
        System.out.println(sha1);
        //6. 设置返回结果类型，如果没有这句话，返回结果为空
        redisScript.setResultType(Role.class);
        //7. 定义序列化器
        JdkSerializationRedisSerializer serializer = new JdkSerializationRedisSerializer();
        //8. 执行脚本
        RedisTemplate jedisTemlate = Utils.getJedisTemlate();
        //第一个是redisScript接口对象，第二个是参数序列化器
        //第三个是结果序列化器，第四个是Redis的key列表，最后是参数列表
        Role obj = (Role) jedisTemlate.execute(redisScript, serializer, serializer, keyList, role);
        System.out.println(obj.toString());
    }
```

## 6.执行Lua文件

### 6.1 在服务端编写Lua文件代码

![image-20200727174113640](images/3-2%20Lua%E8%84%9A%E6%9C%AC/image-20200727174113640.png)

test.lua

```lua
if redis.call("get",KEYS[1])==ARGV[1] then
    return redis.call("del",KEY[1])
else
    return 0
end
```

执行如下命令

```shell
cat lua/test.lua | redis-cli -a kujin script load --pipe
```

> script load 这个命令会在redis服务器缓存lua脚本，并返回脚本内容的SHA1校验和
>
> java端调用时，传入CHA1校验和作为参数，redis服务端会知道调用哪个lua脚本

```java
/**
     * 执行Lua文件
     */
    @Test
    public void excuLuaFile(){
        Redis redis = new Redis();
        for (int i = 0; i < 2; i++) {
            redis.execute(jedis -> {
                //1.获取一个随机字符串
                String value = UUID.randomUUID().toString();
                //2. 获取锁
                String k1 = jedis.set("k1", value, new SetParams().nx().ex(5));
                //3. 判断是否成功拿到锁
                if (k1!=null&&"ok".equalsIgnoreCase(k1)){
                    //4具体的业务操作
                    jedis.set("site","www.baidu.com");
                    System.out.println(jedis.get("site"));
                    //5 释放锁
                    jedis.evalsha("b8059ba43af6ffe8bed3db65bac35d452f8115d8", Collections.singletonList("k1"), Collections.singletonList(value));
                }else {
                    System.out.println("没拿到锁");
                }
            });
        }

    }
```

![image-20200727181837205](images/3-2%20Lua%E8%84%9A%E6%9C%AC/image-20200727181837205.png)