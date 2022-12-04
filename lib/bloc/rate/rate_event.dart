part of 'rate_bloc.dart';

abstract class RateEvent {
  double level;

  RateEvent({required this.level});
}

class RateSetEvent extends RateEvent {
  RateSetEvent({required super.level});
}

class RateInnerSetEvent extends RateEvent {
  RateInnerSetEvent({required super.level});
}
