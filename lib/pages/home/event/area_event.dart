import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_date/dart_date.dart';
import 'package:menu_button/menu_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/pages/home/event/item_event.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/home/general/header_areas_home.dart';

enum ExibicaoEvento { destaque, data, evento }

class AreaEventWidget extends StatefulWidget {
  final ExibicaoEvento exibicaoEvento;
  final String? titulo;

  const AreaEventWidget({
    super.key,
    required this.exibicaoEvento,
    this.titulo,
  });

  @override
  State<AreaEventWidget> createState() => _AreaEventWidgetState();
}

class _AreaEventWidgetState extends State<AreaEventWidget> {
  List<String> titulos = ['Destaques', 'Data', 'Eventos'];
  ScrollController scrollController = ScrollController();
  String? selectedKey;
  bool wrap = false;
  String subtitulo = '';
  Widget? wdata;

  late AppModel app;

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
    titulos[0] = AppLocalizations.of(context)!.home_emphasis_title;
    titulos[1] = app.filtro.filtroDataSelecionado!.filtrodatatostring(context);

    if (widget.exibicaoEvento == ExibicaoEvento.destaque) {
      if (!Dados.verTodosDestaques) {
        wrap = false;
      } else {
        wrap = true;
      }
    }

    if (widget.exibicaoEvento == ExibicaoEvento.destaque) {
      subtitulo = Dados.verTodosDestaques
          ? AppLocalizations.of(context)!.home_emphasis_less
          : AppLocalizations.of(context)!.home_emphasis_all;
    }

    if (widget.exibicaoEvento == ExibicaoEvento.data) {
      List<String> keys = <String>[
        FiltroData.estasemana.filtrodatatostring(context),
        FiltroData.proximasemana.filtrodatatostring(context),
        FiltroData.proximomes.filtrodatatostring(context),
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
          app.filtro.filtroDataSelecionado = FiltroData.values.firstWhere((element) {
            return element.filtrodatatostring(context) == value;
          });
          setState(() {});
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
                    text: app.filtro.filtroDataSelecionado!.filtrodatatostring(context),
                    color: corBackgroundLaranja,
                    weight: FontWeight.w600,
                    semantics: app.filtro.filtroDataSelecionado!.filtrodatatostring(context),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: corBackgroundLaranja,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      );
    }

    List<int> listSelecionadas = app.filtro.categoriasSelecionadas!.map((e) => e.id!).toList();
    List<int> listCategoriasEvento = [];

    for (Evento e in app.listaEventos.eventos!) {
      listCategoriasEvento.addAll(e.eventoscategorias!.map((c) => c.idcategoria!).toList());
    }

    listSelecionadas.removeWhere((element) => !listCategoriasEvento.contains(element));

    if (app.filtro.categoriasSelecionadas!.isNotEmpty && listSelecionadas.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.exibicaoEvento == ExibicaoEvento.destaque) {
      List<Evento> eventosDestaqueComDestaque = [];

      for (Evento e in app.listaEventos.eventos!) {
        List<int> listaCategoriasEvento = e.eventoscategorias!.map((c) => c.idcategoria!).toList();
        List<int> listaSelecionadas = app.filtro.categoriasSelecionadas!.map((e) => e.id!).toList();

        if (listaSelecionadas.every((categoriaId) => listaCategoriasEvento.contains(categoriaId))) {
          if (e.destaque != 0) {
            eventosDestaqueComDestaque.add(e);
          }
        }
      }

      if (eventosDestaqueComDestaque.isEmpty) {
        return const SizedBox.shrink();
      }
    }

    String d1 = '', d2 = '';

    if (app.filtro.filtroDataSelecionado == FiltroData.estasemana) {
      d1 = DateTime.now().toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now().endOfWeek.format('yyyy-MM-dd 23:59:59');
    }
    if (app.filtro.filtroDataSelecionado == FiltroData.proximasemana) {
      d1 = DateTime.now().nextWeek.startOfWeek.addDays(1).toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now().nextWeek.endOfWeek.format('yyyy-MM-dd 23:59:59');
    }
    if (app.filtro.filtroDataSelecionado == FiltroData.proximomes) {
      d1 = DateTime.now().nextMonth.startOfMonth.toString().formatDate(
            format: 'yyyy-MM-dd',
          );
      d2 = DateTime.now()
          .nextMonth
          .endOfMonth
          .add(const Duration(hours: 23, minutes: 59, seconds: 59))
          .format('yyyy-MM-dd HH:mm:ss');
    }

    DateTime dini = DateTime.parse(d1);
    DateTime dfim = DateTime.parse(d2);

    int contadorEvento = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        HeaderCardsCategoryWidget(
          titulo: widget.titulo ?? titulos[widget.exibicaoEvento.index],
          subtitulo: subtitulo,
          funcao: () async {
            if (widget.exibicaoEvento == ExibicaoEvento.destaque) {
              Dados.verTodosDestaques = !Dados.verTodosDestaques;
              await Dados.setBool('categorias', Dados.verTodosDestaques);
              setState(() {});
            }
          },
          widget: widget.exibicaoEvento == ExibicaoEvento.destaque ? null : wdata,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 270 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: app.listaEventos.eventos!.length,
            itemBuilder: (context, index) {
              if (!app.listaEventos.eventos![index].passoupelofiltro!) {
                return const SizedBox.shrink();
              }

              try {
                if (widget.exibicaoEvento == ExibicaoEvento.destaque && wrap && contadorEvento > 9) {
                  return const SizedBox.shrink();
                }

                if (widget.exibicaoEvento == ExibicaoEvento.destaque &&
                    app.listaEventos.eventos![index].destaque == 0) {
                  return const SizedBox.shrink();
                }

                if (widget.exibicaoEvento == ExibicaoEvento.destaque && app.filtro.categoriasSelecionadas!.isEmpty) {
                  contadorEvento++;
                  return ItemEventWidget(
                    evento: app.listaEventos.eventos![index],
                  );
                }

                if (widget.exibicaoEvento == ExibicaoEvento.evento) {
                  return ItemEventWidget(
                    evento: app.listaEventos.eventos![index],
                  );
                }

                if (widget.exibicaoEvento == ExibicaoEvento.destaque) {
                  Evento e = app.listaEventos.eventos![index];

                  List<int> listSel = app.filtro.categoriasSelecionadas!.map((e) => e.id!).toList();

                  List<int> listCategoriasEvento = e.eventoscategorias!.map((e) => e.idcategoria!).toList();

                  listSel.removeWhere((element) => !listCategoriasEvento.contains(element));

                  if (listSel.isNotEmpty) {
                    contadorEvento++;
                    return ItemEventWidget(
                      evento: e,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                if (widget.exibicaoEvento == ExibicaoEvento.data) {
                  Evento e = app.listaEventos.eventos![index];

                  bool dataTaNaLista = false;
                  for (Eventodatas d in e.eventosdatas!) {
                    if (DateTime.parse(d.datahora!).isAfter(dini) && DateTime.parse(d.datahora!).isBefore(dfim)) {
                      dataTaNaLista = true;
                    }
                  }

                  if (dataTaNaLista) {
                    if (app.filtro.categoriasSelecionadas != null && app.filtro.categoriasSelecionadas!.isNotEmpty) {
                      List<int> listSel = app.filtro.categoriasSelecionadas!.map((e) => e.id!).toList();

                      List<int> listCategoriasEvento = e.eventoscategorias!.map((e) => e.idcategoria!).toList();

                      listSel.removeWhere((element) => !listCategoriasEvento.contains(element));

                      if (listSel.isNotEmpty) {
                        contadorEvento++;
                        return ItemEventWidget(
                          evento: e,
                        );
                      }
                    } else {
                      contadorEvento++;
                      return ItemEventWidget(
                        evento: e,
                      );
                    }
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
