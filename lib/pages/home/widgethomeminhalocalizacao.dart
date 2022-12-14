// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

import '../../model/cores.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class widgetHomeMinhaLocalizacao extends StatelessWidget {
  const widgetHomeMinhaLocalizacao({super.key});

  @override
  Widget build(BuildContext context) {

    bool statusAltoContraste = Cores.contraste;
    double fontSize = Fontes.tamanhoBase.toDouble();

    return Row(
      children: [
        TextContrasteFonte(
          text: "Minha Localização",
          color: corBackgroundLaranja,
        ),
        SizedBox(width: 5),
        Icon(
          Icons.arrow_forward_ios,
          color: corBackgroundLaranja,
          size: fontSize,
        ),
      ],
    );
  }
}
