import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final blue = Colors.blue;
  int _currentPage = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: blue,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: blue),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: blue,
            ),
            title: Text(
              'Email',
              style: TextStyle(color: blue),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: blue,
            ),
            title: Text(
              'Pages',
              style: TextStyle(color: blue),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: blue,
            ),
            title: Text(
              'AipPlay',
              style: TextStyle(color: blue),
            ),
          ),
        ],
        currentIndex: _currentPage,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
