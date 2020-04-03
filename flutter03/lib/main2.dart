import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "北京市昌平区啥河镇",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('李智龙'),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("北京市昌平区啥河镇"),
            subtitle: Text('李智龙'),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("北京市昌平区啥河镇"),
            subtitle: Text('李智龙'),
            leading: Icon(
              Icons.account_box,
              color: Colors.lightBlue,
            ),
          ),
          Divider(),
        ],
      ),
    );

    return MaterialApp(
      title: 'ListView widget',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('卡片布局'),
        ),
        body: Center(child: card),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               'http://jspang.com/static//myimg/blogtouxiang.jpg'),
//           radius: 100.0,
//         ),
//         new Positioned(
//           top: 10.0,
//           left: 10.0,
//           child: new Text('JSPang.com'),
//         ),
//         new Positioned(
//           bottom: 10.0,
//           right: 20.0,
//           child: new Text('技术胖'),
//         )
//       ],
//     );

//     return MaterialApp(
//       title: 'ListView widget',
//       home: Scaffold(
//         appBar: new AppBar(
//           title: new Text('层叠布局'),
//         ),
//         body: Center(child: stack),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var stack = new Stack(
//       alignment: const FractionalOffset(0.5, 0.8),
//       children: <Widget>[
//         new CircleAvatar(
//           backgroundImage: new NetworkImage(
//               'http://jspang.com/static//myimg/blogtouxiang.jpg'),
//           radius: 100.0,
//         ),
//         new Container(
//           decoration: new BoxDecoration(
//             color: Colors.lightBlue,
//           ),
//           padding: EdgeInsets.all(5.0),
//           child: new Text('JSPang 技术胖'),
//         )
//       ],
//     );

//     return MaterialApp(
//       title: 'myApp',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Stack'),
//         ),
//         body: Center(
//           child: stack,
//         ),
//       ),
//     );
//   }
// }
