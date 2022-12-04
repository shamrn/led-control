part of 'brightness_bloc.dart';

abstract class BrightnessEvent {
  double level;

  BrightnessEvent({required this.level});
}

class BrightnessSetEvent extends BrightnessEvent {
  BrightnessSetEvent({required super.level});
}

class BrightnessInnerSetEvent extends BrightnessEvent {
  BrightnessInnerSetEvent({required super.level});
}
