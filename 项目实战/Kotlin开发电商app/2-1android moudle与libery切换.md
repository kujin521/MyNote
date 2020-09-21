一、为何要进行Application与Library切换

​	组件化优势是无需编译整个project，就是因为功能模块在开发过程中以Application的形式存在。当业务功能整合时，才以Library的形式存在。

二、实现方法

1、在项目根目录的gradle.properties文件创建变量

```properties
#控制moudle library 转换 参数
isUserMoudle=true
```

2、配置build.gradle

```groovy
if (isUserMoudle.toBoolean()){
    apply plugin: 'com.android.application'
}else {
    apply plugin: 'com.android.library'
}
android {
    ...

    sourceSets{
        main{
            if (isUserMoudle.toBoolean()){
                manifest.srcFile 'src/main/debug/AndroidManifest.xml'
            }else {
                manifest.srcFile 'src/main/release/AndroidManifest.xml'
                java{
                    exclude 'debug/**'
                }
            }
        }
    }
}
```





