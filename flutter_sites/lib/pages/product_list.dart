import 'package:flutter/material.dart';
import 'package:flutter_sites/model/product.dart';
import 'package:flutter_sites/style/color.dart';
import 'package:flutter_sites/style/font.dart';
import 'package:flutter_sites/pages/product_detail.dart';

class ProductListWidget extends StatelessWidget {
  final ProductListModal list;
  // 获取下一页数据
  final VoidCallback getNextPage;
  ProductListWidget({Key key, this.list, this.getNextPage}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0 ? _loadingWidget(context) : _productListWidget(context);
  }

  Widget _loadingWidget(BuildContext context) {
    return CircularProgressIndicator();
  }

  Widget _productListWidget(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext context, int index) {
        ProductItemModal item = list.data[index];

        if ((index + 4) == list.data.length) {
          // 获取下一页
          getNextPage();
        }

        return GestureDetector(
          child: Container(
            color: ProductColors.bgColor,
            padding: EdgeInsets.only(top: 5, right: 5),
            child: Row(
              children: <Widget>[
                Image.network(item.imageUrl, width: 120, height: 120,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: ProductColors.divideLineColor
                        ),
                      ),
                    ),
                    // 产品信息垂直布局
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5,
                            ),
                            // 产品类型
                            Text(
                              item.type,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ProductColors.typeColor
                              ),
                            ),
                            item.type == null ? SizedBox() : Container(
                              child: Text(
                                '红米',
                                style: TextStyle(color: ProductColors.pointColor),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: ProductColors.pointColor)
                              ),
                            ),
                          ],
                        ),
                        Text(
                          item.name,
                          style: ProductFonts.itemNameStyle
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetail(items: item)),
            );
          },
        );
      },
    );
  }
}
