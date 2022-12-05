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

class widgetTopoPerfil extends StatelessWidget {
  const widgetTopoPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? text;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
              child: widgetImagemInterna(
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
              "Perfil",
              style: poppins16W400Black,
            )
          ],
        ),
        const Expanded(child: SizedBox.shrink()),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pagePrincipal(),
                  ),
                );
              },
              child: widgetImagemInterna(
                imagem: Imagem(
                  url: 'Logout.png',
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
