import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_sites/conf/configure.dart';

getNewsResult() async {
  String url = 'http://${Config.IP}:${Config.PORT}?action=getNews';
  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);
  print(json);
  return json['items'] as List;
}