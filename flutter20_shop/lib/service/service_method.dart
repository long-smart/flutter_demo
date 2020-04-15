import 'package:dio/dio.dart';
import 'dart:async';

Future requestPost(url, {data}) async {
  try {
    print('开始获取数据');
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    
    if (data == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url, data: data);
    }
    if (response.statusCode == 200) {
      print('-----------' + response.data);
      return response.data;
    } else {
      return throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('Error: ======> $e');
  }
}
