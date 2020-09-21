```java
package com.example.springboot_convert;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 类：日期类型转换器
 Converter<输入类型, 转换类型>
 * 编写人：kujin
 * 创建时间：2020/9/6
 * 修改时间：2020/9/6
 */
@Component
public class DataConvert implements Converter<String, Date> {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
    @Override
    public Date convert(String s) {
        if (s!=null && !"".equals(s)){
            try {
                return simpleDateFormat.parse(s);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
```