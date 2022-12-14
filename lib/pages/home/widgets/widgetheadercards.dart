// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgetTextFonteContraste.dart';

class widgetHeaderCards extends StatelessWidget {
  const widgetHeaderCards({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.funcao,
  });

  final String titulo;
  final String subtitulo;
  final VoidCallback funcao;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextContrasteFonte(
          text: titulo,
          weight: FontWeight.w600,
          semantics: titulo,
        ),
        GestureDetector(
          onTap: () => funcao,
          child: TextContrasteFonte(
            text: subtitulo,
            color: corBackgroundLaranja,
            weight: FontWeight.w600,
            semantics: subtitulo,
          ),
        )
      ],
    );
  }
}
