// ignore_for_file: camel_case_types
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

import '../../../model/fontes.dart';

class widgetTopoComum extends StatelessWidget {
  const widgetTopoComum({
    Key? key,
    this.text,
    this.urlImagem1,
    this.urlImagem2,
    this.funcaoImagem1,
    this.funcaoImagem2,
  }) : super(key: key);

  final String? urlImagem1;
  final String? urlImagem2;
  final String? text;
  final Function? funcaoImagem1;
  final Function? funcaoImagem2;

  @override
  Widget build(BuildContext context) {
    Widget widget1;

    if (urlImagem1 == null) {
      widget1 = const SizedBox.shrink();
    } else {
      widget1 = GestureDetector(
        onTap: () {
          if (funcaoImagem1 != null) {
            funcaoImagem1!();
          }
        },
        child: widgetImagemInterna(
          imagem: Imagem(
            url: urlImagem1,
          ),
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      );
    }
    Widget widget2;
    if (urlImagem2 == null) {
      widget2 = const SizedBox.shrink();
    } else {
      widget2 = GestureDetector(
          onTap: () {
            if (funcaoImagem2 != null) {
              funcaoImagem2!();
            }
          },
          child: widgetImagemInterna(
            imagem: Imagem(
              url: urlImagem2,
            ),
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ));
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          widget1,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text ?? "",
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            ),
          ),
          widget2,
        ],
      ),
    );
  }
}
