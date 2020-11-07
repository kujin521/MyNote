## 概述

MkDocs是**一个快速，简单和彻头彻尾的华丽的静态网站生成器**，旨在建设项目文档。文档源文件以 Markdown 格式写入，并配置了单个 YAML 配置文件。首先阅读下面的简介，然后查看用户指南了解更多信息。

### 提供伟大的主题

MkDocs 有一堆[好看](https://www.mkdocs.org/user-guide/styling-your-docs/)的主题。在内置主题之间选择[：mkdocs](https://www.mkdocs.org/user-guide/styling-your-docs/#mkdocs)和[readthedocs，](https://www.mkdocs.org/user-guide/styling-your-docs/#readthedocs)选择[在MkDocs主题维基页面上列出的第三方主题之](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes)一，[或建立自己的](https://www.mkdocs.org/user-guide/custom-themes/)。

### 易于定制

通过自定义主题和/或安装一些插件，[让项目文档](https://www.mkdocs.org/user-guide/configuration/#theme)按您想要的方式[进行查找](https://www.mkdocs.org/user-guide/plugins/)。

## 安装

### 使用包管理器安装(前提需要安装python 配置好环境变量)

#### 安装 MkDocs

使用 pip 安装包：`mkdocs`

```
pip install mkdocs
```

现在，您应该在您的系统上安装该命令。运行以检查一切正常。`mkdocs``mkdocs --version`

```
$ mkdocs --version
mkdocs, version 0.15.3
```

## 开始

入门是超级容易。

```
mkdocs new my-project
cd my-project
```

请花一点时间查看已为你创建的初始项目。

![The initial MkDocs layout](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201004110059.png)

有一个名为 的配置文件，以及一个名为包含文档源文件的文件夹。现在，该文件夹仅包含一个名为 的文档页。`mkdocs.yml``docs``docs``index.md`

MkDocs 附带一个内置的开发服务器，允许您在操作文档时预览文档。请确保您与配置文件在同一个目录中，然后通过运行命令启动服务器：`mkdocs.yml``mkdocs serve`

```
$ mkdocs serve
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 160402 15:50:43 server:271] Serving on http://127.0.0.1:8000
[I 160402 15:50:43 handlers:58] Start watching changes
[I 160402 15:50:43 handlers:60] Start detecting changes
```

在浏览器中打开，你会看到默认主页显示：`http://127.0.0.1:8000/`

![The MkDocs live server](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20201004110129.png)

## 修改配置文件mkdocs.yml

```yaml
site_name: 这是bolg 的标题
# 导航
nav:
    - Home: index.md	# 主页
    - About: about.md	# 关于
# 主题
theme: readthedocs	
```

MkDocs 使用[MkDocs 图标](https://www.mkdocs.org/img/favicon.ico)。若要使用其他图标，请创建一个子目录，然后将自定义文件复制到该目录。MkDocs 将自动检测并用作您的图标。`img``docs_dir``favicon.ico`

## 构建网站

看起来不错您已准备好部署文档的第一个通道。首先生成文档：`MkLorum`

```
mkdocs build
```