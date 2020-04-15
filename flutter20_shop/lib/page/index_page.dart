import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter20_shop/page/home_page.dart';
import 'package:flutter20_shop/page/category_page.dart';
import 'package:flutter20_shop/page/cart_page.dart';
import 'package:flutter20_shop/page/meber_page.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter20_shop/provide/currentPageIndex.dart';
import 'package:provide/provide.dart';

class IndexPage extends StatelessWidget {
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
    MeberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (int index) {
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: pageList,
          ),
        );
      },
    );
  }
}