part of 'global_bloc.dart';

/// 全局状态
class GlobalState extends Equatable {
  /// [themeColor] 主题色
  final MaterialColor themeColor;

  const GlobalState({this.themeColor = Colors.blue});

  @override
  List<Object> get props => [themeColor];

  GlobalState copyWith({
    MaterialColor? themeColor,
  }) =>
      GlobalState(
        themeColor: themeColor ?? this.themeColor,
      );

  @override
  String toString() {
    return 'GlobalState{themeColor: $themeColor}';
  }
}
