import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: '换肤',
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框Widget'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("确认删除");
                }
              },
              child: Text('打开Dialog'),
            ),
            FlatButton(
              onPressed: () {
                changeLanguage(context);
              },
              child: Text('打开选择语言'),
            ),
            OutlineButton(
              onPressed: () {
                showListDiaLog(context);
              },
              child: Text('打开列表选择'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('确定要删除吗'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text('英文'),
              ),
            )
          ],
        );
      },
    );

    if (i != null) {
      print("选择了： ${i == 1 ? "中文" : "英文"}");
    }
  }

  Future<void> showListDiaLog(BuildContext context) async {
    int index = await showDialog(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(
              title: Text('请选择'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );
        return Dialog(child: child);
        // return UnconstrainedBox(
        //   constrainedAxis: Axis.vertical,
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(maxWidth: 280),
        //     child: Material(
        //       child: child,
        //       type: MaterialType.card,
        //     ),
        //   ),
        // );
      },
    );
    if (index != null) {
      print("点击了$index");
    }
  }
}
