# 简介

# git init 

> 创建一个空的 Git 存储库或重新初始化现有存储库

```git
git init [-q | --quiet] [--bare] [--template=<template_directory>]
	  [--separate-git-dir <git dir>] [--object-format=<format>]
	  [-b <branch-name> | --initial-branch=<branch-name>]
	  [--shared[=<permissions>]] [directory]
```

## 选择

| 命令      | 描述                                                         |
| --------- | ------------------------------------------------------------ |
| -q        | 只打印错误和警告消息; 所有其他输出将被禁止                   |
| **-bare** | 创建一个裸库。如果没有设置环境，则将其设置为当前的工作目录   |
| **-b**    | 新创建的存储库中为初始分支使用指定的名称。如果没有指定，则退回到默认名称: master |
|           |                                                              |
|           |                                                              |
|           |                                                              |
|           |                                                              |
|           |                                                              |
|           |                                                              |

# Git Clone 

> 将存储库克隆到一个新目录中

```
git clone [--template=<template_directory>]
	  [-l] [-s] [--no-hardlinks] [-q] [-n] [--bare] [--mirror]
	  [-o <name>] [-b <name>] [-u <upload-pack>] [--reference <repository>]
	  [--dissociate] [--separate-git-dir <git dir>]
	  [--depth <depth>] [--[no-]single-branch] [--no-tags]
	  [--recurse-submodules[=<pathspec>]] [--[no-]shallow-submodules]
	  [--[no-]remote-submodules] [--jobs <n>] [--sparse]
	  [--filter=<filter>] [--] <repository>
	  [<directory>]
```

克隆一个存储库到一个新创建的目录中，为克隆的存储库中的每个分支创建远程跟踪分支(使用 git branch -- remotes 可见) ，并创建和检出从克隆的存储库的当前活动分支中分支出来的初始分支。

## 选项

| 命令                       | 描述                                                         |
| -------------------------- | ------------------------------------------------------------ |
| **-b <name>** - b < 姓名 > | 不要将新创建的 HEAD 指向克隆存储库的 HEAD 所指向的分支，而是指向 < name > branch。在非裸存储库中，这是要签出的分支。-- branch 还可以获取标记，并在结果存储库中的那个提交处分离 HEAD。 |
|                            |                                                              |
|                            |                                                              |

