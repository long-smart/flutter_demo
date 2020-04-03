import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<IconData> icons = [];

  @override
  void initState() {
    super.initState();
    pushData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            if (index == icons.length - 1 && icons.length < 200) {
              pushData();
            }
            return Icon(icons[index]);
          },
          itemCount: icons.length,
        ),
      ),
    );
  }

  void pushData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
