import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/* 
  SliverGridDelegateWithFixedCrossAxisCount = Grived.count
  SliverGridDelegateWithMaxCrossAxisExtent = Grived.extent
  Grived.Build 适用于子组件多的情况下
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GirdView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 2.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GirdView',
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('GridView'),
//           ),
//           body: GridView(
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 120.0,
//               childAspectRatio: 2.0,
//             ),
//             children: <Widget>[
//               Icon(Icons.ac_unit),
//               Icon(Icons.airport_shuttle),
//               Icon(Icons.all_inclusive),
//               Icon(Icons.beach_access),
//               Icon(Icons.cake),
//               Icon(Icons.free_breakfast),
//             ],
//           )),
//     );
//   }
// }

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GirdView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 20, // 主轴间距
            crossAxisSpacing: 20, // 横轴间距
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ],
        ),
      ),
    );
  }
} */

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GirdView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
      ),
    );
  }
}
 */
