import 'package:agendacultural/model/categoria_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/pages/home/event/area_event.dart';
import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/pages/home/space/area_space.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';
import 'package:agendacultural/pages/home/category/area_category.dart';
import 'package:agendacultural/pages/home/location/area_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();

    final categoriaController = context.read<CategoriaController>();
    final espacoController = context.read<EspacoController>();
    final eventoController = context.read<EventoController>();

    if ((app.listaCategoria.categorias?.isEmpty) ?? false) {
      categoriaController.categoriaGet(userguidid: app.usuarioLogado?.guidid ?? '');
    }
    if ((app.listaEspacos.espacos?.isEmpty) ?? false) {
      espacoController.espacoGet(userguidid: app.usuarioLogado?.guidid ?? '');
    }
    if ((app.listaEventos.eventos?.isEmpty) ?? false) {
      eventoController.eventoGet(userguidid: app.usuarioLogado?.guidid ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corBgAtual,
      child: Consumer<AppModel>(
        builder: (context, app, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const AreaLocationWidget(),
                AreaCategoryWidget(
                  applyFilterCategory: (categoria) {
                    setState(() {
                      app.filtro.categoriasSelecionadas!.clear();

                      for (Categoria c in app.listaCategoria.categorias!) {
                        if (c != categoria) {
                          c.selecionada = false;
                        }
                      }

                      categoria.selecionada = !categoria.selecionada!;

                      if (!categoria.selecionada!) {
                      } else {
                        app.filtro.categoriasSelecionadas!.add(categoria);
                      }
                      app.notify();
                    });
                  },
                ),
                const ButtonFilterWidget(),
                const AreaEventWidget(exibicaoEvento: ExibicaoEvento.destaque),
                const AreaEventWidget(exibicaoEvento: ExibicaoEvento.data),
                const AreaSpaceWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
