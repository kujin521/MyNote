## 仿制Reddit网站

> Reddit是个社交新闻站点，口号：提前于新闻发声，来自互联网的声音
>
> 用户（也叫redditors）能够浏览并且可以提交因特网上内容的链接或发布自己的原创或有关用户提交文本的帖子。其他的用户可对发布的链接进行高分或低分的投票，得分突出的链接会被放到首页。另外，用户可对发布的链接进行评论以及回复其他评论者，这样就形成了一个在线社区。Reddit用户可以创造他们自己的论题部分，对发布链接和评论的人来说，既像Reddit用户提交的非正式的，也像社团的正式的。

## 基本要素

> 构建自定义组件；
>
> 从表单中接收用户输入；
>
> 把对象列表渲染到视图中；
>
> 拦截用户的点击操作，并据此作出反应。

![image-20210809205242911](E:\OneDrive\随心记\前端学习\Angular学习笔记\images\image-20210809205242911.png)

## 环境配置



## 创建第一个Angular项目

## 相关命令

# 创建项目

```bash
ng new angular2_reddit
```

复制以下文件到你的应用目录下：

 src/index.html

 src/styles.css

 src/app/vendor

 src/assets/images

## 添加组件

```bash
ng g c 组件路径/组件名
```

现在来构建一个新的组件，它将：

(1) 存储我们的当前文章列表；

(2) 包含一个表单，用来提交新的文章。

修改app-root 根页面内容

> code/first_app/angular2_reddit/src/app/app.component.html 

```html
<form class="ui large form segment"> 
 <h3 class="ui header">Add a Link</h3> 
 <div class="field"> 
 <label for="title">Title:</label> 
 <input name="title"> 
 </div> 
 <div class="field"> 
 <label for="link">Link:</label> 
 <input name="link"> 
 </div> 
</form>
```

## 添加交互

> **code/first_app/angular2_reddit/src/app/app.component.ts** 

```
export class AppComponent { 

 addArticle(title: HTMLInputElement, link: HTMLInputElement): boolean { 

 console.log(`Adding article title: ${title.value} and link: ${link.value}`); 

 return false; 

 } 
} 
```

**code/first_app/angular2_reddit/src/app/app.component.html** 

```html
<form class="ui large form segment"> 

 <h3 class="ui header">Add a Link</h3> 

 <div class="field"> 

 <label for="title">Title:</label> 

 <input name="title" #newtitle> <!-- changed --> 

 </div> 

 <div class="field"> 

 <label for="link">Link:</label> 

 <input name="link" #newlink> <!-- changed --> 

 </div> 

 <!-- added this button --> 

 <button (click)="addArticle(newtitle, newlink)"  class="ui positive right floated button"> 

 Submit link 

 </button> 

</form> 
```

## 总结一下

我们一共进行了四项修改：

(1) 在模版中创建了一个button标签，向用户表明应该点击哪里；

(2) 新建了一个名叫addArticle的函数，来定义按钮被点击时要做的事情；

(3) 在button上添加了一个(click)属性，意思是“只要点击了这个按钮，就运行addArticle函数”；

(4) 在两个<input>标签上分别添加了#newtitle和#newlink属性。



# 添加文章组件

> 下面就来新建一个组件，用来单独展示这些提交过的文章

![image-20210809212355672](E:\OneDrive\随心记\前端学习\Angular学习笔记\images\image-20210809212355672.png)

```bash
ng generate component article 
```

定义这个新组件总共用到了三部分代码：

(1) 在模板中定义了ArticleComponent的视图；

(2) 通过为类加上@Component注解定义了ArticleComponent组件的元数据；

(3) 定义了一个组件定义类（ArticleComponent），其中是组件本身的逻辑。

\1. 创建**ArticleComponent**的**template**

我们使用文件article.component.html定义模板。

> **code/first_app/angular2_reddit/src/app/article/article.component.html** 

```html
<div class="four wide column center aligned votes"> 
 <div class="ui statistic"> 
 <div class="value"> 
{{ votes }} 
 </div> 
 <div class="label"> 
Points 
 </div> 
 </div> 
</div> 
<div class="twelve wide column"> 
 <a class="ui large header" href="{{ link }}"> 
 {{ title }} 
 </a> 
 <ul class="ui big horizontal list voters"> 
 <li class="item"> 
<a href (click)="voteUp()"> 
 <i class="arrow up icon"></i> 
 upvote 
</a> 
 </li> 
 <li class="item"> 
<a href (click)="voteDown()"> 
 <i class="arrow down icon"></i> 
 downvote 
</a> 
 </li> 
 </ul> 
</div>
```

这里有很多页面脚本，我们来分解一下

## 创建组件定义类ArticleComponent



## 运行应用

```bash
ng serve
```





## Angular程序写法思路

1. 把应用拆分成组件
2. 定义模型
3. 显示模型
4. 添加交互



















