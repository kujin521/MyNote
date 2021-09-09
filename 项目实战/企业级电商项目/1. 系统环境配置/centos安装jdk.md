## 去官网下载java包，获取下载连接

```bash
yum install wget
wget https://download.oracle.com/otn/java/jdk/8u291-b10/d7fc238d0cbf4b0dac67be84580cfb4b/jdk-8u291-linux-x64.rpm?AuthParam=1625281647_dec1321432e014a4bd2addb834d14e75
```

## 安装jdk

```bash
sudo rpm -ivh xxx.rpm
```

## 配置环境变量

```bash
vi /etc/profile
```

在最后添加

```bash
export JAVA_HOME=/usr/java/jdk1.8.0_291-amd64
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$JAVA_HOME/bin:$PATH
```

生效环境配置

```bash
source /etc/profile
```

验证

```bash
java -version
```

