import 'package:flutter/material.dart';
// import './expansionTile.dart';
import './expansionPanleList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my long app',
      home: ExpansionPanelListDemo(),
    );
  }
}