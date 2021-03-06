import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: CustomScrollView(slivers: <Widget>[
      SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: new SliverGrid(
          //Grid
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //Grid按两列显示
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              //创建子widget
              return new Container(
                alignment: Alignment.center,
                color: Colors.cyan[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ),
      new SliverFixedExtentList(
        itemExtent: 50.0,
        delegate:
            new SliverChildBuilderDelegate((BuildContext context, int index) {
          //创建列表项
          return new Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: new Text('list item $index'),
          );
        }, childCount: 50 //50个列表项
                ),
      ),
    ]));
  }
}
