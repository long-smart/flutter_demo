import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cart.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  List<CartModel> cartList = []; // 购物车列表
  double allPrice = 0; // 购物车总价格
  int allCartCount = 0; // 购物车商品总数
  bool allSelete = true;

  // 添加到购物车
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    var temp = cartString == null ? [] : jsonDecode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int index = 0;
    allPrice = 0;
    allCartCount = 0;

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[index]['count'] = item['count'] + 1;
        cartList[index].count++;
        isHave = true;
      }

      if (item['isCheck']) {
        allPrice += (cartList[index].price * cartList[index].count);
        allCartCount += cartList[index].count;
      }
      index++;
    });

    if (!isHave) {
      Map<String, dynamic> newGoods = {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images,
        'isCheck': true,
      };
      tempList.add(newGoods);
      cartList.add(CartModel.fromJson(newGoods));

      allPrice += count * price;
      allCartCount += count;
    }

    cartString = jsonEncode(tempList).toString();
    print("购物车数据==========$cartString");
    prefs.setString("cartInfo", cartString);
    notifyListeners();
  }

  // 清空购物车
  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cartInfo");
    cartList = [];
    print('清空购物车完成================');
    notifyListeners();
  }

  // 获取购物车数据
  getCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> temp = (jsonDecode(cartString.toString()) as List).cast();
      allPrice = 0;
      allCartCount = 0;
      allSelete = true;
      temp.forEach((item) {
        if (item['isCheck']) {
          allPrice += item['count'] * item['price'];
          allCartCount += item['count'];
        } else {
          allSelete = false;
        }
        cartList.add(CartModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  // 购物车 -1操作
  goodsDecrease(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();

    int index = 0;
    int delIndex;

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = index;
      }
      index++;
    });
    if (delIndex != null) {
      tempList[delIndex]['count'] = tempList[delIndex]['count'] - 1;
    }
    cartString = jsonEncode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCard();
  }

  // 购物车 -1操作
  goodsadd(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();

    int index = 0;
    int delIndex;

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = index;
      }
      index++;
    });
    if (delIndex != null) {
      tempList[delIndex]['count'] = tempList[delIndex]['count'] + 1;
    }
    cartString = jsonEncode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCard();
  }

  // 删除单个购物车
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();
    int index = 0;
    int delIndex;

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = index;
      }
      index++;
    });

    tempList.removeAt(delIndex);
    cartString = jsonEncode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCard();
  }

  // 改变选中按钮
  cartCheckToggle(CartModel cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();

    int index = 0;
    int delIndex;

    tempList.forEach((item) {
      if (item['goodsId'] == cart.goodsId) {
        delIndex = index;
      }
      index++;
    });
    if (delIndex != null) {
      tempList[delIndex] = cart.toJson();
    }
    cartString = jsonEncode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCard();
  }

  // 全选按钮
  cartAllSelete(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo");
    List<Map> tempList = (jsonDecode(cartString.toString()) as List).cast();

    tempList.forEach((item) {
      item['isCheck'] = isCheck;
    });
    
    cartString = jsonEncode(tempList).toString();
    prefs.setString("cartInfo", cartString);
    await getCard();
  }
}
