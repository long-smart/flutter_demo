import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/* 
  ListView
*/
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const loadingText = "##loading##"; // loading标记
  List<String> words = [loadingText];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '基本组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            // 如果列表到达末尾
            if (words[index] == loadingText) {
              if (words.length - 1 < 100) {
                pushData();
                return Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                );
              } else {
                // 已经加载100
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    '没有更多了',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            }
            return ListTile(title: Text(words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
          itemCount: words.length,
        ),
      ),
    );
  }

  void pushData() {
    List<String> data = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20"
        .split(",")
        .map((val) => val)
        .toList();

    Future.delayed(Duration(seconds: 2)).then((e) {
      words.insertAll(words.length - 1, data);
      setState(() {
      
      });
    });
  }
}

/*
  可滚动组件练习 SingleChildScrollView
*/
/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return MaterialApp(
      title: '基本组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('基本组件文件'),
        ),
        body: Scrollbar( // 显示一个滚动条
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: str
                    .split('')
                    .map((text) => Text(text, textScaleFactor: 2))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
} */
