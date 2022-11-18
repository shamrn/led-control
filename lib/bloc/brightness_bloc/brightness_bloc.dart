import 'package:bloc/bloc.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';
import 'package:rgb_control/utils/app_constants.dart';

part 'brightness_event.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, double> {
  BrightnessBloc() : super(Brightness.initLevel) {
    on<BrightnessSetEvent>(_onBrightnessSet);
  }

  void _onBrightnessSet(
      BrightnessSetEvent event, Emitter<double> emit) {
    if (!event.inner) {
      WebSocketManager()
          .addEvent(Event.setBrightness(brightness: event.level));
    }
    emit(event.level);
  }
}
