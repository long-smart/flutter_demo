import 'package:flutter/material.dart';
import 'package:flutter20_shop/page/index_page.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/child_category.dart';
import 'package:flutter20_shop/provide/category_goods_list.dart';
import 'package:fluro/fluro.dart';
import './router/router.dart';
import './router/application.dart';
import 'provide/detail_info.dart';
import 'provide/cart.dart';
import 'provide/currentPageIndex.dart';

void main() {
  var currentIndex = CurrentIndexProvide();
  var childCategory = ChildCategory();
  var categoryGoodsList = CategoryGoodsListProvide();
  var detailGoodsInfoPrvide = DetailInfoProvide();
  var cartProvide = CartProvide();
  var providers = Providers();

  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndex))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsList))
    ..provide(Provider<DetailInfoProvide>.value(detailGoodsInfoPrvide))
    ..provide(Provider<CartProvide>.value(cartProvide));
  
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pinkAccent
        ),
        home: IndexPage(),
      ),
    );
  }
}
