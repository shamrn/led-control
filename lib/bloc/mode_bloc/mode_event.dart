part of 'mode_bloc.dart';

@immutable
abstract class ModeEvent {}

class ModeLoadEvent extends ModeEvent {}

class ModeSetEvent extends ModeEvent {
  final int modeId;
  final double brightnessLevel;
  final double rate;

  ModeSetEvent(
      {required this.modeId,
      required this.brightnessLevel,
      required this.rate});
}
