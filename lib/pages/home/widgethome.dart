// ignore_for_file: camel_case_types

import 'package:agendacultural/pages/home/categorias/widgethomecategorias.dart';
import 'package:agendacultural/pages/home/evento/widgethomeeventos.dart';
import 'package:agendacultural/pages/home/widgethomeminhalocalizacao.dart';
import 'package:flutter/material.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            widgetHomeMinhaLocalizacao(),
            widgetHomeCategorias(),
            widgetHomeEventos(
              exibicaoEvento: ExibicaoEvento.Destaque,
            ),
            widgetHomeEventos(
              exibicaoEvento: ExibicaoEvento.Data,
            ),
          ],
        ),
      ),
    );
  }
}
