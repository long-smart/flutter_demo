import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '事件处理',
      home: Scaffold(
        appBar: AppBar(
          title: Text('事件处理'),
        ),
        body: AnimatedSwitcherCounterRoute(),
      ),
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Text(
              '$count',
              // 显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(count),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          RaisedButton(
            child: Text('+1'),
            onPressed: () {
              setState(() {
                count += 1;
              });
            },
          )
        ],
      ),
    );
  }
}
