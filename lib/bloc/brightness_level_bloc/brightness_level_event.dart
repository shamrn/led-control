part of 'brightness_level_bloc.dart';

abstract class BrightnessLevelEvent {}

class BrightnessLevelSetEvent extends BrightnessLevelEvent {
  double level;

  BrightnessLevelSetEvent({required this.level});
}
