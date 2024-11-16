import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';
import 'package:agendacultural/pages/home/location/area_location.dart';
import 'package:agendacultural/pages/my_location/page/my_location_page.dart';
import 'package:agendacultural/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/store/home_store.dart';
import 'package:agendacultural/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/events/area_events.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/spaces/area_spaces.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/categories/area_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppModel app;
  final _homeStore = HomeStore();

  @override
  void initState() {
    app = context.read<AppModel>();
    _initializeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_homeStore.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return Container(
          color: corBgAtual,
          child: SingleChildScrollView(
            controller: _homeStore.scrollControllerGeneral,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                AreaLocationWidget(
                  onTapNavigateLocation: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLocationPage()),
                  ),
                ),
                AreaCategoryWidget(
                  scrollControllerCategories: _homeStore.scrollControllerCategories,
                  categories: _homeStore.categories,
                  showAllCategories: _homeStore.allCategories,
                  selectedCategory: _homeStore.selectedCategory,
                  onTapExpandCategories: () => _homeStore.setAllCategories(!_homeStore.allCategories),
                  applyFilterCategory: (categoria) {
                    if (_homeStore.selectedCategory == categoria) {
                      _homeStore.selectedCategory = null;
                    } else {
                      _homeStore.selectedCategory = categoria;
                    }
                  },
                ),
                ButtonFilterWidget(
                  onTapNavigateFilter: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FiltroCompletoPage(),
                    ),
                  ),
                ),
                if (_homeStore.eventsProminenceFiltered.isNotEmpty)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.prominence,
                    title: AppLocalizations.of(context)!.home_emphasis_title,
                    subtitle: _homeStore.eventsProminenceFiltered.length > 9
                        ? _homeStore.allEventsProminence
                            ? AppLocalizations.of(context)!.home_emphasis_less
                            : AppLocalizations.of(context)!.home_emphasis_all
                        : '',
                    showAllEvents: _homeStore.allEventsProminence,
                    onTapExpandEvents: () => _homeStore.setAllEventsProminence(!_homeStore.allEventsProminence),
                    events: _homeStore.eventsProminenceFiltered,
                  ),
                AreaEventsWidget(
                  exhibitionEvent: ExhibitionEvent.date,
                  title: filterDateToString(context, _homeStore.filterDate),
                  events: _homeStore.eventsDateFiltered,
                  filterDateSelected: _homeStore.filterDate,
                  onItemSelected: (value) {
                    _homeStore.setFilterDate(
                      FilterDate.values.firstWhere((element) => filterDateToString(context, element) == value),
                    );
                    _filterEventsByDate(_homeStore.filterDate);
                  },
                ),
                AreaSpacesWidget(
                  scrollControllerSpaces: _homeStore.scrollControllerSpaces,
                  spaces: _homeStore.spacesFiltered,
                  showAllSpaces: _homeStore.allSpaces,
                  onTapExpandSpaces: () {
                    _homeStore.setAllSpaces(!_homeStore.allSpaces);

                    if (_homeStore.allSpaces) {
                      _homeStore.setSpacesFiltered(_homeStore.spaces.where((space) => space.aprovado == 1).toList());
                    } else {
                      _homeStore.setSpacesFiltered(
                        _homeStore.spaces.where((space) => space.aprovado == 1).toList().take(9).toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _initializeData() async {
    _homeStore.setIsLoading(true);

    _homeStore.setCategories(await CategoriaController().categoriaGet());
    _homeStore.setEvents(await EventoController().eventoGet());
    await _sortEvents();
    _filterEventsByDate(_homeStore.filterDate);
    _initEventsProminence();
    _homeStore.setSpaces(await EspacoController().espacoGet());
    _homeStore.setSpacesFiltered(_homeStore.spaces.where((space) => space.aprovado == 1).toList().take(9).toList());

    _homeStore.setIsLoading(false);
  }

  Future<void> _sortEvents() async {
    // Ordena os eventos na lista com base nas datas de início e fim.
    _homeStore.events.sort((a, b) {
      // Obtém a data e hora inicial do primeiro evento de cada lista.
      var dateTimeA = a.eventosdatas?.first.datahora;
      var dateTimeB = b.eventosdatas?.first.datahora;

      // Converte as strings para objetos DateTime locais.
      var dateA = DateTime.parse(dateTimeA!).toLocal();
      var dateB = DateTime.parse(dateTimeB!).toLocal();

      // Compara as datas (ano, mês e dia) sem considerar horas.
      var compareResultado = DateTime(dateA.year, dateA.month, dateA.day).compareTo(
        DateTime(dateB.year, dateB.month, dateB.day),
      );

      // Se as datas forem diferentes, retorna o resultado da comparação.
      if (compareResultado != 0) {
        return compareResultado;
      }

      // Se as datas forem iguais, obtém a data de fim para desempate.
      var dateFinishA = a.eventosdatas?.first.datafim ?? a.eventosdatas?.first.datainicio;
      var dateFinishB = b.eventosdatas?.first.datafim ?? b.eventosdatas?.first.datainicio;

      // Calcula os dias restantes até o fim para cada evento.
      var diasParaFimA = _calculateDaysToFinish(dateFinishA, dateTimeA);
      var diasParaFimB = _calculateDaysToFinish(dateFinishB, dateTimeB);

      // Compara os dias restantes e retorna o resultado.
      return diasParaFimA.compareTo(diasParaFimB);
    });
  }

  int _calculateDaysToFinish(String? dataFim, String? dataInicio) {
    // Se a data de fim for válida, calcula os dias restantes.
    if (dataFim != null && dataInicio != null) {
      var dateFinishDateTime = DateTime.parse(dataFim);
      var dateInitialDateTime = DateTime.parse(dataInicio);
      // Calcula a diferença em dias entre as datas.
      var daysForFinish = dateFinishDateTime.difference(dateInitialDateTime).inDays;
      return daysForFinish;
    }
    // Se as datas não forem válidas, retorna 0.
    return 0;
  }

  void _filterEventsByDate(FilterDate filterDate) {
    String d1 = '', d2 = '';

    // Define o intervalo de datas com base no filtro selecionado.
    if (filterDate == FilterDate.thisWeek) {
      d1 = DateTime.now().toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().endOfWeek.format('yyyy-MM-dd 23:59:59');
    } else if (filterDate == FilterDate.nextWeek) {
      d1 = DateTime.now().nextWeek.startOfWeek.toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().nextWeek.endOfWeek.format('yyyy-MM-dd 23:59:59');
    } else if (filterDate == FilterDate.nextMonth) {
      d1 = DateTime.now().nextMonth.startOfMonth.toString().formatDate(format: 'yyyy-MM-dd');
      d2 = DateTime.now().nextMonth.endOfMonth.format('yyyy-MM-dd HH:mm:ss');
    }

    // Converte as strings para DateTime.
    DateTime dini = DateTime.parse(d1);
    DateTime dfim = DateTime.parse(d2);

    // Filtra os eventos com base no intervalo de datas e se estão aprovados.
    _homeStore.setEventsDateFiltered(
      _homeStore.events.where((event) {
        bool dateInList = false;

        // Ignora eventos que não estão aprovados.
        if (event.aprovado != 1) {
          return false;
        }

        // Verifica se a data de cada evento está no intervalo definido.
        for (var d in event.eventosdatas ?? []) {
          var dataEvento = DateTime.parse(d.datahora ?? '');
          if (dataEvento.isAfter(dini) && dataEvento.isBefore(dfim)) {
            dateInList = true;
            break; // Interrompe a busca, pois um evento dentro do intervalo é suficiente.
          }
        }

        return dateInList;
      }).toList(),
    );
  }

  void _initEventsProminence() {
    final eventsProminence = _homeStore.events.where((event) {
      // Ignora eventos que não estão aprovados.
      if (event.aprovado != 1) {
        return false;
      }

      // Verifica se o evento está em destaque.
      return event.destaque == 1;
    }).toList();

    // Aplica o filtro com base no valor de allEventsProminence.
    _homeStore.setEventsProminenceFiltered(
      _homeStore.allEventsProminence
          ? eventsProminence // Mostra todos os eventos destacados.
          : eventsProminence.take(9).toList(), // Limita a 9 eventos destacados.
    );
  }
}
