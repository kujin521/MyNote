[toc]

# 第 1 步：启动 Bitnami WordPress 虚拟机

- 下载连接:https://bitnami.com/stack/wordpress/virtual-machine

- 使用虚拟机打开连接

![image-20200730114146505](images/1-1%20%E5%AE%89%E8%A3%85bitnami%E8%99%9A%E6%8B%9F%E6%9C%BA/image-20200730114146505.png)

现在，您可以通过启动 Web 浏览器并浏览虚拟机的 IP 地址来访问 WordPress。您应该会看到博客的头版，并包含一个示例帖子，如下所示：

http://192.168.2.139/

![image-20200730114615539](images/1-1%20%E5%AE%89%E8%A3%85bitnami%E8%99%9A%E6%8B%9F%E6%9C%BA/image-20200730114615539.png)

# 第 2 步：登录并使用 WordPress 开始

要登录到 WordPress 仪表板，请按照以下步骤操作：

- 浏览到 WordPress 仪表板，通常在 URL *http://192.168.2.139/wp-admin。*

- 查看用户名和密码

- ```bash
  sudo cat /home/bitnami/bitnami_credentials
  ```

  ![image-20200730120745221](images/1-1%20%E5%AE%89%E8%A3%85bitnami%E8%99%9A%E6%8B%9F%E6%9C%BA/image-20200730120745221.png)

## 设置中文显示

![image-20200730120842595](images/1-1%20%E5%AE%89%E8%A3%85bitnami%E8%99%9A%E6%8B%9F%E6%9C%BA/image-20200730120842595.png)