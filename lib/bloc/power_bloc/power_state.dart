part of 'power_bloc.dart';

@immutable
abstract class PowerState {}

class PowerOnState extends PowerState {}

class PowerOffState extends PowerState {}
