

## css背景属性: background

```css
body {
  background-color: #ffffff;
  background-image: url("img_tree.png");
  background-repeat: no-repeat;
  background-attachment:filxed;
  background-position: right top;
}
```

## 边界: border



## 边距: margin



## 填充: padding

## 宽高

属性和属性可能具有以下值：`height``width`

- `auto`- 这是默认值。浏览器计算高度和宽度
- `length`- 以 px、cm 等定义高度/宽度。
- `%`- 定义包含块百分比的高度/宽度
- `initial`- 将高度/宽度设置为其默认值
- `inherit`- 高度/宽度将从其父值继承

`设置max-width`最大宽度 可根据屏幕设置调小

## div

```css
div {
  width: 300px;
  border: 15px solid green;
  padding: 50px;
  margin: 20px;
}
```

## 轮廓

- `outline-style` 样式
- `outline-color` 颜色
- `outline-width` 宽度
- `outline-offset` 偏移
- `outline`

该属性指定大纲的样式，并且可以具有以下值之一：`outline-style`

- `dotted`- 定义虚线轮廓
- `dashed`- 定义虚线轮廓
- `solid`- 定义一个可靠的轮廓
- `double`- 定义双轮廓
- `groove`- 定义 3D 凹槽轮廓
- `ridge`- 定义 3D 脊轮廓
- `inset`- 定义 3D 插图大纲
- `outset`- 定义 3D 开始轮廓
- `none`- 定义无轮廓
- `hidden`- 定义隐藏的大纲

## 文本

### 颜色：color

```css
body {
  background-color: lightgrey;
  color: blue;
}

h1 {
  background-color: black;
  color: white;
}
```

### 文本对齐: text-align

```css
h1 {
  text-align: center;
}

h2 {
  text-align: left;
}

h3 {
  text-align: right;
}
```

### 文本线：text-decoration

该值通常用于从链接中删除下划线：`text-decoration: none;`

```css
h1 {
  text-decoration: overline;
}

h2 {
  text-decoration: line-through;
}

h3 {
  text-decoration: underline;
}
```

### 文本转换：text-transform

```css
p.uppercase {
  text-transform: uppercase;
}

p.lowercase {
  text-transform: lowercase;
}

p.capitalize {
  text-transform: capitalize;
}
```

### 文本间距 text-indent

```css
p {
  text-indent: 50px;
}
```



### 阴影：text-shadow

```bash
h1 {
  text-shadow: 2px 2px;
}
```



## 字体

- `font-style`
- `font-variant`
- `font-weight`
- `font-size/line-height`
- `font-family`

### 字体：font-family

在CSS中有五个通用字体家族：

1. **Serif**字体在每个字母的边缘有一个小笔画。他们创造了一种形式感和优雅感。
2. **Sans-serif**字体有干净的线条（不小的笔画附加）。他们创造了现代和简约的外观。
3. **Monospace**字体 - 在这里，所有的字母都有相同的固定宽度。它们创造了一种机械外观。
4. **Cursive**字体模仿人类手写。
5. **Fantasy**字体是装饰性/俏皮的字体。

字体需要安装：设置多个字体备份 依次由浏览器查找字体

```css
.p1 {
  font-family: "Times New Roman", Times, serif;
}

.p2 {
  font-family: Arial, Helvetica, sans-serif;
}

.p3 {
  font-family: "Lucida Console", "Courier New", monospace;
}
```

### 字形：font-style

此属性有三个值：

- normal - 文本显示正常
- italic - 选择文件文本以斜体显示
- oblique - 文本是“倾斜的”（斜体与斜体非常相似，但不太受支持）

```css
p.normal {
  font-style: normal;
}
p.italic {
  font-style: italic;
}
p.oblique {
  font-style: oblique;
}
```

### 字体大小：font-size

1em 等于当前字体大小。浏览器中的默认文本大小为 16px。因此，1em 的默认大小为 16px。

使用此公式可以从像素到 em 计算大小：*像素*/16+*em*

本大小可以设置一个单位，这意味着"视图港宽度"。`vw`

```
h1 {
  font-size: 2.5em;font-size: 2.5em;
}

h2 {
  font-size: 30px;
}

p {
  font-size: 14px;
}
```

## 图标：<i> <span>

将图标添加到 HTML 页面的最简单方法是使用图标库

将指定图标类的名称添加到任何内联 HTML 元素（如或）。`<i>``<span>`

```html
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

<i class="fas fa-cloud"></i>
<i class="fas fa-heart"></i>
<i class="fas fa-car"></i>
<i class="fas fa-file"></i>
<i class="fas fa-bars"></i>

</body>
</html>
```

## 连接：a

四个链接状态是：

- `a:link`- 正常、未访问的链接
- `a:visited`- 用户访问的链接
- `a:hover`- 当用户鼠标超过它时链接
- `a:active`- 单击该链接的那一刻

```css
/* unvisited link */
a:link {
  color: red;
}

/* visited link */
a:visited {
  color: green;
}

/* mouse over link */
a:hover {
  color: hotpink;
}

/* selected link */
a:active {
  color: blue;
}
```

### 下划线：text-decoration

该属性主要用于从链接中删除下划线：`text-decoration`

```css
a:link {
  text-decoration: none;
}

a:visited {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: underline;
}
```

## 列表

使用速记属性时，属性值的顺序是：

- `list-style-type`（如果指定了列表式图像，则如果由于某些原因无法显示该属性的图像，则将显示该属性的价值）
- `list-style-position`（具体说明列表项目标记应出现在内容流内部还是外部）
- `list-style-image`（指定图像为列表项目标记）

## 表格

## 所有 CSS 列表属性

| Property                                                     | Description                                                  |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| [list-style](https://www.w3schools.com/cssref/pr_list-style.asp) | Sets all the properties for a list in one declaration        |
| [list-style-image](https://www.w3schools.com/cssref/pr_list-style-image.asp) | Specifies an image as the list-item marker                   |
| [list-style-position](https://www.w3schools.com/cssref/pr_list-style-position.asp) | Specifies the position of the list-item markers (bullet points) |
| [list-style-type](https://www.w3schools.com/cssref/pr_list-style-type.asp) | Specifies the type of list-item marker                       |

## 显示隐藏 display:none

`block`块级元素始终从新线开始，并占用可用的全宽度（尽可能向左和向右延伸）。

`inline`内联元件不会从新线路开始，只会占用所需的宽度。

`visibility:hidden;`也隐藏一个元素。但是，该元素仍将占据与以前相同的空间。该元素将被隐藏，但仍会影响布局

## 定位 position

有五个不同的位置值：

- `static `默认情况下，HTML 元素是静态定位的。
- `relative` 与正常位置相对于其位置的元素定位
- `fixed` 固定元素不会在通常所在的页面中留下间隙。
- `absolute` 绝对定位的元素从正常流中删除，并且可以重叠元素。
- `sticky` 基于用户的滚动位置来定位。

重叠元素：该属性指定元素的堆叠顺序（该元素应放置在其他元素的前面或后面）。`z-index`

具有较大堆栈顺序的元素始终位于具有较低堆栈顺序的元素前面。

## 溢出overflow

| 值      | 描述                                                     |
| :------ | :------------------------------------------------------- |
| visible | 默认值。内容不会被修剪，会呈现在元素框之外。             |
| hidden  | 内容会被修剪，并且其余内容是不可见的。                   |
| scroll  | 内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容。 |
| auto    | 如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。 |
| inherit | 规定应该从父元素继承 overflow 属性的值。                 |

## 浮动

该属性可以具有以下值之一：`float`

- `left`- 元素漂浮到容器的左侧
- `right`- 元素漂浮到容器的右侧
- `none`- 元素不会浮动（将仅显示在文本中发生的位置）。这是默认值
- `inherit`- 元素继承其母公司的浮动值

使用浮动可能会使内容溢出屏幕外：解决方式：`overflow: auto`



## 内联块

创建水平导航链接：`display: inline-block`

## 对齐

设置水平居中对齐：margin:auto 要设置具体width

文本居中：text-align:center

图片居中：要让图片居中对齐, 可以使用 **margin: auto;** 并将它放到 **块** 元素中: display:block

使用绝对定位：**position: absolute;** 属性来对齐元素:

左右对齐：float

垂直居中：padding

## 组合选择

在 CSS3 中包含了四种组合方式:

- 后代选择器(以空格   分隔)
- 子元素选择器(以大于 **>** 号分隔）
- 相邻兄弟选择器（以加号 **+** 分隔）
- 普通兄弟选择器（以波浪号 **～** 分隔）

## 伪类 :name

用于定义元素的特殊状态

```css
a:link {color:#FF0000;} /* 未访问的链接 */
a:visited {color:#00FF00;} /* 已访问的链接 */
a:hover {color:#FF00FF;} /* 鼠标划过链接 */
a:active {color:#0000FF;} /* 已选中的链接 */
```

**注意：** 在CSS定义中，a:hover 必须被置于 a:link 和 a:visited 之后，才是有效的。

**注意：** 在 CSS 定义中，a:active 必须被置于 a:hover 之后，才是有效的。

**注意：**伪类的名称不区分大小写。

## 伪元素

