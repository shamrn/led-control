import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rgb_control/bloc/mode_bloc/mode_bloc.dart';
import 'package:rgb_control/models/mode.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/section_widget.dart';

class ModeListWidget extends StatelessWidget {
  const ModeListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SectionWidget(
            title: Texts.modeTitle, icon: EvaIcons.activityOutline),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<ModeBloc, ModeState>(
          builder: (context, state) {
            return Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: Styles.modeCardSpacing,
                runSpacing: 12,
                direction: Axis.horizontal,
                children: [
                  if (state is ModeLoadingState)
                    LoadingAnimationWidget.flickr(
                      rightDotColor: Colors.pink,
                        leftDotColor: Styles.secondColor, size: 60),
                  if (state is ModeLoadedState)
                    ...state.modes.map((mode) => ModeCardWidget(mode: mode))
                ]);
          },
        )
      ],
    );
  }
}

//
class ModeCardWidget extends StatefulWidget {
  final Mode mode;
  final bool active;

  const ModeCardWidget({Key? key, required this.mode, this.active = false})
      : super(key: key);

  @override
  State<ModeCardWidget> createState() => _ModeCardWidgetState();
}

class _ModeCardWidgetState extends State<ModeCardWidget> {
  double borderRadiusValue = 10;
  double height = 120;

  double get _width =>
      MediaQuery.of(context).size.width / 2 -
      Styles.horizontalPrimaryPadding -
      Styles.modeCardSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        height: height,
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
          },
          borderRadius: BorderRadius.circular(borderRadiusValue),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadiusValue),
                child: Image.network(
                  widget.mode.imageUrl,
                  fit: BoxFit.cover,
                  height: height,
                  width: _width,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: _getSelectionIcon(color: Styles.primaryColor, size: 28),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadiusValue),
                      bottomRight: Radius.circular(borderRadiusValue)),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 6.0,
                          sigmaY: 6.0,
                        ),
                        child: const SizedBox(
                          height: 28,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        height: 28,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(borderRadiusValue),
                              bottomRight: Radius.circular(borderRadiusValue)),
                        ),
                        child: Center(
                          child: Text(
                            widget.mode.name,
                            style: TextStyle(
                                fontSize: 22,
                                color: Styles.primaryColor.withOpacity(0.8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Icon _getSelectionIcon({required Color color, required double size}) {
    return widget.active == false
        ? Icon(
            EvaIcons.radioButtonOff,
            color: color,
            size: size,
          )
        : Icon(
            EvaIcons.radioButtonOn,
            color: color,
            size: size,
          );
  }
}
