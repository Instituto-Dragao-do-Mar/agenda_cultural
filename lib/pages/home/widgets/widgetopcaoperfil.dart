// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../shared/constantes.dart';

class widgetopacaoperfil extends StatelessWidget {
  const widgetopacaoperfil({
    Key? key,
    required this.subtitulo,
    required this.funcao,
  }) : super(key: key);

  final String subtitulo;
  final VoidCallback funcao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => funcao,
      child: Text(
        subtitulo,
        style: roboto16W400Grey,
      ),
    );
  }
}
