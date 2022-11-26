// ignore_for_file: camel_case_types

import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/introducao/introducaoinfo.dart';
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
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => pageIntroducao(
                destino: Introducaoinfo(
                  destino: pageLogin(),
                ),
              )),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffEA5B0C),
              Color(0xffE83C3B),
            ],
          ),
        ),
        child: Center(
            child: Image.network(
          width: 178,
          height: 178,
          semanticLabel: "Iniciando Agenda Cultural",
          "./imagens/splash.png",
        )));
  }
}
