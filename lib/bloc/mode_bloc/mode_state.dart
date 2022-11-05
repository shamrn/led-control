part of 'mode_bloc.dart';

abstract class ModeState {}

class ModeInitialState extends ModeState {}

class ModeLoadingState extends ModeState {}

class ModeLoadedState extends ModeState {
  final List<Mode> modes;

  ModeLoadedState({required this.modes});
}

class ModeSetState extends ModeState {
  int? modeId;

  ModeSetState({this.modeId});
}
