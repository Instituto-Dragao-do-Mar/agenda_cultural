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
import 'package:agendacultural/pages/splash/store/splash_store.dart';
import 'package:agendacultural/pages/introduction/presenter/page/introduction_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppModel _app;
  final _splashStore = SplashStore();

  @override
  void initState() {
    super.initState();
    _app = context.read<AppModel>();
    _splashStore.setUser(_app.usuarioLogado ?? Usuario());

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
      _splashStore.setUser(await UsuarioController().getUserbyPrefData(
        userPrefs.signature!,
        userPrefs.email!,
      ));
      _splashStore.setSignatureUser(userPrefs.signature ?? '');
      _app.setUser(_splashStore.user);

      await UserSharedPreferences.setUser(
        userguidid: _splashStore.user.guidid ?? '',
        usertoken: _splashStore.user.signature ?? '',
        email: _splashStore.user.email ?? '',
        nome: _splashStore.user.nome ?? '',
      );
    }

    _navigatorIntroduction();
  }

  Future<void> _navigatorIntroduction() async {
    await _getCookies();

    //Verifica se o usuário já visualizou a introdução
    if (!Dados.jaVisualizouIntroducao) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroductionPage(),
        ),
      );
      return;
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoggedAreaPage(),
      ),
    );
  }

  Future<void> _getCookies() async {
    //Puxa os dados do SharedPreferences e verifica se o usuário já visualizou os cookies
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
