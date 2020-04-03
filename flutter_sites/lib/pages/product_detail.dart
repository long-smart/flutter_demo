import 'package:flutter/material.dart';
import 'package:flutter_sites/model/product.dart';

class ProductDetail extends StatelessWidget {
  final ProductItemModal items;
  ProductDetail({Key key, this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.name),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.network(items.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(items.desc),
          )
        ],
      ),
    );
  }
}
