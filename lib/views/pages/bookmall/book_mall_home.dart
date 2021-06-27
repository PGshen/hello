import 'package:flutter/material.dart';

class BookMallHome extends StatefulWidget {
  @override
  _BookMallHomeState createState() => _BookMallHomeState();
}

class _BookMallHomeState extends State<BookMallHome> with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin {
  late TabController _tabController; //需要定义一个Controller
  List tabs = ["数学", "英语", "政治", "计算机"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
    //导航栏
    title: Text("Hello"),
    leading: Builder(builder: (context) {
      return IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white), //自定义图标
        onPressed: () {
          // 返回
          Navigator.pop(context);
        },
      );
    }),
    actions: <Widget>[
      //导航栏右侧菜单
      IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            print('press share button...');
          }),
    ],
    bottom: TabBar(
        controller: _tabController,
        tabs: tabs.map((e) => Tab(text: e)).toList()),
  );

  @override
  bool get wantKeepAlive => true;

}