// ignore_for_file: camel_case_types

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/categorias/widgethomecategoriascontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
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
    /*print("builder categorias");
    print(app.listaCategoria.categorias![1].toJson());
    print(app.listaCategoria.categorias![2].toJson());
    print(app.listaCategoria.categorias![3].toJson());
    print(app.listaCategoria.categorias![4].toJson());*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        widgetHeaderCards(
          titulo: "Categorias",
          subtitulo: Dados.verTodasCategorias
              ? "Ver menos categorias"
              : "Ver todas as categorias",
          funcao: () async {
            Dados.verTodasCategorias = !Dados.verTodasCategorias;
            await Dados.setBool('categorias', Dados.verTodasCategorias);
            setState(() {});
          },
        ),
        const widgetEspacoH(),
        SizedBox(
          width: double.infinity,
          height: (Dados.verTodasCategorias) ? null : 130,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            scrollDirection:
                Dados.verTodasCategorias ? Axis.vertical : Axis.horizontal,
            child: Wrap(
              children: app.listaCategoria.categorias!.map(
                (e) {
                  if (e.imagens == null || e.imagens!.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return widgetHomeCategoriasContainer(
                    categoria: e,
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
