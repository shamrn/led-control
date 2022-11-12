part of 'mode_bloc.dart';

@immutable
abstract class ModeEvent {}

class ModeLoadEvent extends ModeEvent {}

class ModeSetEvent extends ModeEvent {
  final bool inner;
  final int modeId;
  final double? brightnessLevel;
  final double? rate;

  ModeSetEvent(
      {this.inner = false,
      required this.modeId,
      this.brightnessLevel,
      this.rate});
}
