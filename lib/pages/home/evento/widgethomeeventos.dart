// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/pages/home/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

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
  ListaEvento? listaEventos;

  List<String> titulos = [
    'Destaques',
    'Data',
    'Eventos',
  ];

  ScrollController scrollController = ScrollController();

  Future<void> getdados() async {
    listaEventos ??= await EventoController().eventoGet(
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            widgetHeaderCards(
              titulo: titulos[widget.exibicaoEvento.index],
              subtitulo: "Ver todos",
              funcao: () {},
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: listaEventos!.eventos!.map(
                    (e) {
                      return widgetHomeCategoriasEventosContainer(
                        evento: e,
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
