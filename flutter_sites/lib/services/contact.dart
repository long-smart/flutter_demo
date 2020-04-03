import 'package:http/http.dart' as http;
import 'package:flutter_sites/conf/configure.dart';

contactCompany(String msg) async {
  String url = 'http://${Config.IP}:${Config.PORT}?action=contactCompany&msg=$msg';
  var res = await http.get(url);
  String body = res.body;
  var info = body;
  print(info);
  return info;
}