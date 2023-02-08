// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/evento/widgethomeeventoscontainer.dart';
import 'package:agendacultural/pages/home/widgets/widgetheadercards.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_date/dart_date.dart';
import 'package:menu_button/menu_button.dart';

enum ExibicaoEvento {
  Destaque,
  Data,
  Evento,
}

class widgetHomeEventos extends StatefulWidget {
  const widgetHomeEventos({
    super.key,
    required this.exibicaoEvento,
    this.titulo,
  });

  final ExibicaoEvento exibicaoEvento;
  final String? titulo;

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

  String? selectedKey;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    app.filtro.filtroDataSelecionado ??= FiltroData.estasemana;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    titulos[1] = app.filtro.filtroDataSelecionado!.filtrodatatostring;
    double? tamanho;
    bool wrap = false;
    Widget? wdata;

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
          : "Ver todos os destaques";
    }

    if (widget.exibicaoEvento == ExibicaoEvento.Data) {
      List<String> keys = <String>[
        FiltroData.estasemana.filtrodatatostring,
        FiltroData.proximasemana.filtrodatatostring,
        FiltroData.proximomes.filtrodatatostring,
      ];
      subtitulo = "";
      wdata = MenuButton<String>(
        decoration: null,
        items: keys,
        itemBuilder: (String value) => Container(
          height: 40,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
          child: Text(value),
        ),
        onItemSelected: (String value) {
          // setState(() {
          app.filtro.filtroDataSelecionado = FiltroData.values
              .firstWhere((element) => element.filtrodatatostring == value);
          //print(app.filtro.filtroDataSelecionado!.filtrodatatostring);
          // });
          app.notify();
        },
        child: SizedBox(
          width: 200,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextContrasteFonte(
                    text: app.filtro.filtroDataSelecionado!.filtrodatatostring,
                    color: corBackgroundLaranja,
                    weight: FontWeight.w600,
                    semantics:
                        app.filtro.filtroDataSelecionado!.filtrodatatostring,
                  ),
                  /* Text(
                    app.filtro.filtroDataSelecionado!.filtrodatatostring,
                    overflow: TextOverflow.ellipsis,
                  ) */
                ),
                const SizedBox(
                  width: 12,
                  height: 17,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
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

    String d1 = '', d2 = '';

    if (app.filtro.filtroDataSelecionado == FiltroData.estasemana) {
      d1 = DateTime.now().toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now().endOfWeek.format('yyyy-MM-dd');
    }
    if (app.filtro.filtroDataSelecionado == FiltroData.proximasemana) {
      d1 = DateTime.now().nextWeek.startOfWeek.addDays(1).toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now().nextWeek.endOfWeek.format('yyyy-MM-dd');
    }
    if (app.filtro.filtroDataSelecionado == FiltroData.proximomes) {
      d1 = DateTime.now().nextMonth.startOfMonth.toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now()
          .nextMonth
          .endOfMonth
          .addMinutes(-1)
          .format('yyyy-MM-dd');
    }

    DateTime dini = DateTime.parse(d1);
    DateTime dfim = DateTime.parse(d2);

    int contadorEvento = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        widgetHeaderCards(
          titulo: widget.titulo ?? titulos[widget.exibicaoEvento.index],
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
          widget:
              widget.exibicaoEvento == ExibicaoEvento.Destaque ? null : wdata,
        ),
        SizedBox(
          height: 270 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: app.listaEventos.eventos!.length,
            itemBuilder: (context, index) {
              //return Container(width: 100, height: 100,);

              if (!app.listaEventos.eventos![index].passoupelofiltro!) {
                return const SizedBox.shrink();
              }

              try {
                if (widget.exibicaoEvento == ExibicaoEvento.Destaque &&
                    wrap &&
                    contadorEvento > 9) {
                  return const SizedBox.shrink();
                }

                if (widget.exibicaoEvento == ExibicaoEvento.Destaque &&
                    app.listaEventos.eventos![index].destaque == 0) {
                  return const SizedBox.shrink();
                }

                if (widget.exibicaoEvento == ExibicaoEvento.Destaque &&
                    app.filtro.categoriasSelecionadas!.isEmpty) {
                  contadorEvento++;
                  return widgetHomeCategoriasEventosContainer(
                    evento: app.listaEventos.eventos![index],
                  );
                }

                if (widget.exibicaoEvento == ExibicaoEvento.Evento) {
                  return widgetHomeCategoriasEventosContainer(
                    evento: app.listaEventos.eventos![index],
                  );
                }
                //
                // CATEGORIA AGORA É SOMENTE UMA
                //

                if (widget.exibicaoEvento == ExibicaoEvento.Destaque) {
                  List<int> listSel = app.filtro.categoriasSelecionadas!
                      .map((e) => e.id!)
                      .toList();
                  List<int> listCategoriasEvento = app
                      .listaEventos.eventos![index].eventoscategorias!
                      .map((e) => e.idcategoria!)
                      .toList();

                  listSel.removeWhere(
                      (element) => !listCategoriasEvento.contains(element));

                  if (listSel.isNotEmpty) {
                    contadorEvento++;
                    return widgetHomeCategoriasEventosContainer(
                      evento: app.listaEventos.eventos![index],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }
                if (widget.exibicaoEvento == ExibicaoEvento.Data) {
                  Evento e = app.listaEventos.eventos![index];

                  bool dataTaNaLista = false;
                  for (Eventodatas d in e.eventosdatas!) {
                    if (DateTime.parse(d.datahora!).isAfter(dini) &&
                        DateTime.parse(d.datahora!).isBefore(dfim)) {
                      dataTaNaLista = true;
                    }
                  }

                  if (dataTaNaLista) {
                    contadorEvento++;
                    return widgetHomeCategoriasEventosContainer(
                      evento: e,
                    );
                  }

                  return const SizedBox.shrink();
                }
              } catch (e) {
                return Text("Erro ${e.toString()}");
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
