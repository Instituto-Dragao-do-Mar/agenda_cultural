import 'package:agendacultural/controller/usuario_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/introducao/pagesplash.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/cores.dart';

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
        ChangeNotifierProvider<AppModel>.value(
          value: AppModel(),
        ),
        ChangeNotifierProvider<UsuarioController>.value(
          value: UsuarioController(),
        )
      ],
      child: const MyApp(),
    ),
  );

  /* initializeDateFormatting("pt_BR", null).then(
    (_) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppModel>.value(
          value: AppModel(),
        ),
        ChangeNotifierProvider<UsuarioController>.value(
          value: UsuarioController(),
        )
      ],
      child: const MyApp(),
    )),
  ); */
}

// Future initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: true,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Cultura.CE',
      theme: themeDefault,
      home: const pageSplash(),
      // home: const pageLogin(),
      builder: EasyLoading.init(),
    );
  }
}
