import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dialog',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _withTree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dialog')),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              openDiaLog();
            },
            child: Text('打开Dialog'),
          ),
          RaisedButton(
            onPressed: () async {
              int type = await _showModalBottom();
              print(type);
            },
            child: Text('显示底部菜单列表'),
          ),
        ],
      ),
    );
  }



  Future<int> _showModalBottom() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
              onTap: () {
                Navigator.of(context).pop(index);
              },
            );
          },
          itemCount: 30,
        );
      },
    );
  }

  Future openDiaLog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('您确认要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('删除子目录'),
                    Checkbox(
                      value: _withTree,
                      onChanged: (val) {
                        // 此时context为对话框UI的根Element，我们
                        // 直接将对话框UI对应的Element标记为dirty
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('取消'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('确认'),
              ),
            ],
          );
        });
  }
}
