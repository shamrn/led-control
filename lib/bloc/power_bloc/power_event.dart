part of 'power_bloc.dart';

abstract class PowerEvent {}

class PowerOnEvent extends PowerEvent {
  bool inner;

  PowerOnEvent({this.inner = false});
}

class PowerOffEvent extends PowerEvent {
  bool inner;

  PowerOffEvent({this.inner = false});
}
