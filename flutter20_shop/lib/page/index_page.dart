import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter20_shop/page/home_page.dart';
import 'package:flutter20_shop/page/category_page.dart';
import 'package:flutter20_shop/page/cart_page.dart';
import 'package:flutter20_shop/page/meber_page.dart';
import 'package:flutter_screenutil/screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    )
  ];

  final List<Widget> pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MeberPage()
  ];

  int _currentIndex = 0;
  Widget _currentPage;

  @override
  void initState() {
    // TODO: implement initState
    _currentPage = pageList[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _currentPage = pageList[index];
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
    );
  }
}