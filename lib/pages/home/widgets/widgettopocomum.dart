// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgetperfilheader.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class widgetTopoComum extends StatelessWidget {
  String? text;
  IconButton? iconButton;
  
  widgetTopoComum({
    Key? key,
    this.text,
    this.iconButton,
    
    Imagem? imagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? text;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const widgetEspacoV(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widgetPerfilHeader(),
                  ),
                );
              },
              child: widgetImagem(
                imagem: Imagem(
                  url: 'seta.png',
                ),
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            const widgetEspacoV(largura: 18),
            Text(
              text!,
              style: poppins16W400Black,
            )
          ],
        ),
        Row(
          children: [
            iconButton!,
          ],
        ),

        const widgetEspacoV(),
      ],
    );
  }
}
