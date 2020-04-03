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
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text(
                  'RaisedButton',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlue,
              ),
              FlatButton(
                onPressed: () {},
                child: Text('FlatButton'),
                color: Colors.amberAccent,
                // textColor: Colors.red, // 文字颜色
                // disabledColor: Colors.grey, // 禁用时的样式
                // disabledTextColor: Colors.white, // 禁用时的文本样式
                // highlightColor: Colors.deepPurple, // 按下时高亮颜色
                // splashColor: Colors.lightBlue, // 按下时的水波纹颜色
                colorBrightness: Brightness.dark, // 按钮主题
                padding: EdgeInsets.all(20), // 内边距
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('OutLineButton'),
                color: Colors.pinkAccent, // 设置颜色不管用
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  '文本1',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purpleAccent,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  '文本2',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pinkAccent,
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {},
              ),
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
