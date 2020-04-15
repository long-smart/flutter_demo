import 'package:flutter/material.dart';
import 'package:flutter20_shop/model/categoryGoodsList.dart';


class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];

  // 点击分类时，切换商品列表
  void getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }

  void getMoreList(List<CategoryListData> list) {
    goodsList.addAll(list);
    notifyListeners();
  }
}