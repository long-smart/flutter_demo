const fs = require('fs')
const path = require('path')

/**
 *  从 Iconfont.cn下载图表后将所有文件放在 /assets/fonts下，执行 node iconfont.js
 *  读取 assets/iconfont.css, 解析内容, 生成 /lib/iconfont.dart
 */

const IconfontCss = path.resolve(__dirname, 'assets/fonts/iconfont.css')
const fontName = 'iconfont'
const dartPath = path.resolve(__dirname, 'lib/iconfont.dart')

let data = fs.readFileSync(IconfontCss).toString()

while (data.includes('\n  content')) {
    data = data.replace('\n  content', 'content')
}

// .*? 表示非贪婪搜索
const reg = /\.icon-(.*?):.*\\(.*)";/

let result = []
data.split('\n').forEach(row => {
    let r = reg.exec(row)
    if (r) {
        result.push({
            name: r[1].replace('-', '_'),
            value: r[2]
        })
    }
})


let dartFile = `
import 'package:flutter/cupertino.dart';

class MyIcon {
--
}
`
let code = [], string = ''
result.forEach(item => {
    code.push(`  static const IconData ${item.name} = const IconData(0x${item.value}, fontFamily: '${fontName}');`)
})

string = code.join('\n')

dartFile = dartFile.replace('--', string)

fs.writeFileSync(dartPath, dartFile)
