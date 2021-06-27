import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hello/app/res/const_val.dart';
import 'package:hello/model/enums.dart';
import 'package:meta/meta.dart';

part 'widgets_event.dart';
part 'widgets_state.dart';

class WidgetsBloc extends Bloc<WidgetsEvent, WidgetsState> {
  WidgetsBloc() : super(WidgetsLoading(WidgetFamily.statelessWidget));


  @override
  Stream<WidgetsState> mapEventToState(
    WidgetsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
