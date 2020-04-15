import 'package:flutter/material.dart';
import 'package:flutter20_shop/model/detail.dart';
import 'package:flutter20_shop/service/service_method.dart';
import 'dart:convert';
import 'package:flutter20_shop/config/service_url.dart';

class DetailInfoProvide with ChangeNotifier {
  DetailModel goodsInfo;

  bool isLeft = true;
  bool isRight = false;

  changeLeftOrRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  // 从后台获取
  getGoodsInfo(String id) async {
    var formData = {"goodId": id};
    print("后端数据$formData");
    await requestPost(servicePath['getGoodDetailById'], data: formData).then((val) {
      print("数据--------");
      print(val);
      var responseData = jsonDecode(val.toString());
      goodsInfo = DetailModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
