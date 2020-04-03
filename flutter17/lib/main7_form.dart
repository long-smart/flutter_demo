import 'package:flutter/material.dart';
import './iconfont.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/* 
  表单组件
*/
class _MyAppState extends State<MyApp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "表单练习",
      home: Scaffold(
        appBar: AppBar(
          title: Text('表单练习'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            autovalidate: true, // 开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.length > 0 ? null : '用户名不能为空';
                  },
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登陆密码',
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.length > 6 ? null : '密码不能小于6位';
                  },
                ),
                // 登陆按钮
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: RaisedButton(
                    child: Text('登陆'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        print("校验通过");
                      }else {
                        print("校验不过");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
