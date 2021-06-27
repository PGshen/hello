part of 'widgets_bloc.dart';

@immutable
abstract class WidgetsEvent {
  const WidgetsEvent();

  @override
  List<Object> get props => [];
}

class TabTapEvent extends WidgetsEvent {
  final WidgetFamily family;

  TabTapEvent(this.family);
}
