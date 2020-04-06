import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sliver',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sliver'),
        ),
        body: SliverDemo(),
      ),
    );
  }
}

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverGirdDemo(),
          ),
        )
      ],
    );
  }
}

class SliverGirdDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Container(
              color: Colors.lightGreen[200],
              child: Text(
                '$index',
                style: TextStyle(color: Colors.black26),
              ),
              alignment: Alignment(0.0, 0.0),
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}
