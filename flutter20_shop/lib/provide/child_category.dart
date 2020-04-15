import 'package:flutter/material.dart';
import 'package:flutter20_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类高亮索引
  String categoryId = '4'; // 大类别的id
  String subId = ''; // 子类id
  int page = 1; // 列表页页数
  String noMoreText = ''; // 显示没有更多数据的文字

  void getChildCategory(List<BxMallSubDto> list, String id) {
    // 每次更新大类，需要子类别的索引
    childIndex = 0;
    categoryId = id;
    page = 1;
    noMoreText = '';
    BxMallSubDto all = BxMallSubDto(
      mallCategoryId: '00',
      mallSubId: '',
      mallSubName: '全部',
      comments: null,
    );

    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引
  void changeChildIndex(int index, String id) {
    childIndex = index;
    subId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  void addPage() {
    page++;
  }

  void changeNoMoreText(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
