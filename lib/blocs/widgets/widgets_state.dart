part of 'widgets_bloc.dart';

abstract class WidgetsState extends Equatable {
  final WidgetFamily activeFamily;

  const WidgetsState(this.activeFamily);

  Color get color => ConstVal.tabColors[activeFamily.index];
  Color get nextColor => ConstVal.tabColors[(activeFamily.index+1)%ConstVal.tabColors.length];

  @override
  List<Object> get props => [activeFamily];
}

class WidgetsLoading extends WidgetsState {
  WidgetsLoading(WidgetFamily activeFamily) : super(activeFamily);

  @override
  List<Object> get props => [activeFamily];
}

