// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/agenda/widgetpageagendavisualizarpordia.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/filtro/pagefiltro.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetimagem.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/cores.dart';
import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class pageAgenda extends StatefulWidget {
  const pageAgenda({super.key});

  @override
  State<pageAgenda> createState() => _pageAgendaState();
}

class _pageAgendaState extends State<pageAgenda> {
  TextEditingController tedInicio = TextEditingController(
    text: DateTime.now().toIso8601String(),
  );
  TextEditingController tedTermino = TextEditingController(
    text: DateTime.now().add(const Duration(days: 30)).toIso8601String(),
  );

  late AppModel app;
  List<DateTime> listDatas = [];
  DateTime dataSelecionada = DateTime.now().add(const Duration(days: -400));

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Escolha uma data',
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
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
              style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
            ),
            const SizedBox(height: 10),
            widgetMostraDias(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextContrasteFonte(
                  text: 'Resultados',
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Text('Filtrar'),
                      const SizedBox(width: 5),
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
                ),
              ],
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

                  if (!dataSelecionada
                      .compareTo(DateTime.now().add(const Duration(days: -1)))
                      .isNegative) {
                    //
                    // Cai aqui se uma data for selecionada.
                    //
                    //

                    for (DateTime dia in datasEventos) {
                      if (dia.compareTo(dataSelecionada) == 0) {
                        return widgetHomeCategoriasEventosContainer(
                          evento: e,
                        );
                      }
                    }
                    return const SizedBox.shrink();
                  }

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
                  selecionada: e == dataSelecionada,
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
          locale: const Locale("pt"),
          initialDate: DateTime.tryParse(ted.text)!,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 180)),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFFE83C3B),
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
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
            color: Cores.contraste
                ? Colors.white
                : corBackgroundLaranja.withOpacity(.2),
          ),
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContrasteFonte(
              text: titulo,
              color: corBackgroundLaranja,
              weight: FontWeight.bold,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
            const SizedBox(width: 5),
            TextContrasteFonte(
              text: ted.text.formatDate(format: "E, dd MMM"),
              color: corTextAtual,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
          ],
        ),
        //child: Text("xxxx"),
      ),
    );
  }
}

// ignore: must_be_immutable
class pageAgendaTopo extends StatelessWidget {
  Function? notify;

  pageAgendaTopo({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: "Agenda",
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      labelImagem1: "Voltar para tela anterior",
      labelImagem2: "Ir para tela de filtros",
      semanticsLabel: "Página de ",
      funcaoImagem2: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const pageFiltro(),
          ),
        );
      },
      urlImagem2: 'favoritos.png',
    );
  }
}
