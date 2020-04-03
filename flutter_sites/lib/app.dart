import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_us_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    ProductPage(),
    NewsPage(),
    AboutUsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter企业站'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text('产品'),
            icon: Icon(Icons.apps)
          ),
          BottomNavigationBarItem(
            title: Text('新闻'),
            icon: Icon(Icons.fiber_new)
          ),
          BottomNavigationBarItem(
            title: Text('关于我们'),
            icon: Icon(Icons.insert_comment)
          )
        ],
      ),
    );
  }

}
