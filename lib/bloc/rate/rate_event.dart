part of 'rate_bloc.dart';

abstract class RateEvent {}

class RateSetEvent extends RateEvent {
  double level;

  RateSetEvent({required this.level});
}
