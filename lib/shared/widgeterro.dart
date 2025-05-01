import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void widgetErro({
  String titulo = 'Atenção',
  required String descricao,
  required BuildContext context,
}) {
  AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      title: titulo,
      desc: descricao,
      btnOkOnPress: () {},
      btnOkIcon: Icons.check,
      btnOkColor: Colors.red,
      width: 400
  ).show();
}
