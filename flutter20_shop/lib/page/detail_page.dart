import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/detail_info.dart';
import 'detail_page/detail_top.dart';
import 'detail_page/detail_explain.dart';
import 'detail_page/detail_tabBar.dart';
import 'detail_page/detail_web.dart';
import 'detail_page/detail_bottom.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('商品详细页'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      DetailTop(),
                      DetailExplain(),
                      DetailTabBar(),
                      DetailWeb(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: DetailBottom(),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    print('数据id=====' + goodsId);
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodsId);
    return '数据完成';
  }
}
