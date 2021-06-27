import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/blocs/global/global_bloc.dart';
import 'package:hello/views/components/circle_image.dart';
import 'package:hello/views/components/feedback_widget.dart';
import 'package:hello/views/pages/bookshelf/book_category.dart';

class BookShelfHome extends StatefulWidget {
  @override
  _BookShelfHomeState createState() => _BookShelfHomeState();
}

class _BookShelfHomeState extends State<BookShelfHome>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    BuildContext _topContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color:
            BlocProvider.of<GlobalBloc>(context).state.themeColor.withAlpha(11),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: _buildAppBar(_topContext, innerBoxIsScrolled)),
          ],
          body: BookCategory(),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool index) {
    return SliverAppBar(
        leading: Container(
            margin: EdgeInsets.all(10),
            child: FeedbackWidget(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: CircleImage(
                image: AssetImage('assets/images/avatar.webp'),
                borderSize: 1.5,
              ),
            )),
        backgroundColor: BlocProvider.of<GlobalBloc>(context).state.themeColor,
        title: Text(
          '书架',
          style: TextStyle(
              color: Colors.white, //标题
              fontSize: 18,
              shadows: [
                Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
              ]),
        ),
        pinned: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax, //视差效果
          background: Image.asset(
            "assets/images/girl.webp",
            fit: BoxFit.cover,
          ),
        ),
        forceElevated: index,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Container(),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
