import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/acessibilidade/widgetacessibilidade.dart';
import 'package:agendacultural/pages/localizacao/widgetlocalizacao.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/introducao/introducaoinfo.dart';
import 'package:agendacultural/pages/introducao/pagesplash.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetalertdialog.dart';
import 'package:flutter/material.dart';
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

  initializeDateFormatting("pt_BR", null).then(
    (_) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppModel>.value(
          value: AppModel(),
        )
      ],
      child: const MyApp(),
    )),
  );
}

// Future initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'pt_BR'), // English, no country code
        //Locale('en'),
      ], */
      debugShowCheckedModeBanner: false,
      title: 'Agenda Cultural',
      theme: themeDefault,
      home: const pageSplash(),
      //home: const pageLogin(),
    );
  }
}
