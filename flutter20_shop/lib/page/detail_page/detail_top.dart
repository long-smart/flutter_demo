import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/detail_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, val) {
        var goodsInfo = Provide.value<DetailInfoProvide>(context).goodsInfo?.data?.goodInfo;
        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodsNum(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // 详细页商品图片
  Widget _goodsImage(String url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _goodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  // 商品编号
  Widget _goodsNum(number) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号: $number',
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(double price, double oldPrice) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Text(
            '￥$price',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(32),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '￥$oldPrice',
            style: TextStyle(color: Colors.black38, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
