import 'package:flutter/material.dart';

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}

class ExpansionPanelListDemo extends StatefulWidget {
  @override
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<int> mList;
  List<ExpandStateBean> expandState;

  _ExpansionPanelListDemoState() {
    mList = new List();
    expandState = new List();
    //便利为两个List进行赋值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandState.add(ExpandStateBean(i, false));
    }
  }

  _setIndex(int index, isExpand) {
    setState(() {
      expandState.forEach((item) {
        if (item.index == index) {
          //取反，经典取反方法
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expandPanle List')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setIndex(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('this is No.$index'),
                );
              },
              body: ListTile(
                title:Text('expansion no.$index')
              ),
              isExpanded: expandState[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}
