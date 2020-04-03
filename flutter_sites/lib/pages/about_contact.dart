import 'package:flutter/material.dart';
import 'package:flutter_sites/services/contact.dart';

class AboutContactPage extends StatefulWidget {
  @override
  _AboutContactPageState createState() => _AboutContactPageState();
}

class _AboutContactPageState extends State<AboutContactPage> {
  TextEditingController controller = TextEditingController();

  void commit() {
    if (controller.text.length == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('请输入内容')),
      );
    } else {
      var info = contactCompany(controller.text);
      print(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系我们'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/aboutUs.jpg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 380.0,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: '请留言',
                    hintText: '请留言1',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: controller,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(
                width: 180,
                height: 40,
                child: RaisedButton(
                  child: Text('给我们留言', style: TextStyle(fontSize: 16.0)),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {
                    commit();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
