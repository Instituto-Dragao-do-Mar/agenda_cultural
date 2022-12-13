// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../model/fontes.dart';
import '../../../shared/constantes.dart';

class widgetopacaoperfil extends StatelessWidget {
  const widgetopacaoperfil({
    Key? key,
    required this.subtitulo,
    required this.paginaDestino,
  }) : super(key: key);

  final String subtitulo;
  final Widget paginaDestino;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => paginaDestino,
          ),
        );
      },
      child: Text(
        subtitulo,
        style: Fontes.roboto16W400Grey(Fontes.tamanhoBase),
        semanticsLabel: subtitulo,
      ),
    );
  }
}
