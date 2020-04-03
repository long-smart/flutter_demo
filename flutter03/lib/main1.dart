import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myApp',
      home: Scaffold(
        appBar: AppBar(title: Text('Row widget')),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('I am JSPang'),
            ),
            Expanded(
              child: Center(
                child: Text('my website is jspang.com'),
              ),
            ),
            Text('I love coding1')
          ],
          // crossAxisAlignment: CrossAxisAlignment.center, // 辅轴
          // mainAxisAlignment: MainAxisAlignment.start, // 主轴
        ),
      ),
    );
  }
}

// 灵活横向布局
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'myApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Row widget')),
//         body: Row(
//           children: <Widget>[
//             RaisedButton(
//               child: Text('红色按钮'),
//               color: Colors.redAccent,
//               onPressed: () {},
//             ),
//             Expanded(
//               child: RaisedButton(
//                 child: Text('黄色按钮'),
//                 color: Colors.yellowAccent,
//                 onPressed: () {},
//               ),
//             ),
//             RaisedButton(
//               child: Text('粉色按钮'),
//               color: Colors.pinkAccent,
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'myApp',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Row widget')),
//         body: Row(
//           children: <Widget>[
//             new RaisedButton(
//               onPressed: () {},
//               color: Colors.redAccent,
//               child: new Text('红色按钮'),
//             ),
//             new RaisedButton(
//               onPressed: () {},
//               color: Colors.orangeAccent,
//               child: new Text('黄色按钮'),
//             ),
//             new RaisedButton(
//               onPressed: () {},
//               color: Colors.pinkAccent,
//               child: new Text('粉色按钮'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
