import 'package:flutter/material.dart';
import 'package:hello/app/utils/router_util.dart';
import 'package:hello/views/pages/app/nav.dart';
import 'package:hello/views/pages/bookmall/book_mall_home.dart';

class HelloRouter {
  static const String nav = 'nav';
  static const String bookmall = 'bookmall';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case nav:
        return Left2RightRouter(child: Nav());
      case bookmall:
        return Bottom2TopRouter(child: BookMallHome());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}