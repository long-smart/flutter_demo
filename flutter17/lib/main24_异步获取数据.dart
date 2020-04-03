import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: '换肤',
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步更新界面')
      ),
      body: Center(
        child: StreamBuilder(
          stream: counter(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据');
              case ConnectionState.active:
                return Text('激活${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
              default:
            }
            return null;
          },
        ),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
/* class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步更新界面')
      ),
      body: Center(
        child: FutureBuilder(
          future: mockNetData(),
          initialData: "123",
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              }else {
                return Text('content ${snapshot.data}');
                
              }
            }else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockNetData() async {
    return Future.delayed(Duration(seconds: 2), () => "接口返回的数据");
  }
} */
