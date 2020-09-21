[toc]

# 简介

官方文档：https://git-scm.com/docs

```shell
git [--version] [--help] [-C <path>] [-c <name>=<value>]
    [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
    [-p|--paginate|-P|--no-pager] [--no-replace-objects] [--bare]
    [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
    [--super-prefix=<path>]
    <command> [<args>]
```

> Git 是一个快速的、可扩展的、具有异常丰富的命令集的分散式版本控制，它既提供了高级操作，也提供了对内部的完全访问。
>

# 安装

```
# linux系统
sudo apt-get install git
yum install git
# windos 去官网下载安装包
```

# 配置git

- 打开git终端,配置用户名和邮箱,必须


```bash
git config --global user.name "kujin"
git config --global user.email "kujin@qq.com"
```