part of 'brightness_level_bloc.dart';

abstract class BrightnessLevelEvent {}

class BrightnessLevelSetEvent extends BrightnessLevelEvent {
  bool inner;
  double level;

  BrightnessLevelSetEvent({this.inner = false, required this.level});
}
