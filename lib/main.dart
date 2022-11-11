import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/introducao/introducao.dart';
import 'package:agendacultural/shared/themes.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda Cultural',
      theme: themeDefault,
      home: const pageIntroducao(
        destino:  pageLogin(), 

      ),
    );
  }
}
