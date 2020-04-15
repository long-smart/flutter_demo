import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter20_shop/page/detail_page.dart'; //详情页面

Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String goodsId = params['id'].first;
    print('goodsId $goodsId');
    return DetailPage(goodsId);
  }
);
