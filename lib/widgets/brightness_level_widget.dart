import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_bloc.dart';
import 'package:rgb_control/bloc/color_bloc/color_event.dart';
import 'package:rgb_control/bloc/color_bloc/color_state.dart';
import 'package:rgb_control/utils/app_constants.dart';

class BrightnessLevelWidget extends StatefulWidget {
  const BrightnessLevelWidget({Key? key}) : super(key: key);

  @override
  State<BrightnessLevelWidget> createState() => _BrightnessLevelWidgetState();
}

class _BrightnessLevelWidgetState extends State<BrightnessLevelWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              Texts.brightnessLevelTitle,
              style: Styles.primaryTextStyle,
            ),
            Icon(
              Icons.lightbulb_outline_rounded,
              color: Styles.primaryColor,
              size: 26,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
          child: BlocProvider(
            create: (context) => ColorBrightnessLevelBloc(),
            child: BlocBuilder<ColorBrightnessLevelBloc,
                ColorBrightnessLevelState>(
              builder: (context, state) => Slider.adaptive(
                  value: state.level,
                  min: BrightnessLevel.minLevel,
                  max: BrightnessLevel.maxLevel,
                  thumbColor: Styles.primaryColor,
                  activeColor: Styles.secondColor,
                  inactiveColor: Styles.secondColor,
                  onChanged: (double level) {
                    context
                        .read<ColorBrightnessLevelBloc>()
                        .add(BrightnessLevelSetEvent(level: level));
                  }),
            ),
          ),
        )
      ],
    );
  }
}
