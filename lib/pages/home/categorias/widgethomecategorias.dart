// ignore_for_file: camel_case_types

import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/pages/home/categorias/widgethomecategoriascontainer.dart';

import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class widgetHomeCategorias extends StatefulWidget {
  const widgetHomeCategorias({super.key});

  @override
  State<widgetHomeCategorias> createState() => _widgetHomeCategoriasState();
}

class _widgetHomeCategoriasState extends State<widgetHomeCategorias> {

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
    return Column(
      children: [
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        widgetHeaderCards(
          titulo: "Categorias",
          subtitulo: "Ver todas",
          funcao: () {},
        ),
        const widgetEspacoH(),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Wrap(
              children: app.listaCategoria.categorias!.map(
                (e) {
                  if (e.imagens == null || e.imagens!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  //return Container();

                  return Expanded(
                    child: widgetHomeCategoriasContainer(
                      categoria: e,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
