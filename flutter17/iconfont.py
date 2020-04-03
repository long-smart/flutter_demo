#-*- coding:utf-8 -*-
import re
import os

# 根据 Iconton.cn下载的图标文件自动生成 /lib/util/iconfont.dart文件
iconCss = "./assets/fonts/iconfont.css"
iconName = 'iconfont'
path = './lib/util/'
dartPath = './lib/util/iconfont.dart'

fileStr = """import 'package:flutter/cupertino.dart';

// 文件由iconfont.py自动生成

class MyIcon {
--
}
"""


def main():
    with open(iconCss) as f:
        str = f.read()
        str = str.replace("\n  content", "content")
        
        result = []
        code = []
        for row in str.split('\n'):
            m = re.match(r'.icon-(.*?):.*\\(.*)";', row)
            if m != None:
                name, val = m.group(1).replace("-", "_"), m.group(2)
                result.append((name, val))
        
        for (name, val) in result:
            str = "  static const IconData %s = const IconData(0x%s, fontFamily: '%s');" %(name, val, iconName)
            code.append(str)

        if not os.path.exists(path):
            os.makedirs(path)
        with open(dartPath, "w+") as fs:
            fileContent = fileStr.replace("--", "\n".join(code))
            fs.write(fileContent)
    
if __name__ == '__main__':
    main()
