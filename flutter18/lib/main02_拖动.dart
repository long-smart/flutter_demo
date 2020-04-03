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
        body: Drag(),
      ),
    );
  }
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double top = 0.0;
  double left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text('Drag'),
            ),
            // onPanDown: (DragDownDetails e) {
            //   //打印手指按下的位置(相对于屏幕)
            //   print("用户手指按下：${e.globalPosition}");
            // },
            // onPanUpdate: (DragUpdateDetails e) {
            //   //用户手指滑动时，更新偏移，重新构建
            //   setState(() {
            //     left += e.delta.dx;
            //     top += e.delta.dy;
            //   });
            // },
            // onPanEnd: (DragEndDetails e) {
            //   //打印滑动结束时在x、y轴上的速度
            //   print(e.velocity);
            // },
            onVerticalDragUpdate: (DragUpdateDetails e) {
              setState(() {
                top += e.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.center,
          color: Colors.lightGreen,
          child: Text(
            '$_operation',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText('tab'),
        onDoubleTap: () => updateText('DoubleTap'),
        onLongPress: () => updateText('longPress'),
      ),
    );
  }

  void updateText(text) {
    setState(() {
      _operation = text;
    });
  }
}
