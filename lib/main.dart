import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/pages/splash/splash_page.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/controller/categoria_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  int fonte = await Dados.getInt('tamanhofontebase');
  if (fonte == 0) {
    await Dados.setInt('tamanhofontebase', 16);
    fonte = 16;
  }
  Fontes.setTamanhoBase(fonte);

  bool altoContraste = await Dados.getBool('altocontraste');
  Cores.setAltoContraste(altoContraste);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseController>.value(
          value: BaseController(),
        ),
        ChangeNotifierProvider<AppModel>.value(
          value: AppModel(),
        ),
        ChangeNotifierProvider<UsuarioController>.value(
          value: UsuarioController(),
        ),
        ChangeNotifierProvider<EventoController>.value(
          value: EventoController(),
        ),
        ChangeNotifierProvider<CategoriaController>.value(
          value: CategoriaController(),
        ),
        ChangeNotifierProvider<EspacoController>.value(
          value: EspacoController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      title: 'Cultura.CE',
      theme: themeDefault,
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }
}
