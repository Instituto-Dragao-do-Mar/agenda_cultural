// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:flutter/material.dart';

import '../../../model/imagem_model.dart';
import '../../../shared/widgetimagem.dart';

class widgetTopoPerfil extends StatelessWidget {
  const widgetTopoPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const widgetEspacoV(),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: widgetImagem(
                imagem: Imagem(
                  url: './imagens/seta.png',
                ),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            const widgetEspacoV(largura: 18),
            Text(
              "Perfil",
              style: poppins16W400Black,
            )
          ],
        ),
      const Expanded(child: SizedBox.shrink()),

        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: widgetImagem(
                imagem: Imagem(
                  url: './imagens/Logout.png',
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
    );
  }
}
