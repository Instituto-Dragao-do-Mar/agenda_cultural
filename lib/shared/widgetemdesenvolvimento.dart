import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void widgetMensagem({
  required BuildContext context,
  required String text,
  VoidCallback? funcaoSim,
  String buttonText = "Ok",
  String title = "Atenção",
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    // animType: AnimType.bottomSlide,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: funcaoSim ?? () {},
    btnOkText: buttonText,
   // btnOkIcon: Icons.cancel,
    btnOkColor: const Color(0XFFEA5B0C),
  ).show();
}

void widgetMensagemSuccess({
  required BuildContext context,
  required String text,
  VoidCallback? funcaoSim,
  String buttonText = "Ok",
  String title = "Atenção",
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    // animType: AnimType.bottomSlide,
    headerAnimationLoop: false,
    title: title,
    desc: text,
    btnOkOnPress: funcaoSim ?? () {},
    btnOkText: buttonText,
   // btnOkIcon: Icons.cancel,
    btnOkColor: const Color(0XFFEA5B0C),
  ).show();
}
