// ignore_for_file: camel_case_types

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/introducao/introducaoinfo.dart';
import 'package:agendacultural/pages/localizacao/widgetlocalizacao.dart';
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
    await getCookies();

    print("introducao: ${Dados.jaVisualizouIntroducao}");
    print("localizacao: ${Dados.jaPermitiuLocalizacao}");
    print("governo: ${Dados.jaVisualizouGoverno}");
    print("cookies: ${Dados.jaVisualizouCookies}");

    await Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!Dados.jaVisualizouIntroducao) {
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
        } else {
          if (!Dados.jaPermitiuLocalizacao) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const Widgetlocalizacao()),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const pageLogin()),
              ),
            );
          }
        }
      },
    );
  }

  Future<void> getCookies() async {
    Dados.jaVisualizouCookies = await Dados.getBool('cookies');
    Dados.jaVisualizouGoverno = await Dados.getBool('governo');
    Dados.jaVisualizouIntroducao = await Dados.getBool('introducao');
    Dados.jaPermitiuLocalizacao = await Dados.getBool('localizacao');
    Dados.verTodasCategorias = await Dados.getBool('categorias');
    Dados.verTodosDestaques = await Dados.getBool('destaques');
    Dados.verTodosEspacos = await Dados.getBool('espacos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Semantics(
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
      ),
    );
  }
}
