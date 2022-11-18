import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/brightness_bloc/brightness_bloc.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/section_widget.dart';

class BrightnessWidget extends StatelessWidget {
  const BrightnessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SectionWidget(
            title: Texts.brightnessTitle, icon: Icons.light_mode_sharp),
        SizedBox(
          height: 10,
        ),
        SliderBrightness()
      ],
    );
  }
}

class SliderBrightness extends StatefulWidget {
  const SliderBrightness({Key? key}) : super(key: key);

  @override
  State<SliderBrightness> createState() => _SliderBrightnessState();
}

class _SliderBrightnessState extends State<SliderBrightness> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: Styles.sliderThemData,
      child: BlocBuilder<BrightnessBloc, double>(
        builder: (context, currentLevel) => Slider.adaptive(
            value: currentLevel,
            min: Brightness.minLevel,
            max: Brightness.maxLevel,
            label: '${currentLevel.toInt()}%',
            thumbColor: Styles.primaryColor,
            activeColor: Styles.secondColor,
            inactiveColor: Styles.secondColor.withOpacity(0.5),
            onChanged: (double level) {
              context
                  .read<BrightnessBloc>()
                  .add(BrightnessSetEvent(level: level));
            }),
      ),
    );
  }
}
