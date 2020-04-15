import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './routerHandler.dart';

class Routes {
  static String root = '/';
  static String detailPage = '/detail';
  static void configRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('route is not fount');
        return null;
      }
    );

    router.define(detailPage, handler: detailHandler);
  }
}
