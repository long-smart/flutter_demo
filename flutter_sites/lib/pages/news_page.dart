import 'package:flutter/material.dart';
import 'package:flutter_sites/services/news.dart';
import 'package:flutter_sites/model/news.dart';
import 'package:flutter_sites/pages/news_detail.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  NewsListModal listData = NewsListModal([]);

  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0, color: Colors.grey);
        },
        itemCount: listData.data.length,
        itemBuilder: (BuildContext context, int index) {
          NewsItemModal item = listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsDetail(items: item)),
              );
            },
          );
        },
      )
    );
  }
}
