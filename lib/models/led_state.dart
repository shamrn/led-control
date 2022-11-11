enum LedStateEnum { inactive, active, off, on, rgb, mode }

class LedState {
  int state;
  double brightness;
  int? mode;
  List<dynamic> rgb;
  double rate;

  LedState(
      {required this.state,
      required this.brightness,
      required this.mode,
      required this.rgb,
      required this.rate});

  factory LedState.fromJson(Map<String, dynamic> json) {
    return LedState(
      state: json['state'],
      brightness: json['brightness'],
      mode: json['mode'],
      rgb: json['rgb'],
      rate: json['rate']
    );
  }
}
