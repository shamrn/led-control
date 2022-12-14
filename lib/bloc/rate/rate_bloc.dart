import 'package:bloc/bloc.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/utils/app_constants.dart';

part 'rate_event.dart';

class RateBloc extends Bloc<RateEvent, double> {
  RateBloc() : super(Rate.initLevel) {
    on<RateSetEvent>(_onRateSet);

    on<RateInnerSetEvent>(_onInnerRateSet);
  }

  void _onRateSet(RateSetEvent event, Emitter<double> emit) {
    LedControlWsEvent.setRate(rate: event.level);
    emit(event.level);
  }

  void _onInnerRateSet(RateInnerSetEvent event, Emitter<double> emit) {
    emit(event.level);
  }
}
