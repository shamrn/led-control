part of 'mode_bloc.dart';

abstract class ModeEvent {}

class ModeLoadEvent extends ModeEvent {}

class ModeSetEvent extends ModeEvent {
  bool inner;
  int modeId;
  double? brightness;
  double? rate;

  ModeSetEvent(
      {this.inner = false,
      required this.modeId,
      this.brightness,
      this.rate});
}
