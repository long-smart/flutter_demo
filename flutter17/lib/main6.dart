import 'package:flutter/material.dart';
import './iconfont.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/* 
  表单组件
*/
class _MyAppState extends State<MyApp> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
    return MaterialApp(
      title: "表单练习",
      home: Scaffold(
        appBar: AppBar(
          title: Text('表单练习'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                prefixIcon: Icon(MyIcon.arrow_right),
                labelText: 'input1',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            TextField(
              autofocus: false,
              focusNode: focusNode2,
              decoration: InputDecoration(
                prefixIcon: Icon(MyIcon.edit),
                labelText: 'input2',
              ),
            ),
            RaisedButton(
              onPressed: () {
                // 第一种
                FocusScope.of(context).requestFocus(focusNode2);
              },
              child: Text('移动焦点'),
            ),
            RaisedButton(
              onPressed: () {
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
              child: Text('影藏键盘'),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                hintColor: Colors.pinkAccent, //定义下划线颜色
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.red), //定义label字体样式
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 22.0,
                  ), //定义提示文本样式
                ),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "密码",
                      hintText: "您的登录密码",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
