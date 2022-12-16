// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/espacos/widgethomeespacos.dart';
import 'package:agendacultural/pages/home/categorias/widgethomecategorias.dart';
import 'package:agendacultural/pages/evento/widgethomeeventos.dart';
import 'package:agendacultural/pages/home/widgethomeminhalocalizacao.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class widgetHome extends StatefulWidget {
  const widgetHome({super.key});

  @override
  State<widgetHome> createState() => _widgetHomeState();
}

class _widgetHomeState extends State<widgetHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: corBgAtual,
        child: Consumer<AppModel>(
          builder: (context, app, child) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                widgetHomeMinhaLocalizacao(),
                widgetHomeCategorias(),
                widgetHomeEventos(
                  exibicaoEvento: ExibicaoEvento.Destaque,
                ),
                widgetHomeEventos(
                  exibicaoEvento: ExibicaoEvento.Data,
                ),
                widgetHomeEspacos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
