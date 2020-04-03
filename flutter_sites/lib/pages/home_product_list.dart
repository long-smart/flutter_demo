import 'package:flutter/material.dart';
import 'package:flutter_sites/model/product.dart';
import 'package:flutter_sites/pages/product_detail.dart';
import 'package:flutter_sites/utils/utils.dart';
import './home_product_list.dart';

class HomeProductList extends StatelessWidget {
  final ProductListModal list;

  HomeProductList(this.list);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      child: _build(context, deviceWidth),
    );
  }

  Widget _build(BuildContext context, deviceWidth) {
    double itemWidth = deviceWidth * 168.5 / 360;
    double imgWidth = deviceWidth * 110.0 / 360;

    Color bgColor = string2Color('#f8f8f8');
    Color titleColor = string2Color('#db5d41');
    Color subTitle = string2Color('#999999');

    List<Widget> listWidget = list.data.map((i) {
      return GestureDetector(
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10, left: 13, bottom: 7),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
              Text(
                i.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: subTitle),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5),
                child: Image.network(
                  i.imageUrl,
                  width: imgWidth,
                  height: imgWidth,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetail(items: i)),
          );
        },
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(
            '最新产品',
            style:
                TextStyle(fontSize: 16.0, color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidget,
        )
      ],
    );
  }
}
