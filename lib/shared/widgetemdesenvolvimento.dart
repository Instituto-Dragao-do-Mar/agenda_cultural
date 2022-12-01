import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void widgetErro({
  required BuildContext context,
  required String text,
  String title = "Atenção",
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.bottomSlide,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: () {},
   // btnOkIcon: Icons.cancel,
    btnOkColor: Color(0XFFEA5B0C),
  ).show();
}
