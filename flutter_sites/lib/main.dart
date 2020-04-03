import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
  title: 'flutter企业站实战',
  theme: themeData,
  // 路由
  routes: <String, WidgetBuilder> {
    "app": (BuildContext context) => App(),
    "conpany_info": (BuildContext context) => WebviewScaffold(
      url: "https://www.baidu.com",
      appBar: AppBar(
        title: Text('公司介绍'),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('app');
          },
        ),
      ),
    )
  },
  home: LoadingPage(),
));

final ThemeData themeData = ThemeData(
  primaryColor: Colors.redAccent
);