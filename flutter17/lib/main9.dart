import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
  圆形进度条动画
*/
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    _controller.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '圆形进度条',
      home: Scaffold(
        appBar: AppBar(title: Text('圆形进度条')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                    .animate(_controller),
                value: _controller.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}
