/// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgetperfilheader.dart';

import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class widgetTopoComum extends StatelessWidget {
  const widgetTopoComum({
    Key? key,
    this.urlImagem1,
    this.text,
    this.urlImagem2,
    this.funcao,
  }) : super(key: key);

  final String? urlImagem1;
  final String? urlImagem2;
  final String? text;
  final Function? funcao;

  /*

widgetTopoComum(
      text: "teste",
      urlImagem2: 'imagem',
      funcao: () {
       
      },
    );

  */

  @override
  Widget build(BuildContext context) {
    // bool _boleano = boleano ?? false;
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const widgetEspacoV(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: urlImagem1 == null
                    ? const SizedBox.shrink()
                    : widgetImagem(
                        imagem: Imagem(
                          url: urlImagem1,
                        ),
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              const widgetEspacoV(largura: 18),
              text == null
                  ? const SizedBox.shrink()
                  : Text(
                      text!,
                      style: poppins16W400Black,
                    )
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          urlImagem2 == null
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (funcao != null) {
                          funcao!();
                        }
                      },
                      child: widgetImagem(
                        imagem: Imagem(
                          url: urlImagem2,
                        ),
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
          const widgetEspacoV(),
        ],
      ),
    );
  }
}