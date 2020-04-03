import 'package:flutter/material.dart';
import './iconfont.dart';

void main() => runApp(MyApp());

/*
  Iconfont和 switch checkbox 相关组件练习
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
            Text('as大声地'),
            Icon(
              MyIcon.edit,
              color: Colors.red,
              size: 40,
            ),
            Switch(
              value: false,
              onChanged: (val) {
                print(val);
              },
            ),
            Checkbox(
              value: true,
              onChanged: (val) {
                print(val);
              },
            )
          ],
        ),
      ),
    );
  }
}
