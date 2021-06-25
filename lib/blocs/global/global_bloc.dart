import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hello/repo/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState());

  Future<SharedPreferences> get sp => LocalStorage.sp;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    if (event is SwitchThemeColorEvent) {

    }
  }
}
