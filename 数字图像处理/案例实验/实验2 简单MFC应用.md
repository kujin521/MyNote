1.  实验名称

    OpenCV安装与环境配置 与图像 视频的读取显示

2.  实验目的

> 环境变量（系统变量、用户变量），新建visual C++项目
>
> 掌握使用OpenCV读取图像、视频并显示

3.  实验内容

官方网站:https://opencv.org/

## 环境:

**win10** **opencv4.4.0** **vs2019**

### 添加系统环境变量:path

-   <img src="C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195028905.png" alt="image-20201013195028905" style="zoom:80%;" />

2.  ### 安装vs2019 选择c++桌面程序

3.  ### 创建一个项目

-   ![image-20201013195040854](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195040854.png)

### 修改配置

点击 项目\>\>\>xx属性

> 包含目录:D:\\opencv\\build\\include
>
> 库目录:D:\\opencv\\build\\x64\\vc15\\lib

![image-20201013195050740](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195050740.png)

> 附加依赖项: d :debug环境需要的,我这里两个都添加了(其实一个就行了) 经使用发现debug 模式下有错误 具体原因未知

    opencv_world440.lib
    opencv_world440d.lib

![image-20201013195059855](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195059855.png)

选择**链接器** **输入** **附加依赖项**

![image-20201013195106978](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195106978.png)

### 测试代码

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

![image-20201013195118641](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195118641.png)

创建一个mfc 对于dialog 的项目

界面

![image-20201013195126644](C:%5CUsers%5CAdministrator%5CAppData%5CRoaming%5CTypora%5Ctypora-user-images%5Cimage-20201013195126644.png)

核心代码

```c++
void CDemo2Dlg::OnBnClickedButton1()

{

// 点击open 打开图片事件

//CFileDialog类封装了Windows常用的文件对话框，提供了文件打开和文件存盘对话框功能。可以用其构造函数创建打开图片或视频的对话框；

CFileDialog dlg(TRUE, \_T(\"\*.jpg\"), NULL, OFN_FILEMUSTEXIST \| OFN_PATHMUSTEXIST, \_T(\"Image files(\*.bmp,\*.jpg)\|\*.bmp;\*.jpg\|All files(\*.\*)\|\*.\*\|\"), NULL);

dlg.m_ofn.lpstrTitle = \_T(\"Open Images\");

if (dlg.DoModal() != IDOK) {

return;

}

//获取路径

CString filePath = dlg.GetPathName();

//将路径转换字符类型

string sFileName=(LPCTSTR) filePath;

//Imread（）函数用来图像的读取

src = imread(sFileName);

//如果 内容为空

if (src.empty())

{

AfxMessageBox(\_T(\"图像读取错误! \"));

return;

}

else {

CRect rect;

//图片控件绑定

GetDlgItem(IDC_PIC)-\>GetClientRect(&rect);

Mat img;

//图片缩放 到正常大小

resize(src, img, Size(rect.Width(), rect.Height()));

//显示图片

imshow(\"view\", img);

}

}

void CDemo2Dlg::OnBnClickedVidio()

{

// 打开视频事件

/\*CFileDialog dlg(TRUE, \_T(\"\*.avi\"), NULL, OFN_FILEMUSTEXIST \| OFN_PATHMUSTEXIST, \_T(\"Vidio files(\*.avi)\|\*.avi\|All files(\*.\*)\|\*.\*\|\"), NULL);

dlg.m_ofn.lpstrTitle = \_T(\"Open Vido\");

if (dlg.DoModal() != IDOK) {

return;

}

CString filePath = dlg.GetPathName();

string sFileName = (LPCTSTR)filePath;\*/

VideoCapture capture;

//int re=capture.open(sFileName);

//打开摄像头

//int re = capture.open(0);

//打开网络源 cctv5

int re = capture.open(\"http://ivi.bupt.edu.cn/hls/hunanhd.m3u8\");

if (!re) {

AfxMessageBox(\"Can not open Video!\");

return;

}

CRect rect;

GetDlgItem(IDC_PIC)-\>GetClientRect(&rect);

Mat img;

Mat frame;

while(1) {

capture \>\> frame;

if (frame.empty())

{

//AfxMessageBox(\_T(\"视频读取错误! \"));

return;

}

else {

resize(frame, img, Size(rect.Width(), rect.Height()));

imshow(\"view\", img);

waitKey(30);

}

}
```



4.  总结

    在学习过程中遇到了很多错误, 在此做一个总结

    错误1 类,函数认识不清 导致代码写错 不知道出现位置

    错误2 opencv 提示 没有该函数 解决 导入相关的include

> \#include\<openCV2/core/core.hpp\>
>
> \#include\<openCV2/highgui/highgui.hpp\>
>
> \#include\<opencv2/highgui/highgui_c.h\>

\#include \<opencv2/imgproc/imgproc.hpp\>

出现这个原因 可能是 opencv 没有配置好

> 错误3无法从LPCTSTR 转换成 string 原因 字符集错误
>
> 严重性 代码 说明 项目 文件 行 禁止显示状态 错误 C2440 "初始化": 无法从"LPCTSTR"转换为"std::basic_string[char,std::char_traits\<char](char,std::char_traits<char),std::allocator\<char\>\>" Demo2 D:\\Documents\\Visual Studio 2019\\opencv_apps\\OpenCV_Test\\Demo2\\Demo2Dlg.cpp 207

项目 属性 配置属性 高级(常规) 字符集 选择使用多字节字符集

要根据输出的错误信息进行修改 认真查看输出的信息

注：上机实验指实验地点在信电学院计算中心的上机，留存电子版即可。
