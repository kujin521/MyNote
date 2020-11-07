# Maven和Gradle相关设置

idea对项目创建创建的两种方式maven和gradle

注意：idea对gradle的支持还不是很智能，对maven的依赖的好

## maven设置

1. 下载maven

   http://maven.apache.org/download.cgi

2. 配置仓库阿里源

   编辑settings.xml 文件

   ```xml
   <mirrors>
   	<mirror>
   		<id>nexus-aliyun</id>
   		<mirrorOf>central</mirrorOf>
   		<name>Nexus aliyun</name>
   		<url>http://maven.aliyun.com/nexus/content/groups/public</url>
   	</mirror>
     </mirrors>
   ```

3. 所有的需要的依赖都会下载到repository

### idea设置

![image-20200926094915437](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200926094915.png)

## gradle设置

1. 下载gradle

   https://gradle.org/

2. 创建一个主目录 用于版本切换,相当于maven的仓库,会生成如下文件

   ![image-20200926100108121](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200926100108.png)

### idea设置

![image-20200926100448235](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/20200926100448.png)