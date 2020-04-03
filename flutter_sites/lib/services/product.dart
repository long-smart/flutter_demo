import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_sites/conf/configure.dart';

getProductsResult([int page = 0]) async {
  String url = 'http://${Config.IP}:${Config.PORT}?action=getProducts&page=$page';
  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);
  print(json);
  return json['items'] as List;
}