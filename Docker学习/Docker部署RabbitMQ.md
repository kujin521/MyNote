



官方地址：https://www.rabbitmq.com/#getstarted

docker 镜像地址：https://registry.hub.docker.com/_/rabbitmq/

# 什么是 RabbitMQ？

> RabbitMQ 是实现高级消息队列协议 (AMQP) 的开源消息代理软件（有时称为面向消息的中间件）。RabbitMQ 服务器是用 Erlang 编程语言编写的，并建立在 Open Telecom Platform 框架上，用于集群和故障转移。与代理交互的客户端库可用于所有主要编程语言。

# 如何使用此图像

### 获取镜像

注意：management是管理界面插件

```shell
docker search rabbitmq:management

docker pull rabbitmq:management

docker images
```

### 运行容器

```console
docker run -di --name=my_rabbitma -p 5672:5672 -p 5671:5671 -p 4369:4369 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq:management
```

如果报错docker: Error response from daemon: driver failed programming external connectivity on endpoint my_rabbitma (44cc4499c3faaad112066ca7060d812ee56e3270db0521208e7a59a6569d1546):  (iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 15672 -j DNAT --to-destination 172.17.0.4:15672 ! -i docker0: iptables: No chain/target/match by that name.
 (exit status 1)).

```shell
--删除错误容器
docker container prune
--重启docker
systemctl restart docker
```

