import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
 Container Widget
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基本组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 80, left: 50),
              constraints: BoxConstraints(minWidth: 200.0, minHeight: 150.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.orange, Colors.purple],
                  center: Alignment.centerLeft,
                  radius: .98,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
              ),
              transform: Matrix4.rotationZ(.2),
              alignment: Alignment.center,
              child: Text(
                'hello Container',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
