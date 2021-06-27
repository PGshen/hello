import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/app/router/hello_router.dart';
import 'package:hello/blocs/global/global_bloc.dart';

class HelloSplash extends StatefulWidget {
  _HelloSplashState createState() => _HelloSplashState();
}

class _HelloSplashState extends State<HelloSplash>
    with TickerProviderStateMixin {
  late AnimationController _controller;


  final Duration animTime = const Duration(milliseconds: 1000);
  final Duration delayTime = const Duration(milliseconds: 500);
  final Duration fadeInTime = const Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    _controller = AnimationController(duration: animTime, vsync: this)
      ..addStatusListener(_listenStatus)
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(delayTime).then((e) {
        Navigator.of(context).pushReplacementNamed(HelloRouter.nav);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double winH = MediaQuery.of(context).size.height;
    final double winW = MediaQuery.of(context).size.width;

    return BlocListener<GlobalBloc, GlobalState>(
      listener: _listenStart,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [_buildHead()],
        ),
      ),
    );
    throw UnimplementedError();
  }

  Widget _buildHead() => SlideTransition(
      position: Tween<Offset>(
        end: const Offset(0, 0),
        begin: const Offset(0, -5),
      ).animate(_controller),
      child: Center(
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset('assets/images/avatar.webp'),
        ))
      );

  // 此处可触发初始事件，比如首页加载
  void _listenStart(BuildContext context, GlobalState state) {
    // BlocProvider.of(context).add();
  }
}
