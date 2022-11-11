// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class widgetTopo extends StatelessWidget {
  const widgetTopo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 10),
        widgetImagem(
          imagem: Imagem(url: './imagens/iconelaranha.png'),
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 10),
        widgetImagem(
          imagem: Imagem(url: './imagens/iconculturace.png'),
          //width: 160,
          height: 18,
          fit: BoxFit.contain,
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
