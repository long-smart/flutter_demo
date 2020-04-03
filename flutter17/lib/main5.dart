import 'package:flutter/material.dart';
import './iconfont.dart';

void main() => runApp(MyApp());

/*
  表单 相关组件练习
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
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // 是否显示为密码框
            ),
          ],
        ),
      ),
    );
  }
}
