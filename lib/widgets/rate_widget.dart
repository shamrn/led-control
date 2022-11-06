import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_control/bloc/rate/rate_bloc.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/section_widget.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SectionWidget(
            title: Texts.rateTitle, icon: EvaIcons.activityOutline),
        const SizedBox(
          height: 10,
        ),
        const SliderRate(),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Texts.rateHelpText,
            style: TextStyle(color: Styles.primaryColor.withOpacity(0.6)),
          ),
        )
      ],
    );
  }
}

class SliderRate extends StatefulWidget {
  const SliderRate({Key? key}) : super(key: key);

  @override
  State<SliderRate> createState() => _SliderRateState();
}

class _SliderRateState extends State<SliderRate> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: Styles.sliderThemData,
      child: BlocBuilder<RateBloc, double>(
        builder: (context, currentLevel) => Slider.adaptive(
            value: currentLevel,
            min: Rate.minLevel,
            max: Rate.maxLevel,
            label: '${currentLevel.toInt()}%',
            thumbColor: Styles.primaryColor,
            activeColor: Styles.secondColor,
            inactiveColor: Styles.secondColor.withOpacity(0.5),
            onChanged: (double level) {
              context.read<RateBloc>().add(RateSetEvent(level: level));
            }),
      ),
    );
  }
}
