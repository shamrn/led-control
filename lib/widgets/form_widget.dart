import 'package:flutter/material.dart';
import 'package:rgb_control/utils/app_constants.dart';

class FormWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final String name;
  final TextEditingController textController;

  const FormWidget(
      {Key? key,
      required this.keyboardType,
      required this.name,
      required this.textController})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Texts.validationRequiredFieldText;
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: Styles.primaryColor),
      focusNode: FocusNode(),
      autofocus: true,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: widget.name,
        hintStyle: TextStyle(
            color: Styles.primaryColor.withOpacity(0.4),
            fontWeight: FontWeight.w200),
        errorStyle: TextStyle(
            color: Colors.red.withOpacity(0.8), fontWeight: FontWeight.w200),
        enabledBorder: outlineInputBorder(color: Styles.primaryColor),
        focusedBorder: outlineInputBorder(color: Styles.secondColor),
        errorBorder: outlineInputBorder(color: Styles.primaryColor),
        focusedErrorBorder: outlineInputBorder(color: Styles.secondColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 0.4, color: color),
        borderRadius: const BorderRadius.all(Radius.circular(30)));
  }
}
