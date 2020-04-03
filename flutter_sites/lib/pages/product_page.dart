import 'package:flutter/material.dart';
import 'package:flutter_sites/model/product.dart';
import 'package:flutter_sites/services/product.dart';
import 'package:flutter_sites/pages/product_list.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductListModal listData = ProductListModal([]);
  int page = 0;

  // 获取产品列表
  void getProductList() async {
    var data = await getProductsResult(page++);
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return ProductListWidget(list: listData, getNextPage: () => getProductList(),);
  }
}

