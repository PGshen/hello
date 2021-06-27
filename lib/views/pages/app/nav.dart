import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/app/router/hello_router.dart';
import 'package:hello/blocs/global/global_bloc.dart';
import 'package:hello/views/pages/bookshelf/book_shelf.dart';
import 'package:hello/views/pages/drawer/hello_drawer.dart';
import 'package:hello/views/pages/me/me_home.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() {
    return _NavState();
  }
}

class _NavState extends State<Nav> with SingleTickerProviderStateMixin {
  int curIndex = 0;

  List pageList = [
    BookShelf(),
    MeHome(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: HelloDrawer(),
      body: this.pageList[this.curIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  // 底部导航栏
  Widget _buildBottomNavBar() => BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: _highLightSize(0),
                color: _highLightColor(0),
              ),
              onPressed: () {
                _onTapBottomNav(0);
              },
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(
                Icons.person_outline,
                size: _highLightSize(1),
                color: _highLightColor(1),
              ),
              onPressed: () {
                _onTapBottomNav(1);
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      );

  // 浮动按钮
  Widget _buildFloatingButton(BuildContext context) =>
      BlocBuilder<GlobalBloc, GlobalState>(
          builder: (_, state) => FloatingActionButton(
                backgroundColor: state.themeColor.shade500,
                child: Icon(Icons.add),
                onPressed: () =>
                    Navigator.of(context).pushNamed(HelloRouter.bookmall),
              ));

  // 点击底部导航按钮
  _onTapBottomNav(int index) {
    print(index);
    setState(() {
      //动态设置索引值
      this.curIndex = index;
    });
  }

  Color _highLightColor(int index) =>
      index == curIndex ? Colors.red : Colors.black26;

  double _highLightSize(int index) => index == curIndex ? 36 : 36;
}
