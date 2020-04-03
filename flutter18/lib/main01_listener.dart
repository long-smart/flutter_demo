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
        body: Event(),
      ),
    );
  }
}

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Listener(
            child: Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              // color: Colors.pinkAccent,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blueAccent, Colors.purple, Colors.pinkAccent]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _event?.toString() ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPointerDown: (PointerDownEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerMove: (PointerMoveEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (PointerUpEvent event) {
              setState(() {
                _event = event;
              });
            },
          )
        ],
      ),
    );
  }
}
