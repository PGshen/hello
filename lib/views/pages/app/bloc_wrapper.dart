import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello/blocs/global/global_bloc.dart';
import 'package:hello/blocs/widgets/widgets_bloc.dart';
import 'package:hello/repo/app_start.dart';

AppStart appStart = AppStart();

// bloc全局包装
class BlocWrapper extends StatefulWidget {
  final Widget child;
  BlocWrapper({required this.child});

  @override
  _BlocWrapperState createState() {
    return _BlocWrapperState();
  }
}

class _BlocWrapperState extends State<BlocWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GlobalBloc>(create: (_) => GlobalBloc(appStart: appStart)..add(const InitAppEvent())),
      BlocProvider<WidgetsBloc>(create: (_) => WidgetsBloc()),
    ], child: widget.child);
  }

  @override
  void dispose() {
    super.dispose();
  }
}