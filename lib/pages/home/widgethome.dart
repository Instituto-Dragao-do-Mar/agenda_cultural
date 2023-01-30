// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/espacos/widgethomeespacos.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:agendacultural/pages/home/categorias/widgethomecategorias.dart';
import 'package:agendacultural/pages/evento/widgethomeeventos.dart';
import 'package:agendacultural/pages/home/widgethomeminhalocalizacao.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                widgetHomeMinhaLocalizacao(),
                widgetHomeCategorias(),
                widgetBtnFiltro(),
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

class widgetBtnFiltro extends StatelessWidget {
  const widgetBtnFiltro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const pageFiltroCompleto(),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(child: SizedBox.shrink()),
          Text('Filtrar'),
          SizedBox(width: 5),
          widgetImagemInterna(
            imagem: Imagem(
              url: 'filtro.png',
            ),
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
