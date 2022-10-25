import 'package:flutter/material.dart';
import 'package:rgb_control/utils/app_constants.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionWidget({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Styles.primaryTextStyle,
        ),
        Icon(
          icon,
          color: Styles.primaryColor,
          size: 26,
        )
      ],
    );
  }
}
