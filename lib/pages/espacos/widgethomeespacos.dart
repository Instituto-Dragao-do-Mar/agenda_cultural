// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/espacos/widgethomeespacoscontainer.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../evento/widgethomeeventos.dart';

enum ExibicaoEspaco {
  Destaque,
  Data,
  Evento,
}

class widgetHomeEspacos extends StatefulWidget {
  const widgetHomeEspacos({
    required this.exibicaoEspaco,
    super.key,
  });
  final ExibicaoEspaco exibicaoEspaco;

  @override
  State<widgetHomeEspacos> createState() => _widgetHomeEspacosState();
}

class _widgetHomeEspacosState extends State<widgetHomeEspacos> {
  ScrollController scrollController = ScrollController();
  bool wrap = false;
  double? tamanho;


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

    if (widget.exibicaoEspaco == ExibicaoEspaco.Destaque) {
      if (!Dados.verTodosEspacos) {
        wrap = false;
        tamanho = 255 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase;
      } else {
        wrap = true;
      }
    }

    // if (!Dados.verTodosEspacos) {
    //   wrap = true;
    // }

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
          width: double.infinity,
          // height: (Dados.verTodasCategorias) ? null : 130,
          height: Dados.verTodosEspacos ? 500 : 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          // width: 250 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: SingleChildScrollView(
            // shrinkWrap: Dados.verTodosEspacos ? false : true,
            scrollDirection:  Dados.verTodosEspacos ? Axis.vertical : Axis.horizontal,
            controller: scrollController,
            // physics: Dados.verTodosEspacos ? const NeverScrollableScrollPhysics() : null,
            // itemCount: app.listaEspacos.espacos!.length,
            // itemBuilder: (context, index) {
            //
            // },
            child: Wrap(
              children:app.listaEspacos.espacos!.map(
                    (e) {
                      if (widget.exibicaoEspaco == ExibicaoEspaco.Destaque &&
                          wrap &&
                          contadorDisplay > 9) {
                        return const SizedBox.shrink();
                      }
                      if (widget.exibicaoEspaco == ExibicaoEspaco.Destaque && e.aprovado == 0) {
                        return const SizedBox.shrink();
                      }
                      contadorDisplay++;
                      return widgetHomeEspacosContainer(
                        espaco: e,
                      );
                                          return const SizedBox.shrink();
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
