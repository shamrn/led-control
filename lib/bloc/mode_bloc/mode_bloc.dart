import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rgb_control/models/mode.dart';
import 'package:rgb_control/services/led_control/led_control_event.dart';
import 'package:rgb_control/services/led_control/led_control_websocket.dart';
import 'package:rgb_control/services/mode/mode_repository.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  ModeBloc() : super(ModeInitialState()) {
    on<ModeLoadEvent>(_onModeLoad);
  }

  _onModeLoad(ModeLoadEvent event, Emitter<ModeState> state) async {
    emit(ModeLoadingState());

    try {
      final List<Mode> modes = await ModeRepository().getModes();
      emit(ModeLoadedState(modes: modes));
    } catch (_) {
      emit(ModeErrorState());
    }
  }
}

class ModeSetBloc extends Bloc<ModeEvent, ModeSetState> {
  ModeSetBloc() : super(ModeSetState(modeId: null)) {
    on<ModeSetEvent>(_onModeSet);
  }

  void _onModeSet(ModeSetEvent event, emit) {
    WebSocketManager().addEvent(Event().setMode(
        modeId: event.modeId,
        rate: event.rate,
        brightnessLevel: event.brightnessLevel));
    emit(ModeSetState(modeId: event.modeId));
  }

  void reset() {
    if (state.modeId != null) emit(ModeSetState(modeId: null));
  }
}
