// ignore_for_file: camel_case_types

import 'package:agendacultural/pages/localizacaopage/pagedefinirminhalocalizacao.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class widgetHomeMinhaLocalizacao extends StatelessWidget {
  const widgetHomeMinhaLocalizacao({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = Fontes.tamanhoBase.toDouble();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const pageDefinirMinhaLocalizacao(),
          ),
        );
      },
      child: Row(
        children: [
          TextContrasteFonte(
            text: "Minha Localização",
            color: corBackgroundLaranja,
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            color: corBackgroundLaranja,
            size: fontSize,
          ),
        ],
      ),
    );
  }
}
