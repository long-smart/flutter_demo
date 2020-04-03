import 'dart:convert';
import 'dart:io';
import 'data.dart';

void main() async {
  var requestServer = await HttpServer.bind('192.168.1.4', 6666);
  print('http服务器启动');

  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGet(request);
    } else if (request.method == 'POST') {
      handlePost(request);
    }
  } catch (e) {
    print("异常：$e");
  }
}

void handleGet(HttpRequest request) {
  var action = request.uri.queryParameters['action'];

  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];
    print('获取产品数据 $page');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonEncode(products))
      ..close();
  } else if (action == 'getNews') {
    print('获取新闻');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(jsonEncode(news))
      ..close();
  } else if (action == 'contactCompany') {
    var msg = request.uri.queryParameters['msg'];
    print(msg);
    request.response
      ..statusCode = HttpStatus.ok
      ..write('提交成功：$msg')
      ..close();
  }
}

void handlePost(HttpRequest request) {}
