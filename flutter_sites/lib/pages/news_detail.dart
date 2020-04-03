import 'package:flutter/material.dart';
import 'package:flutter_sites/model/news.dart';

class NewsDetail extends StatelessWidget {
  final NewsItemModal items;
  NewsDetail({Key key, @required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(items.content),
      )
    );
  }
}
