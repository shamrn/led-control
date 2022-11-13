import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:rgb_control/widgets/form_widget.dart';

class ConfEntryScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ConfEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController hostController = TextEditingController();
    TextEditingController portController = TextEditingController();
    TextEditingController tokenController = TextEditingController();
    TextEditingController poolIdController = TextEditingController();

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(
          left: Styles.horizontalPrimaryPadding,
          right: Styles.horizontalPrimaryPadding),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormWidget(
                keyboardType: TextInputType.number,
                name: Texts.ipFieldName,
                textController: hostController,
              ),
              const SizedBox(
                height: 10,
              ),
              FormWidget(
                  keyboardType: TextInputType.number,
                  name: Texts.portFieldName,
                  textController: portController),
              const SizedBox(
                height: 10,
              ),
              FormWidget(
                  keyboardType: TextInputType.text,
                  name: Texts.tokenFieldName,
                  textController: tokenController),
              const SizedBox(
                height: 10,
              ),
              FormWidget(
                  keyboardType: TextInputType.number,
                  name: Texts.poolIdFieldName,
                  textController: poolIdController),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Styles.secondColor,
                    side:
                        const BorderSide(width: 0.4, color: Styles.secondColor),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29, vertical: 17),
                  ),
                  onPressed: () {
                    HapticFeedback.vibrate();

                    if (_formKey.currentState!.validate()) {
                      Api.host = hostController.text;
                      Api.port = portController.text;
                      Api.token = tokenController.text;
                      Api.poolId = poolIdController.text;

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home_screen', (Route<dynamic> route) => false);
                    }
                  },
                  child: const Text(
                    Texts.connectButtonText,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                  ))
            ],
          )),
    )));
  }
}
