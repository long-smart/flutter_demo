import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
  Text 相关组件练习
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基本组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('基本组件文件'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              '文本组件',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.yellowAccent,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted,
                height: 2,
              ),
              textScaleFactor: 2,
            ),
            Text.rich(
              TextSpan(
                text: 'https:',
                style: TextStyle(color: Colors.blue, fontSize: 22),
                children: [
                  TextSpan(
                    text: 'www.baidu.com',
                    style: TextStyle(color: Colors.redAccent, fontSize: 18),
                  )
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
              ),
              child: Column(
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                      inherit: true, // 2.不继承默认样式
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
