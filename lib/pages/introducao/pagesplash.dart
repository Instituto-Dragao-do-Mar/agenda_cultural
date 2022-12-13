// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/introducao/introducaoinfo.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class pageSplash extends StatefulWidget {
  const pageSplash({super.key});

  @override
  State<pageSplash> createState() => _pageSplashState();
}

class _pageSplashState extends State<pageSplash> {
  @override
  void initState() {
    super.initState();
    _navigatorPageIntroducao();
  }

  _navigatorPageIntroducao() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const pageIntroducao(
                  destino: Introducaoinfo(
                    destino: pageLogin(),
                  ),
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Iniciando agenda Cultural",
      child: Container(
        decoration: BoxDecoration(
          gradient: gradientPrincipal,
        ),
        child: Center(
          child: widgetImagemInterna(
            width: 178,
            height: 178,
            imagem: Imagem(
              url: 'logobranco.png',
            ),
          ),
        ),
      ),
    );
  }
}
