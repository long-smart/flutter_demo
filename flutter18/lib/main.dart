import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '事件处理',
      home: Scaffold(
        appBar: AppBar(
          title: Text('事件处理'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = false;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('获取百度首页'),
              onPressed: loading
                  ? null
                  : () async {
                      setState(() {
                        loading = true;
                        text = "正在请求...";
                      });
                      try {
                        HttpClient httpClient = HttpClient();
                        HttpClientRequest request = await httpClient
                            .getUrl(Uri.parse('https://www.baidu.com'));
                        request.headers.add("user-agent",
                            "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                        HttpClientResponse response = await request.close();
                        text = await response.transform(utf8.decoder).join();
                        print(response.headers);
                        httpClient.close();
                      } catch (e) {
                        print('异常：$e');
                      } finally {
                        setState(() {
                          loading = false;
                        });
                      }
                    },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(text.replaceAll(new RegExp(r"\s"), "")),
            )
          ],
        ),
      ),
    );
  }
}
