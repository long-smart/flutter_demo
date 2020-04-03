import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime _lastPressedAt; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '拦截返回',
      home: Scaffold(
        appBar: AppBar(
          title: Text('拦截返回'),
        ),
        body: WillPopScope(
          child: Container(
            child: Text('1秒内连续按两次返回键退出'),
            alignment: Alignment.center,
          ),
          onWillPop: () async {
            if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
        ),
      ),
    );
  }
}
