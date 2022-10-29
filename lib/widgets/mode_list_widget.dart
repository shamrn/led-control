import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: Styles.modeCardSpacing,
          runSpacing: 12,
          direction: Axis.horizontal,
          children: [
            ModeCardWidget(
                mode: Mode(
                    id: 1,
                    name: 'Color Jump',
                    imageUrl:
                        'https://www.slate.fr/sites/default/files/styles/1060x523/public/julian-hochgesang-pvikejwyofa-unsplash.jpg')),
            ModeCardWidget(
                active: true,
                mode: Mode(
                    id: 1,
                    name: 'Lightning',
                    imageUrl:
                        'https://images.unsplash.com/photo-1584267385289-81fdaa6efe7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDMxfHxMaWdodG5pbmd8ZW58MHx8fHwxNjY2NjM1NDEw&ixlib=rb-4.0.3&q=80&w=400')),
            ModeCardWidget(
                mode: Mode(
                    id: 1,
                    name: 'Smooth rgb',
                    imageUrl:
                        'https://images.unsplash.com/photo-1541701494587-cb58502866ab?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDI5fHxyZ2J8ZW58MHx8fHwxNjY2NjM1Njcy&ixlib=rb-4.0.3&q=80&w=400')),
            ModeCardWidget(
                mode: Mode(
                    id: 1,
                    name: 'Rainbow',
                    imageUrl:
                        'https://images.unsplash.com/photo-1545231097-cbd796f1d95f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDIyfHxSYWluYm93fGVufDB8fHx8MTY2NjYzNTgyOQ&ixlib=rb-4.0.3&q=80&w=400')),
            ModeCardWidget(
                mode: Mode(
                    id: 1,
                    name: 'Relax',
                    imageUrl:
                        'https://images.unsplash.com/photo-1474540412665-1cdae210ae6b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTAwNXwwfDF8c2VhcmNofDE0fHxSZWxheC1jb2xvcnxlbnwwfHx8fDE2NjY2MzYxMjA&ixlib=rb-4.0.3&q=80&w=400'))
          ],
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
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
          },
          borderRadius: BorderRadius.circular(borderRadiusValue),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
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
              Positioned(
                  top: 1,
                  left: 136,
                  child:
                      _getSelectionIcon(color: Styles.primaryColor, size: 28)),
              ClipRRect(
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
