// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/main.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/logged_area_page.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pageSplash extends StatefulWidget {
  const pageSplash({super.key});

  @override
  State<pageSplash> createState() => _pageSplashState();
}

class _pageSplashState extends State<pageSplash> {
  late AppModel app;
  late Usuario user;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    user = app.usuarioLogado ?? Usuario();

    _handleAuthenticated();
  }

  Future<void> _handleAuthenticated() async {
    var userPrefs = await UserSharedPreferences.getUserData();

    if (userPrefs != null) {
      user = await UsuarioController().getUserbyPrefData(
        userPrefs.signature!,
        userPrefs.email!,
      );
      user.signature = userPrefs.signature;
      app.setUser(user);

      await UserSharedPreferences.setUser(
        userguidid: user.guidid ?? "",
        usertoken: user.signature ?? "",
        email: user.email ?? "",
        nome: user.nome ?? "",
      );
    }

    _navigatorPageIntroducao();
  }

  Future<void> _navigatorPageIntroducao() async {
    await getCookies();

    Future.delayed(
      const Duration(seconds: 3),
      () {},
    ).then((value) {
      if (app.isLog() && (user.signature != null && user.signature!.isNotEmpty)) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const LoggedAreaPage()),
          ),
        );
      } else if (!Dados.jaVisualizouIntroducao) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroducaoPage(
              destino: LoggedAreaPage(),
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoggedAreaPage(),
          ),
        );
      }
    });
  }

  Future<void> getCookies() async {
    Dados.jaVisualizouCookies = await Dados.getBool('cookies');
    Dados.jaVisualizouGoverno = await Dados.getBool('governo');
    Dados.jaVisualizouIntroducao = await Dados.getBool('introducao');
    Dados.jaPermitiuLocalizacao = await Dados.getBool('localizacao');
    Dados.verTodasCategorias = await Dados.getBool('categorias');
    Dados.verTodosDestaques = await Dados.getBool('destaques');
    Dados.verTodosEspacos = await Dados.getBool('espacos');
    Dados.idiomaSalvo = await Dados.getString('idioma');
    if (Dados.jaVisualizouCookies == true) {
      MyApp.setLocale(context, Locale(Dados.idiomaSalvo, ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
