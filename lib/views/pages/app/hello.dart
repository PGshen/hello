import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/app/res/const_val.dart';
import 'package:hello/app/router/hello_router.dart';
import 'package:hello/blocs/global/global_bloc.dart';
import 'package:hello/views/pages/splash/hello_splash.dart';

class Hello extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(builder: (_, state) {
      return MaterialApp(
        title: ConstVal.appName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: HelloRouter.generateRoute,
        theme: ThemeData(
          primarySwatch: state.themeColor
        ),
        home: HelloSplash()
      );
    });
  }
}