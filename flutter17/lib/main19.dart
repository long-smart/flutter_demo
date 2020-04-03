import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('监听滚动'),
        ),
        body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('$index'),
                    );
                  },
                  itemCount: 100,
                  itemExtent: 50,
                ),
                CircleAvatar(
                  radius: 30.0,
                  child: Text(_progress),
                  backgroundColor: Colors.black54,
                )
              ],
            ),
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}";
              });
              print("BottomEdge: ${notification.metrics.extentAfter == 0}");
              /*
                  pixels：当前滚动位置。
                  maxScrollExtent：最大可滚动长度。
                  extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
                  extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
                  extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
                  atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）
               */
              return true; // 放开此行注释后，进度条将失效
            },
          ),
        ),
      ),
    );
  }
}
