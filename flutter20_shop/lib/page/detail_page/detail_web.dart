import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/detail_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;

    return Provide<DetailInfoProvide>(
      builder: (context, child, val) {
        var isLeft = Provide.value<DetailInfoProvide>(context).isLeft;
        if (isLeft) {
          return Container(
            child: Html(
              data: goodsDetail,
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text('暂时没有数据'),
          );
        }
      },
    );
  }
}
