import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hello/app/res/const_val.dart';
import 'package:hello/repo/app_start.dart';
import 'package:hello/repo/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc({required this.appStart}) : super(GlobalState());

  AppStart appStart;

  Future<SharedPreferences> get sp => LocalStorage.sp;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    // 应用初始化事件
    if(event is InitAppEvent) {
      yield await appStart.initApp();
    }
    // 切换主题色事件
    if (event is SwitchThemeColorEvent) {
      int themeIndex = ConstVal.themeColor.keys.toList().indexOf(event.color);
      await sp..setInt(ConstVal.themeColorIndex, themeIndex);
      yield state.copyWith(themeColor: event.color);
    }
  }
}
