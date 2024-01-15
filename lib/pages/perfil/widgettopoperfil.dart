// ignore_for_file: camel_case_types, must_be_immutable

import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:flutter/material.dart';

class widgetTopoPerfil extends StatelessWidget {
  Function? notify;
  widgetTopoPerfil({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Perfil",
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      semanticsLabel: "Página de ",
      funcaoImagem2: () {
        UserSharedPreferences.resetUser().then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const pageLogin(),
            ),
          ),
        );
      },
      urlImagem2: 'Logout.png',
      labelImagem2: "Sair do aplicativo",
      labelImagem1: "Voltar para página anterior",
    );
  }
}

/*
class widgetTopoPerfil extends StatelessWidget {
  Function? notify;

  widgetTopoPerfil({Key? key, this.notify}) : super(key: key);

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
                 notify!();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageLogin(),
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
*/