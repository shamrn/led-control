import 'package:bloc/bloc.dart';
import 'package:rgb_control/services/led_control/event.dart';
import 'package:rgb_control/services/led_control/provider.dart';
import 'package:rgb_control/utils/app_constants.dart';

part 'brightness_level_event.dart';

class BrightnessLevelBloc extends Bloc<BrightnessLevelEvent, double> {
  BrightnessLevelBloc() : super(BrightnessLevel.initLevel) {
    on<BrightnessLevelSetEvent>(_onBrightnessLevelSet);
  }

  void _onBrightnessLevelSet(
      BrightnessLevelSetEvent event, Emitter<double> emit) {
    WebSocketManager()
        .addEvent(Event().setBrightnessLevel(brightnessLevel: event.level));
    emit(event.level);
  }
}
