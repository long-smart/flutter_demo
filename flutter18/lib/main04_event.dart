import 'package:flutter/gestures.dart';
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
        body: _GestureRecognizerTestRoute(),
      ),
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  __GestureRecognizerTestRouteState createState() =>
      __GestureRecognizerTestRouteState();
}

class __GestureRecognizerTestRouteState
    extends State<_GestureRecognizerTestRoute> {
  bool _toggle = false;
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '你好世界'),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                color: _toggle ? Colors.blue : Colors.pink,
                fontSize: 30,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            TextSpan(text: '你好世界'),
          ],
        ),
      ),
    );
  }
}
