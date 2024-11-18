import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/app/modules/splash/presenter/handler/splash_state_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();

    _initData();
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

  void _initData() async {
    int fonte = await Dados.getInt('tamanhofontebase');
    if (fonte == 0) {
      await Dados.setInt('tamanhofontebase', 16);
      fonte = 16;
    }
    Fontes.setTamanhoBase(fonte);

    bool altoContraste = await Dados.getBool('altocontraste');
    Cores.setAltoContraste(altoContraste);
  }

  void _verifyAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));
    var userPrefs = await UserSharedPreferences.getUserData();

    if (userPrefs != null) {
      _handler.appStore.setUser(await UsuarioController().getUserbyPrefData(
        userPrefs.signature!,
        userPrefs.email!,
      ));
      _handler.appStore.setSignatureUser(userPrefs.signature ?? '');

      await UserSharedPreferences.setUser(
        userguidid: _handler.appStore.userLogged.guidid ?? '',
        usertoken: _handler.appStore.userLogged.signature ?? '',
        email: _handler.appStore.userLogged.email ?? '',
        nome: _handler.appStore.userLogged.nome ?? '',
      );
    }

    _navigatorIntroduction();
  }

  void _navigatorIntroduction() async {
    await _getCookies();

    //Verifica se o usuário já visualizou a introdução
    if (!Dados.jaVisualizouIntroducao) {
      Modular.to.navigate(RouterApp.introduction);
      return;
    }

    if (!mounted) return;
    Modular.to.navigate(RouterApp.logged);
  }

  Future<void> _getCookies() async {
    //Puxa os dados do SharedPreferences e verifica se o usuário já visualizou os cookies
    Dados.jaVisualizouCookies = await Dados.getBool('cookies');
    Dados.jaVisualizouGoverno = await Dados.getBool('governo');
    Dados.jaVisualizouIntroducao = await Dados.getBool('introducao');
    Dados.jaPermitiuLocalizacao = await Dados.getBool('localizacao');
    Dados.idiomaSalvo = await Dados.getString('idioma');
    if (Dados.jaVisualizouCookies) {
      if (!mounted) return;
      AppWidget.setLocale(context, Locale(Dados.idiomaSalvo, ''));
    }
  }
}
