// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

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
        Text(
          titulo,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          semanticsLabel: titulo,
        ),
        GestureDetector(
          onTap: () => funcao,
          child: Text(
            subtitulo,
            style: TextStyle(
              fontSize: 14,
              color: corBackground,
              fontWeight: FontWeight.w600,
            ),
            semanticsLabel: subtitulo,
          ),
        )
      ],
    );
  }
}
