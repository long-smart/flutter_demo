import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

/*
  尺寸限制类容器
  AspectRatio，它可以指定子组件的长宽比、
  LimitedBox 用于指定最大宽高、
  FractionallySizedBox 可以根据父容器宽高的百分比来设置子组件宽高
  Decration组件
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基本组件练习',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('尺寸限制类容器'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight, // 相对于坐标原点的对齐方式
                  transform: Matrix4.skewY(0.4), // 沿着y轴倾斜0.4弧度
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.orange,
                    child: Text('文本'),
                  ),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Transform.translate(
                offset: Offset(20, 20),
                child: Text('hello world'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Text('hello world'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Transform.scale(
                  scale: 2.5,
                  child: Text('hello world scale'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text(
                  "你好",
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                )
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
