# 作用

> 免费的图片服务器,用存放图片,方便引用地址

# Github

> 仓库存储代理,全球最大基友社区 ):

# Typora

地址: https://typora.io

# PicGo

> **PicGo: 一个用于快速上传图片并获取图片URL链接的工具**

官方中文手册(一定要看): https://picgo.github.io/PicGo-Doc/zh/guide/config.html

## 入门配置

### GitHub图床

```json
{
  "repo": "", // 仓库名，格式是username/reponame
  "token": "", // github token
  "path": "", // 自定义存储路径，比如img/
  "customUrl": "", // 自定义域名，注意要加http://或者https://
  "branch": "" // 分支名，默认是master
}
```

**1.** 首先你得有一个GitHub账号。注册GitHub就不用我多言。

**2.** 新建一个仓库

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/create_new_repo.png)

记下你取的仓库名。

**3.** 生成一个token用于PicGo操作你的仓库：

访问：https://github.com/settings/tokens

然后点击`Generate new token`。

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/generate_new_token.png)

把repo的勾打上即可。然后翻到页面最底部，点击`Generate token`的绿色按钮生成token。

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/20180508210435.png)

**注意：**这个token生成后只会显示一次！你要把这个token复制一下存到其他地方以备以后要用。

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/copy_token.png)

**4.** 配置PicGo

**注意：**仓库名的格式是`用户名/仓库`，比如我创建了一个叫做`test`的仓库，在PicGo里我要设定的仓库名就是`Molunerfinn/test`。一般我们选择`master`分支即可。然后记得点击确定以生效，然后可以点击`设为默认图床`来确保上传的图床是GitHub。

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/setup_github.png)

至此配置完毕，已经可以使用了。当你上传的时候，你会发现你的仓库里也会增加新的图片了：

![img](https://raw.githubusercontent.com/Molunerfinn/test/master/picgo/success.png)

# 关于设置代理(不推荐,如果github不行,就用gitee)

> **本地使用代理,上传连接失败(PicGo只支持简单的http代理),使用VPN可能会导致失败**

![image-20200807121243683](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200807121243683.png)

![image-20200807121326220](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200807121631.png)

# 建议重命名文件

![image-20200807122409728](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-%E6%96%87%E4%BB%B6%E9%87%8D%E5%91%BD%E5%90%8D.png)

![image-20200807122609628](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200807122609628.png)

# 上传失败总结

- 相同文件名重复提交失败,修改名称可提交成功
- PicGo(2.3.0)中的相册无法删除github中的文件

