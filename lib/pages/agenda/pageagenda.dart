// ignore_for_file: camel_case_types

import 'dart:html';

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/agenda/widgetpageagendavisualizarpordia.dart';
import 'package:agendacultural/pages/home/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pageAgenda extends StatefulWidget {
  const pageAgenda({super.key});

  @override
  State<pageAgenda> createState() => _pageAgendaState();
}

class _pageAgendaState extends State<pageAgenda> {
  TextEditingController tedInicio = TextEditingController(
    text: DateTime.now().add(Duration(days: -60)).toIso8601String(),
  );
  TextEditingController tedTermino = TextEditingController(
    text: DateTime.now().add(const Duration(days: 15)).toIso8601String(),
  );

  late AppModel app;
  List<DateTime> listDatas = [];
  DateTime? dataSelecionada = DateTime.now().add(const Duration(days: -400));

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
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escolha uma data',
                style: poppins16W400Black,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: getDate(
                      ted: tedInicio,
                      titulo: "De:",
                      primeiro: true,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: getDate(
                      ted: tedTermino,
                      titulo: "Até:",
                      primeiro: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Visualizar por dia',
                style: poppins16W400Black,
              ),
              const SizedBox(height: 10),
              widgetMostraDias(),
              const SizedBox(height: 10),
              Text(
                'Resultados',
                style: poppins16W400Black,
              ),
              const SizedBox(height: 10),
              Wrap(
                children: app.listaEventos.eventos!.map(
                  (e) {
                    List<DateTime> datasEventos = app.getEventoDatas(e);

                    /*  print(datasEventos.toList());
                    print("--------------------------------------------");*/

                    List<DateTime> ldatasIntervalo =
                        listDatas = calculateDaysInterval(
                      DateTime.parse(tedInicio.text.substring(0, 10)),
                      DateTime.parse(tedTermino.text.substring(0, 10)),
                    );

                    print("Datas intervalos: ");
                    print(listDatas.toList());
                    print("============================================");
                    print(" ");
                    print(" ");
                    print(" ");
                    print("Datas evento ${e.nome} ");
                    print(datasEventos.toList());
                    print("============================================");

                    bool dentro = false;
                    for (DateTime dia in datasEventos) {
                      if (ldatasIntervalo
                          .any((element) => element.compareTo(dia) == 0)) {
                        dentro = true;
                      }
                    }

                    if (!dentro) {
                      return const SizedBox.shrink();
                    }

                    return widgetHomeCategoriasEventosContainer(
                      evento: e,
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  Widget widgetMostraDias() {
    listDatas = calculateDaysInterval(
      DateTime.parse(tedInicio.text.substring(0, 10)),
      DateTime.parse(tedTermino.text.substring(0, 10)),
    );

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: listDatas
            .map(
              (e) => GestureDetector(
                onTap: () {
                  setState(() {
                    dataSelecionada = e;
                  });
                },
                child: widgetPageAgendaVisualizarPorDia(
                  data: e,
                  selecionada: e == dataSelecionada!,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getDate({
    required TextEditingController ted,
    required String titulo,
    required bool primeiro,
  }) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          //locale: const Locale("pt_BR"),
          initialDate: DateTime.tryParse(ted.text)!, //get today's date
          firstDate: DateTime
              .now().add(Duration(days: -360)), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime.now().add(const Duration(days: 180)),
        );
        if (pickedDate != null) {
          ted.text = pickedDate.toIso8601String();

          if (tedInicio.text.compareTo(tedTermino.text) > 0) {
            tedInicio.text = tedTermino.text;
          }

          setState(() {});
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(primeiro ? 10 : 0),
            bottomLeft: Radius.circular(primeiro ? 10 : 0),
            topRight: Radius.circular(!primeiro ? 10 : 0),
            bottomRight: Radius.circular(!primeiro ? 10 : 0),
          ),
          border: Border.all(
            color: corBackground.withOpacity(.2),
          ),
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(titulo),
            const SizedBox(width: 5),
            Text(ted.text.formatDate(format: "E, dd MMM"))
          ],
        ),
        //child: Text("xxxx"),
      ),
    );
  }
}

class pageAgendaTopo extends StatelessWidget {
  const pageAgendaTopo({super.key});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Agenda",
      funcaoImagem2: () async {},
      urlImagem2: 'seta.png',
    );
  }
}
