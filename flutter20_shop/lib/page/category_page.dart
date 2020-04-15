import 'package:flutter/material.dart';
import 'package:flutter20_shop/service/service_method.dart';
import 'package:flutter20_shop/config/service_url.dart';
import 'package:flutter20_shop/model/category.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/child_category.dart';
import 'package:flutter20_shop/model/categoryGoodsList.dart';
import 'package:flutter20_shop/provide/category_goods_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 分类页面
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 左侧分类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Data> list = [];
  int listIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategory();
    _getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkwell(index);
        },
      ),
    );
  }

  Widget _leftInkwell(int index) {
    bool isClick = index == listIndex;
    return InkWell(
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: isClick ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
      onTap: () {
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context).getChildCategory(childList, categoryId);
        _getGoodsList(categoryId: categoryId);
      },
    );
  }

  void _getCategory() async {
    await requestPost(servicePath['getCategory']).then((val) {
      var data = jsonDecode(val);
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provide.value<ChildCategory>(context).getChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
    });
  }

  void _getGoodsList({String categoryId = '4'}) async {
    var data = {
      'categoryId': categoryId,
      'categorySubId': '',
      'page': '1',
    };

    requestPost(servicePath['getMallGoods'], data: data).then((val) {
      var data = jsonDecode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      print('分类商品列表-------------------------------');
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.categoryListData);
    });
  }
}

// 右侧头部导航
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12)),
          ),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _rightInkwell(index, childCategory.childCategoryList[index]);
            },
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
          ),
        );
      },
    );
  }

  Widget _rightInkwell(int index, BxMallSubDto item) {
    bool isClick = false;
    isClick = index == Provide.value<ChildCategory>(context).childIndex;
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28), color: isClick ? Colors.pink : Colors.black),
        ),
      ),
      onTap: () {
        _getGoodsList(categorySubId: item.mallSubId);
        Provide.value<ChildCategory>(context).changeChildIndex(index, item.mallSubId);
      },
    );
  }

  void _getGoodsList({String categorySubId = ''}) async {
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': categorySubId,
      'page': '1',
    };
    print(data);
    requestPost(servicePath['getMallGoods'], data: data).then((val) {
      var data = jsonDecode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.categoryListData == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.categoryListData);
      }
    });
  }
}

// 商品列表
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        // try {
        //   if (Provide.value<ChildCategory>(context).page == 1) {
        //     // 列表滚到顶部
        //     scrollController.jumpTo(0.0);
        //   }
        // } catch (e) {
        //   print('错误 =>>>$e');
        // }

        if (data.goodsList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                footer: ClassicalFooter(
                  bgColor: Colors.white,
                  textColor: Colors.pinkAccent,
                  showInfo: false,
                  noMoreText: Provide.value<ChildCategory>(context).noMoreText,
                  loadingText: '加载中',
                  loadReadyText: '上拉加载',
                ),
                child: ListView.builder(
                  itemCount: data.goodsList.length,
                  itemBuilder: (BuildContext context, index) {
                    return _listWidget(data.goodsList, index);
                  },
                  controller: scrollController,
                ),
                onLoad: () async {
                  print('加载中');
                  _getMoreList();
                },
              ),
            ),
          );
        } else {
          return Text('暂无数据');
        }
      },
    );
  }

  void _getMoreList() async {
    Provide.value<ChildCategory>(context).addPage();
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': Provide.value<ChildCategory>(context).page,
    };
    requestPost(servicePath['getMallGoods'], data: data).then((val) {
      var data = jsonDecode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      if (goodsList.categoryListData == null) {
        Fluttertoast.showToast(
          msg: '没有更多了',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Provide.value<ChildCategory>(context).changeNoMoreText('没有更多了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context).getMoreList(goodsList.categoryListData);
      }
    });
  }

  // 商品图片
  Widget _goodsImage(List<CategoryListData> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  // 商品名字
  Widget _goodsName(List<CategoryListData> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(List<CategoryListData> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(370),
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text(
            '价格 ￥${list[index].presentPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }

  Widget _listWidget(List<CategoryListData> list, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            _goodsImage(list, index),
            Column(
              children: <Widget>[
                _goodsName(list, index),
                _goodsPrice(list, index),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
