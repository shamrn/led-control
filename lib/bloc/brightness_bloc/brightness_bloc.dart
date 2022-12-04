import 'package:bloc/bloc.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/utils/app_constants.dart';

part 'brightness_event.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, double> {
  BrightnessBloc() : super(Brightness.initLevel) {
    on<BrightnessSetEvent>(_onBrightnessSet);

    on<BrightnessInnerSetEvent>(_onBrightnessInnerSet);
  }

  void _onBrightnessSet(BrightnessSetEvent event, Emitter<double> emit) {
    LedControlWsEvent.setBrightness(brightness: event.level);
    emit(event.level);
  }

  void _onBrightnessInnerSet(
      BrightnessInnerSetEvent event, Emitter<double> emit) {
    emit(event.level);
  }
}
