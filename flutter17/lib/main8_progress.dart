import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
  进度条指示器
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基本组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('进度条'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 4,
                value: .5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
