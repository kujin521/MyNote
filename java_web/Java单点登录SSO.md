# 后台开发如何区分Http请求的用户，记录登录状态

## （1）引言

## 1. 为什么要区分HTTP请求的用户？

> Http请求是一种无状态的协议，也就是说Http并没有连接状态的功能。没有状态的情况下意味着服务器不能确定这一次请求和下一次请求是否来源于同一个客户端。
>
> 然而根据我们的常识，用户登录成功，接下来发起的请求因该绑定该用户。比如，添加购物车，每次添加的商品因该都是对应用户的购物车，那么服务器必须识别出这个用户，其实就是用户认证的功能。
>
> 最简单的方法就是每次请求都显示地带上用户id，但这种方式很粗暴，也不安全，容易被伪造，下面介绍两种常见的解决方案

## 2. 两种方案

- **session**

  为每次会话建立一个session，http头部携带session的ID,根据ID即可区别每一次会话

- **token**

  令牌，为每一次会话创建一个token， 也放在HTTP请求头里

## 3. 术语

会话：可以理解为一系列的请求，在web应用中，大多数情况下打开浏览器到关闭浏览器的过程就是一次会话。 我们希望在一次会话中，用户始终保存自己的登录状态，并且发送的请求都能被区分。

cookie、session：解决HTTP无状态的方案，教程：理解Cookie和Session机制。

# 了解JWT

> JWT 的设计契合无状态原则：用户登录之后，服务器会返回一串 token 并保存在本地，在这之后的服务器访问都要带上这串 token，来获得访问相关路由、服务及资源的权限。比如单点登录就比较多地使用了 JWT，因为它的体积小，并且经过简单处理（使用 HTTP 头带上 Bearer 属性 + token ）就可以支持跨域操作。

![img](E:\OneDrive\随心记\java_web\images\v2-ed3e354747522c4cecb085cf1e9be299_720w.jpg)

> 首先，某 client 使用自己的账号密码发送 post 请求 login，由于这是首次接触，服务器会校验账号与密码是否合法，如果一致，则根据密钥生成一个 token 并返回，client 收到这个 token 并保存在本地。在这之后，需要访问一个受保护的路由或资源时，只要附加上 token（通常使用 Header 的 Authorization 属性）发送到服务器，服务器就会检查这个 token 是否有效，并做出响应。

#### 1. 创建 JWT

```json
// Header
{
  "alg": "HS256",
  "typ": "JWT"
}

// Payload
{
  // reserved claims
  "iss": "a.com",
  "exp": "1d",
  // public claims
  "http://a.com": true,
  // private claims
  "company": "A",
  "awesome": true
}

// $Signature 签名
HS256 ((Base64(Header) + "." + Base64(Payload)) , secretKey)

// JWT最终形式
JWT = Base64(Header) + "." + Base64(Payload) + "." + $Signature

```



















