import 'package:flutter/material.dart';
import 'package:flutter_sites/widgets/banner.dart';
import 'package:flutter_sites/services/product.dart';
import 'package:flutter_sites/model/product.dart';
import './home_product_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProductListModal listData = ProductListModal([]);

  void getProductList() async {
    var data = await getProductsResult(0);
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
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProductList(listData),
        ],
      ),
    );
  }
}
