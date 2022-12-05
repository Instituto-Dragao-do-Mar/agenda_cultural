// ignore_for_file: camel_case_types

import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/pages/home/categorias/widgethomecategoriascontainer.dart';
import 'package:agendacultural/pages/home/teste.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';

class widgetHomeCategorias extends StatefulWidget {
  const widgetHomeCategorias({super.key});

  @override
  State<widgetHomeCategorias> createState() => _widgetHomeCategoriasState();
}

class _widgetHomeCategoriasState extends State<widgetHomeCategorias> {
  ListaCategorias? listaCategoria;

  ScrollController scrollController = ScrollController();

  Future<void> getdados() async {
    listaCategoria ??= await CategoriaController().categoriaGet(
      userguidid: "userguidid",
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdados(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: corBackground,
            ),
          );
        }       

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
                  children: listaCategoria!.categorias!.map(
                    (e) {
                      if (e == null ||
                          e.imagens == null ||
                          e.imagens!.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      //return Container();

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
      },
    );
  }
}
