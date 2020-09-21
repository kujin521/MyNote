官方网站:https://opencv.org/

环境:win10 opencv4.4.0 vs2019

1. 添加系统环境变量:path

   ![image-20200906192821601](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/path-20200906192821601.png)

2. 安装vs2019 选择c++桌面程序

   ![img](https://upload-images.jianshu.io/upload_images/18722523-6e6f654d390d8287.png?imageMogr2/auto-orient/strip|imageView2/2/w/715/format/webp)

3. 创建一个项目

   ![image-20200906193100877](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/demo-20200906193100877.png)

# 修改配置

点击 项目>>>xx属性

> 包含目录:D:\opencv\build\include
>
> 库目录:D:\opencv\build\x64\vc15\lib

![image-20200906193820095](C:/Users/Administrator/AppData/Roaming/Typora/typora-user-images/image-20200906193820095.png)

> 附加依赖项: d :debug环境需要的,我这里两个都添加了
>
> opencv_world440.lib
> opencv_world440d.lib

![image-20200906194209922](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200906194209922.png)

![image-20200906194316233](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200906194316233.png)

# 测试代码

> 关于图片路径可以是相对路径和绝对路径
>
> 相对路径要将文件放到和项目文件夹同一个目录

```c++
// OpenCV_Test.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <iostream>
#include<openCV2/core/core.hpp>
#include<openCV2/highgui/highgui.hpp>
using namespace cv;

int main()
{
    //Mat srcImage = imread("d:/lena.jpg");
    // 图片路径,默认是1 >1彩色 <1灰色 
    Mat srcImage = imread("lena.jpg",0);
    namedWindow("show");
    imshow("show",srcImage);
    waitKey(0);
    return 0;
}
```

效果图

![image-20200906205746716](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/image-20200906205746716.png)