// ignore_for_file: camel_case_types, must_be_immutable, unused_import

import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:flutter/material.dart';

import '../../../model/fontes.dart';
import '../../../shared/constantes.dart';
import '../../../shared/widgetTextFonteContraste.dart';

class widgetopacaoperfil extends StatelessWidget {
  widgetopacaoperfil(
      {Key? key,
      required this.subtitulo,
        this.paginaDestino,
      this.funcao})
      : super(key: key);

  final String subtitulo;
  Widget? paginaDestino;
  VoidCallback? funcao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcao ?? () {
        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => paginaDestino ?? const widgetEmConstrucao(),
                ),
              );
      },
      child: TextContrasteFonte(
        text: subtitulo,
        style: Fontes.roboto16W400Grey(Fontes.tamanhoBase),
        semantics: subtitulo,
      ),
    );
  }
}
