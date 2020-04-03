import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiaLog',
      home: Scaffold(appBar: AppBar(title: Text('dialog')), body: Loading()),
    );
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            showLoading();
          },
          child: Text('打开loading'),
        )
      ],
    );
  }

  showLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return UnconstrainedBox( // 要改变loading的大小需要先屏蔽父级的设置
          child: SizedBox(
            width: 350,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('正在加载。。。'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
