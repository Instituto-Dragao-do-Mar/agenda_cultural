// ignore_for_file: camel_case_types, must_be_immutable, unused_import

import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:flutter/material.dart';

import '../../../model/fonts.dart';
import '../../../shared/constantes.dart';
import '../../../shared/text_contrast_font.dart';

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
      child: TextContrastFont(
        text: subtitulo,
        style: FontsApp.roboto16W400Grey(FontsApp.tamanhoBase),
        semantics: subtitulo,
      ),
    );
  }
}
