import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rgb_control/models/mode.dart';
import 'package:rgb_control/services/led_control/event.dart';
import 'package:rgb_control/services/led_control/provider.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  ModeBloc() : super(ModeInitialState()) {
    on<ModeLoadEvent>(_onModeLoad);
  }

  _onModeLoad(ModeLoadEvent event, Emitter<ModeState> state) async {
    emit(ModeLoadingState());

    // todo mock loading data
    await Future.delayed(const Duration(seconds: 1));
    List<Mode> mockModes = [
      Mode(
          id: 0,
          name: 'Random Color',
          imageUrl:
              'https://images.unsplash.com/photo-1545231097-cbd796f1d95f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDIyfHxSYWluYm93fGVufDB8fHx8MTY2NjYzNTgyOQ&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 1,
          name: 'RGB Jump',
          imageUrl:
              'https://www.slate.fr/sites/default/files/styles/1060x523/public/julian-hochgesang-pvikejwyofa-unsplash.jpg'),
      Mode(
          id: 2,
          name: 'Color Jump',
          imageUrl:
              'https://images.unsplash.com/photo-1541701494587-cb58502866ab?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDI5fHxyZ2J8ZW58MHx8fHwxNjY2NjM1Njcy&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 3,
          name: 'Lightning',
          imageUrl:
              'https://images.unsplash.com/photo-1584267385289-81fdaa6efe7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDMxfHxMaWdodG5pbmd8ZW58MHx8fHwxNjY2NjM1NDEw&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 4,
          name: 'Color lightning',
          imageUrl:
              'https://catherineasquithgallery.com/uploads/posts/2021-02/1612914629_38-p-krasnaya-molniya-fon-47.jpg'),
      Mode(
          id: 5,
          name: 'Smooth RGB',
          imageUrl:
              'https://images.unsplash.com/photo-1533109721025-d1ae7ee7c1e1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDE5fHxjb2xvci1ncmFkaWVudHxlbnwwfHx8fDE2Njc2Njc3ODE&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 6,
          name: 'Smooth Yellow',
          imageUrl:
              'https://images.unsplash.com/photo-1591968743883-decc954ccce8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDEyfHx5ZWxsb3d8ZW58MHx8fHwxNjY3NjY4MTAz&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 7,
          name: 'Relax',
          imageUrl:
              'https://images.unsplash.com/photo-1474540412665-1cdae210ae6b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDE0fHxSZWxheC1jb2xvcnxlbnwwfHx8fDE2NjY2MzYxMjA&ixlib=rb-4.0.3&q=80&w=400'),
      Mode(
          id: 8,
          name: 'Color Gradient',
          imageUrl:
              'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDIyfHxjb2xvci1ncmFkaWVudHxlbnwwfHx8fDE2Njc2Njc3ODE&ixlib=rb-4.0.3&q=80&w=400'),
    ];

    emit(ModeLoadedState(modes: mockModes));
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
}
