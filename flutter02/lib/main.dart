import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoutePage(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        "baseWidget": (context) => BaseWidget()
      },
      // items: new List<String>.generate(1000, (i) => "Item $i")
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('打开新页面'),
              textColor: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('new_page', arguments: 123);
              },
            ),
            FlatButton(
              child: Text(('打开基本widget练习')),
              textColor: Colors.cyan,
              onPressed: () {
                Navigator.of(context).pushNamed('baseWidget');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);

    return new Scaffold(
      appBar: AppBar(title: Text('新的Route页面')),
      body: Center(
        child: Text('center 123long'),
      ),
    );
  }
}

class BaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网格列表'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0, // 每个网格的间距
        crossAxisCount: 2, // 一行的网格数
        children: <Widget>[
          const Text('I am Jspang'),
          const Text('I love Web'),
          const Text('jspang.com'),
          const Text('我喜欢玩游戏'),
          const Text('我喜欢看书'),
          const Text('我喜欢吃火锅')
        ],
      ),
    );
  }
}

// class BaseWidget extends StatelessWidget {
//   BaseWidget({Key key, @required this.items}) : super(key: key);

//   final List<String> items;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('动态listview'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('${items[index]}'),
//           );
//         },
//       ),
//     );
//   }
// }

// ListView
// class BaseWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text('基本组件'),
//         actions: <Widget>[Text('右上角')],
//       ),
//       body: Center(
//         child: Container(
//           child: ListView(
//             children: <Widget>[
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.deepOrange,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.purpleAccent,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.pinkAccent,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.black87,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.blueAccent,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.greenAccent,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.yellowAccent,
//               ),
//               Container(
//                 height: 180,
//                 width: 100,
//                 color: Colors.cyanAccent,
//               ),
//             ],
//             scrollDirection: Axis.horizontal,
//           ),
//           height: 200,
//         ),
//       ),
//     );
//   }
// }

// class BaseWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(title: Text('图片')),
//       body: Container(
//         child: Image.network(
//           'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3453980867,1439841269&fm=26&gp=0.jpg',
//           width: 200,
//         ),

//         color: Colors.deepOrange,
//       ),
//     );
//   }
// }

// Text和 Container
// class BaseWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text('基本Widget'),
//       ),
//       body: Container(
//         child: Text(
//           '文本',
//           textAlign: TextAlign.left,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(
//             fontSize: 25.0,
//             color: Colors.pinkAccent,
//             decoration: TextDecoration.underline, // 下划线
//             decorationStyle: TextDecorationStyle.solid // 下换线的类型(实现)
//           ),
//         ),
//         width:  400,
//         height: 200,
//         /**
//          *  bottomCenter:下部居中对齐。
//          *  botomLeft: 下部左对齐。
//          *  center：纵横双向居中对齐。
//          *  bottomRight：下部右对齐。
//          *  centerLeft：纵向居中横向居左对齐。
//          *  centerRight：纵向居中横向居右对齐。
//          *  topLeft：顶部左侧对齐。
//          *  topCenter：顶部居中对齐。
//          *  topRight： 顶部居左对齐。
//          */
//         alignment: Alignment.topLeft,
//         padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//         margin: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(colors: [Colors.pinkAccent, Colors.purple]), // 渐变
//           border: Border.all(width: 1, color: Colors.lightBlueAccent), // 边框
//         ),
//       ),
//     );
//   }
// }
