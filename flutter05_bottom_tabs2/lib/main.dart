import 'package:flutter/material.dart';
import './bottomAppBarDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: BottomAppBarDemo(),
    );
  }
}
