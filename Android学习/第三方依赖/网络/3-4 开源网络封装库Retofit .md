# 1.简介



# 2.Retrofit基本用法

### 2.1添加依赖

```groovy
    implementation 'com.squareup.retrofit2:retrofit:2.6.1'
    implementation 'com.squareup.retrofit2:converter-gson:2.6.1'
```

## 2.2.编写gson实体类

```kotlin
class App(val id: String, val name: String, val version: String)
```

## 2.3创建接口

```kotlin
interface AppService {
    /**
     * 使用get请求,参数是请求相对地址
     * 返回类型是 对应的实体类
     */
    @GET("get_data.json")
    fun getAppData(): Call<List<App>>

}
```

## 2.4Activity界面编辑

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent" >

    <Button
        android:id="@+id/getAppDataBtn"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Get App Data" />

</LinearLayout>
```

