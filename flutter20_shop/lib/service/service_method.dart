import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter20_shop/config/service_url.dart';

Future getHomeContent() async {
  try {
    print('获取首页数据');
    Response response;
    Dio dio = Dio();
    // dio.options.contentType= ContentType.parse("");
    dio.options.contentType = 'application/x-www-form-urlencoded';

    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error: ======> $e');
  }
}
