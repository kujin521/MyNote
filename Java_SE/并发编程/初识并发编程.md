并发编程的目的是为了让程序运行得更快，但是，并不是启动更多的线程就能让程序最大限度地并发执行。在进行并发编程时，如果希望通过多线程执行任务让程序运行得更快，会面临非常多的挑战，比如上下文切换的问题、死锁的问题，以及受限于硬件和软件的资源限制问题

## 多线程一定快吗?

```java
package com.concurrthread;

/**
 * 类：
 * 编写人：kujin
 * 创建时间：2020/9/26
 */
public class ConcurrencyTest {
    private static final long count=100*10000;

    public static void main(String[] args) throws InterruptedException {
        concurrency();
        serial();
    }

    private static void concurrency() throws InterruptedException {
        long start = System.currentTimeMillis();
        int a = 0;
        for (long i = 0; i < count; i++) {
            a += 5;
        }
        int b=0;
        for (long i = 0; i < count; i++) {
            b--;
        }
        long time = System.currentTimeMillis()-start;
        System.out.println("currency: "+time+"ms,b="+b);
    }

    private static void serial() throws InterruptedException {
        long start = System.currentTimeMillis();
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                int a = 0;
                for (long i = 0; i < count; i++) {
                    a += 5;
                }
            }
        });
        thread.start();
        int b=0;
        for (long i = 0; i < count; i++) {
            b--;
        }
        long time = System.currentTimeMillis()-start;
        thread.join();
        System.out.println("currency: "+time+"ms,b="+b);
    }
}
10万次
    并发: 48ms,b=-100000
    串行: 2ms,b=-100000
1亿次
   并发: 85ms,b=-100000000
	串行: 70ms,b=-100000000
10亿次
    并发: 428ms,b=-1000000000
	串行: 770ms,b=-1000000000
```

发现并发执行次数特别巨大时 并发才比串行快

这是因为线程有创建 和 上下文 切换 的开销

## 如何减少上下文切换

- 无锁并发编程

  多线程竞争锁时 会引起上下文切换

  多线程处理时 可以避免使用锁

  如 将数据ID 按照

- CAS算法

- 使用最小线程

- 协程