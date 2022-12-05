import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/home/acessibilidade/widgetacessibilidade.dart';
import 'package:agendacultural/pages/home/localizacao/widgetlocalizacao.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/pages/introducao/introducaoinfo.dart';
import 'package:agendacultural/pages/introducao/pagesplash.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetalertdialog.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
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
      debugShowCheckedModeBanner: false,
      title: 'Agenda Cultural',
      theme: themeDefault,
      home: const pageSplash(),
    );
  }
}
