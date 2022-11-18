part of 'brightness_bloc.dart';

abstract class BrightnessEvent {}

class BrightnessSetEvent extends BrightnessEvent {
  bool inner;
  double level;

  BrightnessSetEvent({this.inner = false, required this.level});
}
