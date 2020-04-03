import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var img = AssetImage("imgs/avatar.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          height: 50.0,
          width: 100.0,
          fit: BoxFit.fill,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          height: 50,
          width: 50.0,
          fit: BoxFit.contain,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitHeight,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          height: 50.0,
          fit: BoxFit.scaleDown,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          height: 50.0,
          width: 100.0,
          fit: BoxFit.none,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          fit: BoxFit.fill,
        ),
        Image(
          image: NetworkImage(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY,
        ),
      ].map((e) {
        return Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: e,
              ),
            ),
            Text(e.fit.toString())
          ],
        );
      }).toList()),
    );
  }
}
