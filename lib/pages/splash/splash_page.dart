import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agendacultural/main.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/pages/logged_area_page.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/pages/introduction/presenter/page/introduction_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppModel app;
  Usuario user = Usuario();

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    user = app.usuarioLogado ?? Usuario();

    _verifyAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: gradientPrincipal),
        child: Center(
          child: Image.asset('imagens/logo_idm_white.png', height: 200, width: 200),
        ),
      ),
    );
  }

  Future<void> _verifyAuthenticated() async {
    var userPrefs = await UserSharedPreferences.getUserData();

    if (userPrefs != null) {
      user = await UsuarioController().getUserbyPrefData(userPrefs.signature!, userPrefs.email!);
      user.signature = userPrefs.signature;
      app.setUser(user);

      await UserSharedPreferences.setUser(
        userguidid: user.guidid ?? '',
        usertoken: user.signature ?? '',
        email: user.email ?? '',
        nome: user.nome ?? '',
      );
    }

    _navigatorIntroduction();
  }

  Future<void> _navigatorIntroduction() async {
    await _getCookies();

    if (app.isLog() && (user.signature != null && user.signature!.isNotEmpty)) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const LoggedAreaPage()),
        ),
      );
    } else if (!Dados.jaVisualizouIntroducao) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroductionPage(),
        ),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoggedAreaPage(),
        ),
      );
    }
  }

  Future<void> _getCookies() async {
    //Puxa os dados necessários do SharedPreferences
    Dados.jaVisualizouCookies = await Dados.getBool('cookies');
    Dados.jaVisualizouGoverno = await Dados.getBool('governo');
    Dados.jaVisualizouIntroducao = await Dados.getBool('introducao');
    Dados.jaPermitiuLocalizacao = await Dados.getBool('localizacao');
    Dados.verTodasCategorias = await Dados.getBool('categorias');
    Dados.verTodosDestaques = await Dados.getBool('destaques');
    Dados.verTodosEspacos = await Dados.getBool('espacos');
    Dados.idiomaSalvo = await Dados.getString('idioma');
    if (Dados.jaVisualizouCookies) {
      if (!mounted) return;
      MyApp.setLocale(context, Locale(Dados.idiomaSalvo, ''));
    }
  }
}
