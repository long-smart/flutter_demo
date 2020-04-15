import 'package:flutter/material.dart';
import 'package:flutter20_shop/model/cart.dart';
import 'package:provide/provide.dart';
import 'package:flutter20_shop/provide/cart.dart';
import 'cart_page/cart_item.dart';
import 'cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCardInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CartModel> cartList = Provide.value<CartProvide>(context).cartList;
            return Stack(
              children: <Widget>[
                Provide<CartProvide>(
                  builder: (context, child, childCategory) {
                    cartList = Provide.value<CartProvide>(context).cartList;
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        return CartItem(item: cartList[index]);
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                ),
              ],
            );
          } else {
            return Text('正在加载');
          }
        },
      ),
    );
  }

  Future<String> _getCardInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCard();
    return 'end';
  }
}
