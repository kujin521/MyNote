### [1.1 什么是容器?](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_11-什么是容器)

**一句话概括容器：容器就是将软件打包成标准化单元，以用于开发、交付和部署。**

- **容器镜像是轻量的、可执行的独立软件包** ，包含软件运行所需的所有内容：代码、运行时环境、系统工具、系统库和设置。
- **容器化软件适用于基于 Linux 和 Windows 的应用，在任何环境中都能够始终如一地运行。**
- **容器赋予了软件独立性**　，使其免受外在环境差异（例如，开发和预演环境的差异）的影响，从而有助于减少团队间在相同基础设施上运行不同软件时的冲突。

### [为什么要用 Docker ?](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_24-为什么要用-docker-)

- **Docker 的镜像提供了除内核外完整的运行时环境，确保了应用运行环境一致性，从而不会再出现 “这段代码在我机器上没问题啊” 这类问题；——一致的运行环境**
- **可以做到秒级、甚至毫秒级的启动时间。大大的节约了开发、测试、部署的时间。——更快速的启动时间**
- **避免公用的服务器，资源会容易受到其他用户的影响。——隔离性**
- **善于处理集中爆发的服务器使用压力；——弹性伸缩，快速扩展**
- **可以很轻易的将在一个平台上运行的应用，迁移到另一个平台上，而不用担心运行环境的变化导致应用无法正常运行的情况。——迁移方便**
- **使用 Docker 可以通过定制应用镜像来实现持续集成、持续交付、部署。——持续交付和部署**

## [Docker 基本概念](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=四-docker-基本概念)

**Docker 中有非常重要的三个基本概念，理解了这三个概念，就理解了 Docker 的整个生命周期。**

- **镜像（Image）**[一个特殊的文件系统](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_41-镜像image一个特殊的文件系统)
- **容器（Container）**[镜像运行时的实体](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_42-容器container镜像运行时的实体)
- **仓库（Repository）**[集中存放镜像文件的地方](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_43-仓库repository集中存放镜像文件的地方)

## [五 常见命令](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=五-常见命令)

### [5.1 基本命令](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_51-基本命令)

```bash
docker version # 查看docker版本
docker images # 查看所有已下载镜像，等价于：docker image ls 命令
docker container ls #    查看所有容器
docker ps #查看正在运行的容器
docker image prune # 清理临时的、没有被使用的镜像文件。-a, --all: 删除所有没有用的镜像，而不仅仅是临时文件；
```

### [5.2 拉取镜像](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_52-拉取镜像)

```bash
docker search mysql # 查看mysql相关镜像
docker pull mysql:5.7 # 拉取mysql镜像
docker image ls # 查看所有已下载镜像Copy to clipboardErrorCopied
```

### [5.3 删除镜像](https://snailclimb.gitee.io/javaguide/#/docs/tools/Docker?id=_53-删除镜像)

比如我们要删除我们下载的 mysql 镜像。

通过 `docker rmi [image]` （等价于`docker image rm [image]`）删除镜像之前首先要确保这个镜像没有被容器引用（可以通过标签名称或者镜像 ID删除）。通过我们前面讲的` docker ps`命令即可查看。

```shell
➜  ~ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
c4cd691d9f80        mysql:5.7           "docker-entrypoint.s…"   7 weeks ago         Up 12 days          0.0.0.0:3306->3306/tcp, 33060/tcp   mysqlCopy to clipboardErrorCopied
```

可以看到 mysql 正在被 id 为 c4cd691d9f80 的容器引用，我们需要首先通过 `docker stop c4cd691d9f80` 或者 `docker stop mysql`暂停这个容器。

然后查看 mysql 镜像的 id

```shell
➜  ~ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
mysql                   5.7                 f6509bac4980        3 months ago        373MBCopy to clipboardErrorCopied
```

通过 IMAGE ID 或者 REPOSITORY 名字即可删除

```shell
docker rmi f6509bac4980 #  或者 docker rmim mysql 
```