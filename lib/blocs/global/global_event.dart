part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class InitAppEvent extends GlobalState {
  const InitAppEvent();

  @override
  List<Object> get props => [];
}

/// 主题色切换事件
class SwitchThemeColorEvent extends GlobalEvent {
  final MaterialColor color;

  const SwitchThemeColorEvent(this.color);

  @override
  List<Object> get props => [color];
}