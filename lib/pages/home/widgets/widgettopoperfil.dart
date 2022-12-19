// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/widgethome.dart';
import 'package:agendacultural/pages/home/widgetperfil.dart';
import 'package:agendacultural/pages/home/widgetperfilheader.dart';
import 'package:agendacultural/pages/principal/home.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetespacov.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../model/app_model.dart';
import '../../../model/fontes.dart';

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
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            )
          ],
        ),
        const Expanded(child: SizedBox.shrink()),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: pageLogin(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => pageLogin(),
                //   ),
                // );
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
