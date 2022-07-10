# Face Recognition 人脸识别

> 本项目是世界上最简洁的人脸识别库，你可以使用Python和命令行工具提取、识别、操作人脸。
>
> 本项目的人脸识别是基于业内领先的C++开源库 [dlib](http://dlib.net/)中的深度学习模型，用[Labeled Faces in the Wild](http://vis-www.cs.umass.edu/lfw/)人脸数据集进行测试，有高达99.38%的准确率。但对小孩和亚洲人脸的识别准确率尚待提升。

## 安装

### 环境配置

- Python 3.3+ or Python 2.7
- macOS or Linux
- Windows并不是我们官方支持的, 也能用

## python安装

```shell
pip install dlib
pip3 install face_recognition
```

## 应用案例

```python
# 导入人脸识别
import face_recognition
# 加载人脸图片
image = face_recognition.load_image_file("kujin.jpg")
# 找到人脸位置()
face_locations = face_recognition.face_locations(image)
print(face_locations)
# 识别人脸特征
face_landmaks_list=face_recognition.face_landmarks(image)
print(face_landmaks_list)
# 查找人脸编码
list_of_face_encodings=face_recognition.face_encodings(image)
print(list_of_face_encodings)
```

```shell
[(56, 126, 146, 36)]
[{'chin': [(39, 78), (40, 89), (40, 99), (41, 109), (44, 119), (51, 127), (59, 134), (68, 139), (79, 140), (90, 139), (100, 134), (108, 128), (115, 119), (119, 110), (120, 99), (121, 89), (121, 79)], 'left_eyebrow': [(46, 73), (51, 67), (59, 66), (67, 69), (74, 72)], 'right_eyebrow': [(84, 72), (91, 69), (99, 67), (107, 67), (113, 73)], 'nose_bridge': [(79, 79), (78, 85), (78, 91), (78, 98)], 'nose_tip': [(72, 103), (75, 104), (78, 105), (82, 104), (86, 103)], 'left_eye': [(56, 79), (60, 77), (65, 78), (68, 81), (64, 81), (59, 81)], 'right_eye': [(90, 81), (93, 78), (98, 78), (102, 80), (99, 82), (94, 82)], 'top_lip': [(65, 118), (70, 114), (75, 111), (79, 113), (83, 111), (88, 114), (93, 118), (90, 118), (83, 117), (79, 117), (75, 117), (67, 118)], 'bottom_lip': [(93, 118), (88, 122), (83, 123), (79, 124), (75, 123), (70, 122), (65, 118), (67, 118), (75, 117), (79, 117), (83, 117), (90, 118)]}]
[array([-0.13765951,  0.03760581,  0.145117  , -0.00829832, -0.11039864,
       -0.05421684, -0.05774385, -0.15187201,  0.07200744, -0.10792518,
        0.27860925, -0.05301841, -0.19804782, -0.12756559, -0.09027724,
        0.1932517 , -0.13734289, -0.10697403, -0.01396474,  0.01982459,
        0.12554413, -0.07034517,  0.02700694, -0.01697452, -0.06521222,
       -0.32967243, -0.09668359, -0.06473506,  0.00419827, -0.04448731,
       -0.06400812,  0.04131863, -0.21351409, -0.0821133 , -0.02949731,
        0.02036607, -0.01306324, -0.0764633 ,  0.12072346, -0.05360899,
       -0.21880138, -0.0066165 ,  0.04051827,  0.17596784,  0.14921831,
```

### 人脸比较（一对一）

```python
# 导入人脸识别
import face_recognition
# 已知人脸图片
image = face_recognition.load_image_file("kujin.jpg")
# 再来一张需要检查的图片
image2 = face_recognition.load_image_file("kujin2.jpg")
# 人脸编码可以相互比较，以查看人脸是否匹配。
# 注： 查找人脸的编码有点慢，因此，如果以后需要重新参考，则可能需要将每个图像的结果保存在数据库或缓存中。
# 通过人脸编码进行比较,就这么简单！！！
known_face_encodings=face_recognition.face_encodings(image)[0]
a_single_unknown_face_encoding=face_recognition.face_encodings(image2)[0]
# print(known_face_encodings)
# print(a_single_unknown_face_encoding)
# 默认差异0.6 性能最佳
result=face_recognition.compare_faces([known_face_encodings],a_single_unknown_face_encoding)
print("两张人脸图片是否为同一人：",result)

result=face_recognition.face_distance([known_face_encodings],a_single_unknown_face_encoding)
print("两张人脸的差异度：",result)
```

两张人脸图片是否为同一人： [True]
两张人脸的差异度： [0.28447174]

### 多个人脸识别

```python
# ①使用pillow库

# 使用pillow库
import face_recognition
from PIL import Image, ImageDraw,ImageFont

# 加载第二个示例图片并学习如何识别它。
first_image = face_recognition.load_image_file("img.png")
first_face_encoding = face_recognition.face_encodings(first_image)[0]

second_image = face_recognition.load_image_file("img_6.png")
second_face_encoding = face_recognition.face_encodings(second_image)[0]

# Create arrays of known face encodings and their names
known_face_encodings = [
    first_face_encoding,
    second_face_encoding
]
known_face_names = [
    "安倍(22.7.8)",
    "蔡英文"
]

# Load an image with an unknown face
unknown_image = face_recognition.load_image_file("img_5.png")

# Find all the faces and face encodings in the unknown image
unknown_face_locations = face_recognition.face_locations(unknown_image)
unknown_face_encodings = face_recognition.face_encodings(unknown_image, unknown_face_locations)
pil_image = Image.fromarray(unknown_image)
# Create a Pillow ImageDraw Draw instance to draw with
draw = ImageDraw.Draw(pil_image)

# Loop through each face found in the unknown image
for (top, right, bottom, left), unknown_face_encoding in zip(unknown_face_locations, unknown_face_encodings):
    # See if the face is a match for the known face(s)
    matches = face_recognition.compare_faces(known_face_encodings, unknown_face_encoding, tolerance=0.5)
    name = "Unknown"
    # If a match was found in known_face_encodings, just use the first one.
    if True in matches:
        first_match_index = matches.index(True)
        name = known_face_names[first_match_index]
        # name=name.decode("latin1")
        print(name)

    # Draw a box around the face using the Pillow module
    draw.rectangle(((left, top), (right, bottom)), outline=(0, 0, 255))

    # 中文字体 大小
    ft=ImageFont.truetype("simsun.ttc", 20)

    # Draw a label with a name below the face
    text_width, text_height = draw.textsize(name,font=ft)
    draw.rectangle(((left, bottom-text_height-10), (right, bottom)), fill=(0, 0, 255), outline=(0, 0, 255))
    draw.text((left+6, bottom-text_height-3), name, fill=(255, 255, 255, 255),font=ft)

# Remove the drawing library from memory as per the Pillow docs
del draw
# Display the resulting image
pil_image.show()
```

![image-20220708175340336](C:\Users\user\OneDrive\随心记\Python学习\图像识别\image-20220708175340336.png)