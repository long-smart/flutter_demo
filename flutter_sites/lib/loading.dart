import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      print("flutter企业站启动");
      Navigator.of(context).pushReplacementNamed('app');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
//          Image.asset(
//            'assets/images/loading.jpeg',
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
//          ),
          Center(
            child: Image.network(
              'http://b-ssl.duitang.com/uploads/item/201509/24/20150924183935_X4QnH.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(
              '感动人心价格厚道',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
