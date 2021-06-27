import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/app/res/const_val.dart';
import 'package:hello/blocs/widgets/widgets_bloc.dart';
import 'package:hello/views/components/feedback_widget.dart';
import 'package:hello/views/pages/bookshelf/book_shelf_item.dart';

class BookShelf extends StatefulWidget {
  @override
  _BookShelfState createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  final ValueNotifier<double> factor = ValueNotifier<double>(0);

  late PageController _ctrl;

  final int _firstOffset = 1000; //初始偏移
  int _position = 0; //页面位置

  @override
  void initState() {
    super.initState();
    _position = _position + _firstOffset;

    double value = ((_position - _firstOffset + 1) % 5) / 5;
    factor.value = value == 0 ? 1 : value;
    _ctrl = PageController(
      viewportFraction: 0.9,
      initialPage: _position,
    )..addListener(() {
        double value = (_ctrl.page! - _firstOffset + 1) % 5 / 5;
        factor.value = value == 0 ? 1 : value;
      });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    factor.dispose();
    super.dispose();
  }

  Color get color => BlocProvider.of<WidgetsBloc>(context).state.color;

  Color get nextColor => BlocProvider.of<WidgetsBloc>(context).state.nextColor;

  BoxDecoration get boxDecoration => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        child: Column(
          //使用 child 属性优化
          children: [
            _buildTitle(context),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: _buildContent(),
              decoration: boxDecoration,
            ))
          ],
        ),
        valueListenable: factor,
        builder: (_, value, child) => Container(
          color: Color.lerp(
            color,
            nextColor,
            value as double,
          ),
          child: child,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.3),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.book_outlined,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "我的书架",
            style: TextStyle(fontSize: 26, color: Colors.white, shadows: [
              Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final List<Widget> widgets =
        (json.decode(ConstVal.bookInfo) as List).map((e) {
      BookInfo info = BookInfo.fromJson(e);

      return FeedbackWidget(
        a: 0.95,
        onPressed: () {
          print('');
        },
        child: BookShelfCardItem(info),
      );
    }).toList();

    return Container(
        padding: const EdgeInsets.only(bottom: 80, top: 40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _ctrl,
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: widgets[
                          _fixPosition(index, _firstOffset, widgets.length)],
                    ),
                    animation: _ctrl,
                    builder: (context, child) =>
                        _buildAnimItemByIndex(context, child!, index),
                  );
                },
                onPageChanged: (index) {
                  _position = index;
                },
              ),
            ),
            _buildDiver(),
          ],
        ));
  }

  Widget _buildAnimItemByIndex(BuildContext context, Widget child, int index) {
    double value;
    if (_ctrl.position.haveDimensions) {
      value = _ctrl.page! - index;
    } else {
      value = (_position - index).toDouble();
    }
    value = (1 - ((value.abs()) * .5)).clamp(0, 1).toDouble();
    value = Curves.easeOut.transform(value);

    return Transform(
      transform: Matrix4.diagonal3Values(1.0, value, 1.0),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: child,
      ),
    );
  }

  Widget _buildDiver() => Container(
        margin: EdgeInsets.only(bottom: 12, left: 48, right: 48, top: 10),
        height: 2,
        child: ValueListenableBuilder(
          valueListenable: factor,
          builder: (context, value, widget) {
            return LinearProgressIndicator(
              backgroundColor: Colors.black,
              value: factor.value,
              valueColor: AlwaysStoppedAnimation(
                Color.lerp(
                  color,
                  nextColor,
                  factor.value,
                ),
              ),
            );
          },
        ),
      );

  int _fixPosition(int realPos, int initPos, int length) {
    final int offset = realPos - initPos;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }
}
