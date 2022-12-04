part of 'mode_bloc.dart';

abstract class ModeEvent {}

class ModeLoadEvent extends ModeEvent {}

abstract class ModeBaseSetEvent extends ModeEvent {
  int modeId;

  ModeBaseSetEvent({required this.modeId});
}

class ModeInnerSetEvent extends ModeBaseSetEvent {
  ModeInnerSetEvent({required super.modeId});
}

class ModeSetEvent extends ModeBaseSetEvent {
  double? brightness;
  double? rate;

  ModeSetEvent({required super.modeId, this.brightness, this.rate});
}
