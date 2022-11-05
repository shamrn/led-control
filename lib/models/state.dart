enum StateEnum { inactive, active, off, on, rgb, mode }

class State {
  int state;
  double brightnessLevel;
  int mode;
  List<dynamic> rgb;
  double rate;

  State(
      {required this.state,
      required this.brightnessLevel,
      required this.mode,
      required this.rgb,
      required this.rate});

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      state: json['state'],
      brightnessLevel: json['brightness_level'],
      mode: json['mode'],
      rgb: json['rgb'],
      rate: json['rate']
    );
  }
}
