part of 'rate_bloc.dart';

abstract class RateEvent {}

class RateSetEvent extends RateEvent {
  bool inner;
  double level;

  RateSetEvent({this.inner = false, required this.level});
}
