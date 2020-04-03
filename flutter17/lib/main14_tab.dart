import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
  页面抽屉，tab栏练习
*/
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int index = 0;
  TabController _tabController;
  List<String> tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '组件练习',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: index,
          fixedColor: Colors.red,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '抽屉1',
              textScaleFactor: 2,
            ),
            Text(
              '抽屉2',
              textScaleFactor: 2,
            ),
            Text(
              '抽屉3',
              textScaleFactor: 2,
            ),
            Text(
              '抽屉3',
              textScaleFactor: 2,
            ),
          ],
        ),
      ),
    );
  }
}
