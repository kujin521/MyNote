用法示例
这是一个网络服务的草图，其中螺纹在一个线程池服务传入的请求。 它使用预配置Executors.newFixedThreadPool工厂方法：

```java
class NetworkService implements Runnable {
   private final ServerSocket serverSocket;
   private final ExecutorService pool;

   public NetworkService(int port, int poolSize)
       throws IOException {
     serverSocket = new ServerSocket(port);
     pool = Executors.newFixedThreadPool(poolSize);
   }

   public void run() { // run the service
     try {
       for (;;) {
         pool.execute(new Handler(serverSocket.accept()));
       }
     } catch (IOException ex) {
       pool.shutdown();
     }
   }
 }

 class Handler implements Runnable {
   private final Socket socket;
   Handler(Socket socket) { this.socket = socket; }
   public void run() {
     // read and service request on socket
   }
 }
```


下面的方法将关闭的ExecutorService两个阶段，首先通过调用shutdown拒绝传入任务，然后调用shutdownNow ，如果必要的话，取消任何挥之不去的任务：

```java
 void shutdownAndAwaitTermination(ExecutorService pool) {
   pool.shutdown(); // Disable new tasks from being submitted
   try {
     // Wait a while for existing tasks to terminate
     if (!pool.awaitTermination(60, TimeUnit.SECONDS)) {
       pool.shutdownNow(); // Cancel currently executing tasks
       // Wait a while for tasks to respond to being cancelled
       if (!pool.awaitTermination(60, TimeUnit.SECONDS))
           System.err.println("Pool did not terminate");
     }
   } catch (InterruptedException ie) {
     // (Re-)Cancel if current thread also interrupted
     pool.shutdownNow();
     // Preserve interrupt status
     Thread.currentThread().interrupt();
   }
 }
```


内存一致性效果：操作在一个线程之前提交的Runnable或Callable任务到ExecutorService发生-之前由该任务，这反过来又发生-之前结果通过检索所采取的任何行动Future.get()