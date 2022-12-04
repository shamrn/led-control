part of 'power_bloc.dart';

abstract class PowerEvent {}

class PowerOnEvent extends PowerEvent {}

class PowerOffEvent extends PowerEvent {}

class PowerInnerOnEvent extends PowerEvent {}

class PowerInnerOffEvent extends PowerEvent {}
