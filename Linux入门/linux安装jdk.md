# 下载压缩包

 https://download.oracle.com/otn/java/jdk/8u261-b12/a4634525489241b9a9e1aa73d9e118e6/jdk-8u261-linux-x64.tar.gz?AuthParam=1596785260_6b143225e725d6b93cf2f48e8fcbe4df

# 解压

```bash
tar zxvf jdk-***.gz
```

# 设置环境变量

修改到自己的jdk目录,直接命令行修改

```bash
echo "export JAVA_HOME=/root/jdk1.8.0_261" >> /etc/profile;
echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile;
echo "export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" >> /etc/profile;
source /etc/profile
```

# 检查

```bash
java -version
```

