import 'package:flutter/material.dart';

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
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return MaterialApp(
      title: '基本组件练习',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('尺寸限制类容器'),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                // 这里单独使用SizeBox不会生效， 因为父级做了限制,需要套一层UnconstrainedBox
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.lightGreen),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            ConstrainedBox(
              // 用于给盒子限制宽高
              constraints: BoxConstraints(
                minHeight: 50.0,
                minWidth: double.infinity,
              ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: redBox,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60, minWidth: 90), // 父级
              child: UnconstrainedBox(
                // 屏蔽父级的宽高约束
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: 20, minWidth: 50), // 子级
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 50),
              child: DecoratedBox(
                // 装饰器盒子
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.pinkAccent],
                  ), // 背景线性渐变
                  borderRadius: BorderRadius.circular(20.0), // 圆角
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(10.0, 5.0),
                      blurRadius: 20.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
