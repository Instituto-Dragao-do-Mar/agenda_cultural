// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/espacos/widgethomeespacoscontainer.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class widgetHomeEspacos extends StatefulWidget {
  const widgetHomeEspacos({
    super.key,
  });

  @override
  State<widgetHomeEspacos> createState() => _widgetHomeEspacosState();
}

class _widgetHomeEspacosState extends State<widgetHomeEspacos> {
  ScrollController scrollController = ScrollController();

  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    bool wrap = false;

    if (!Dados.verTodosEspacos) {
      wrap = true;
    }

    int contadorDisplay = 0;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        widgetHeaderCards(
          titulo: 'Espaços',
          subtitulo: Dados.verTodosEspacos
              ? 'Ver menos espaços'
              : 'Ver todos os espaços',
          funcao: () async {
            //
            Dados.verTodosEspacos = !Dados.verTodosEspacos;
            await Dados.setBool('espacos', Dados.verTodosEspacos);
            setState(() {});
            //
          },
        ),
        SizedBox(
          height: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: app.listaEspacos.espacos!.length,
            itemBuilder: (context, index) {
              if (wrap && contadorDisplay > 9) {
                return const SizedBox.shrink();
              }
              if (app.listaEspacos.espacos![index].aprovado == 0) {
                return const SizedBox.shrink();
              }
              if (app.listaEspacos.espacos![index] != null) {
                contadorDisplay++;
                return widgetHomeEspacosContainer(
                  espaco: app.listaEspacos.espacos![index],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
