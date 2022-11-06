import 'package:bloc/bloc.dart';
import 'package:rgb_control/services/led_control/event.dart';
import 'package:rgb_control/services/led_control/provider.dart';
import 'package:rgb_control/utils/app_constants.dart';

part 'rate_event.dart';

class RateBloc extends Bloc<RateEvent, double> {
  RateBloc() : super(Rate.initLevel) {
    on<RateSetEvent>(_onRateSet);
  }

  void _onRateSet(RateSetEvent event, Emitter<double> emit) {
    WebSocketManager().addEvent(Event().setRate(rate: event.level));
    emit(event.level);
  }
}
