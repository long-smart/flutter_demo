import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile widget'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('Expansion title'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.black12,
          children: <Widget>[
            ListTile(
              title: Text('list title'),
              subtitle: Text('list subTitle'),
            )
          ],
          initiallyExpanded: false, // 是否展开
        ),
      ),
    );
  }
}
