// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ExibicaoEvento {
  Destaque,
  Data,
  Evento,
}

class widgetHomeEventos extends StatefulWidget {
  const widgetHomeEventos({
    super.key,
    required this.exibicaoEvento,
  });

  final ExibicaoEvento exibicaoEvento;

  @override
  State<widgetHomeEventos> createState() => _widgetHomeEventosState();
}

class _widgetHomeEventosState extends State<widgetHomeEventos> {
  List<String> titulos = [
    'Destaques',
    'Data',
    'Eventos',
  ];

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
    double? tamanho;
    bool wrap = false;

    if (widget.exibicaoEvento == ExibicaoEvento.Destaque) {
      if (!Dados.verTodosDestaques) {
        wrap = false;
        tamanho = 255 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase;
      } else {
        wrap = true;
      }
    }

    String subtitulo = '';

    if (widget.exibicaoEvento == ExibicaoEvento.Destaque) {
      subtitulo = Dados.verTodosDestaques
          ? "Ver menos destaques"
          : "Ver todos os destados ";
    }

    if (widget.exibicaoEvento == ExibicaoEvento.Data) {
      subtitulo =
          Dados.verTodosDestaques ? "Ver outro periodo" : "Ver outro periodo";
    }

    List<int> listSelecionadas =
        app.filtro.categoriasSelecionadas!.map((e) => e.id!).toList();

    List<int> listCategoriasEvento = [];
    for (Evento e in app.listaEventos.eventos!) {
      listCategoriasEvento
          .addAll(e.eventoscategorias!.map((c) => c.idcategoria!).toList());
    }

    listSelecionadas
        .removeWhere((element) => !listCategoriasEvento.contains(element));

    if (app.filtro.categoriasSelecionadas!.isNotEmpty &&
        listSelecionadas.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        widgetHeaderCards(
          titulo: titulos[widget.exibicaoEvento.index],
          subtitulo: subtitulo,
          funcao: () async {
            //
            if (widget.exibicaoEvento == ExibicaoEvento.Destaque) {
              Dados.verTodosDestaques = !Dados.verTodosDestaques;
              await Dados.setBool('categorias', Dados.verTodosDestaques);
              setState(() {});
            }
            //
          },
        ),
        SizedBox(
          width: double.infinity,
          height: tamanho,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            scrollDirection: wrap ? Axis.vertical : Axis.horizontal,
            child: Wrap(
              children: app.listaEventos.eventos!.map(
                (e) {
                  if (app.filtro.categoriasSelecionadas!.isEmpty) {
                    return widgetHomeCategoriasEventosContainer(
                      evento: e,
                    );
                  } else {
                    //
                    // VERIFICAR SE TEM ELEMENTOS EM COMUM NA LISTA
                    //
                    List<int> listSel = app.filtro.categoriasSelecionadas!
                        .map((e) => e.id!)
                        .toList();
                    List<int> listCategoriasEvento = e.eventoscategorias!
                        .map((e) => e.idcategoria!)
                        .toList();

                    listSel.removeWhere(
                        (element) => !listCategoriasEvento.contains(element));

                    if (listSel.isNotEmpty) {
                      return widgetHomeCategoriasEventosContainer(
                        evento: e,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
