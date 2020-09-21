[toc]

# 1.首先修改密码

**修改虚拟机的默认登录密码**

虚拟机控制台的默认登录密码在启动时显示，如下所示：

[![Server credentials](https://docs.bitnami.com/images/img/platforms/virtual-machine/server-credentials.png)](https://docs.bitnami.com/images/img/platforms/virtual-machine/server-credentials.png)

首次登录时，系统会自动提示您更改此更改。若要以后更改它，请执行下面的命令在控制台：

```
passwd
```

# 2.启用 SSH 服务器

> 默认情况下，在 Bitnami 虚拟机中禁用 SSH 服务器。但是，某些应用程序（如 GitLab）需要 SSH 访问导入代码存储库。

#### Debian

```
sudo rm -f /etc/ssh/sshd_not_to_be_run
sudo systemctl enable ssh
sudo systemctl start ssh
```

#### Ubuntu

```
sudo mv /etc/init/ssh.conf.back /etc/init/ssh.conf
sudo start ssh
```

### 禁用 SSH 服务器

默认情况下，在 Bitnami 虚拟机中禁用 SSH 服务器。如果已[按照此处所述启用它](https://docs.bitnami.com/virtual-machine/faq/get-started/enable-ssh/)，则可以按照相反的步骤禁用它：

#### Debian

```
sudo systemctl stop ssh
sudo systemctl disable ssh
```

#### Ubuntu

```
sudo stop ssh
sudo mv /etc/init/ssh.conf /etc/init/ssh.conf.back
```

# 3.连接成功

![image-20200731114408221](images/1-2%20%E8%BF%9E%E6%8E%A5SSH/image-20200731114408221.png)