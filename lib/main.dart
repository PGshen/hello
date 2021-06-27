import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello/views/pages/app/bloc_wrapper.dart';
import 'package:hello/views/pages/app/hello.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = true;
  runApp(BlocWrapper(child: Hello()));
}