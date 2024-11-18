import 'package:flutter/material.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';
import 'package:agendacultural/pages/home/location/area_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/handler/home_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/area_events.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/area_spaces.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/categories/area_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_handler.store.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return Container(
          color: corBgAtual,
          child: SingleChildScrollView(
            controller: _handler.store.scrollControllerGeneral,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                AreaLocationWidget(
                  onTapNavigateLocation: () => Modular.to.pushNamed(RouterApp.logged + RouterApp.myLocation),
                ),
                AreaCategoryWidget(
                  scrollControllerCategories: _handler.store.scrollControllerCategories,
                  categories: _handler.appStore.categories,
                  showAllCategories: _handler.store.allCategories,
                  selectedCategory: _handler.store.selectedCategory,
                  onTapExpandCategories: () => _handler.store.setAllCategories(!_handler.store.allCategories),
                  applyFilterCategory: (categoria) {
                    if (_handler.store.selectedCategory == categoria) {
                      _handler.store.selectedCategory = null;
                    } else {
                      _handler.store.selectedCategory = categoria;
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
                if (_handler.store.eventsProminenceFiltered.isNotEmpty)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.prominence,
                    title: AppLocalizations.of(context)!.home_emphasis_title,
                    subtitle: _handler.store.eventsProminenceFiltered.length > 9
                        ? _handler.store.allEventsProminence
                            ? AppLocalizations.of(context)!.home_emphasis_less
                            : AppLocalizations.of(context)!.home_emphasis_all
                        : '',
                    showAllEvents: _handler.store.allEventsProminence,
                    onTapExpandEvents: () => _handler.store.setAllEventsProminence(!_handler.store.allEventsProminence),
                    events: _handler.store.eventsProminenceFiltered,
                    spaces: _handler.appStore.spaces,
                    categories: _handler.appStore.categories,
                    favorites: _handler.appStore.favorites,
                    user: _handler.appStore.userLogged,
                  ),
                if (_handler.store.eventsDateFiltered.isNotEmpty)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.date,
                    title: filterDateToString(context, _handler.store.filterDate),
                    filterDateSelected: _handler.store.filterDate,
                    onItemSelected: (value) {
                      _handler.store.setFilterDate(
                        FilterDate.values.firstWhere((element) => filterDateToString(context, element) == value),
                      );
                      _filterEventsByDate(_handler.store.filterDate);
                    },
                    events: _handler.store.eventsDateFiltered,
                    spaces: _handler.appStore.spaces,
                    categories: _handler.appStore.categories,
                    favorites: _handler.appStore.favorites,
                    user: _handler.appStore.userLogged,
                  ),
                AreaSpacesWidget(
                  scrollControllerSpaces: _handler.store.scrollControllerSpaces,
                  spaces: _handler.store.spacesFiltered,
                  showAllSpaces: _handler.store.allSpaces,
                  onTapExpandSpaces: () {
                    _handler.store.setAllSpaces(!_handler.store.allSpaces);

                    if (_handler.store.allSpaces) {
                      _handler.store.setSpacesFiltered(
                        _handler.appStore.spaces.where((space) => space.aprovado == 1).toList(),
                      );
                    } else {
                      _handler.store.setSpacesFiltered(
                        _handler.appStore.spaces.where((space) => space.aprovado == 1).toList().take(9).toList(),
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
    _handler.store.setIsLoading(true);
    await Future.delayed(const Duration(milliseconds: 500));

    //Events
    _filterEventsByDate(_handler.store.filterDate);
    _initEventsProminence();

    //Spaces
    _handler.store.setSpacesFiltered(
      _handler.appStore.spaces.where((space) => space.aprovado == 1).toList().take(9).toList(),
    );

    _handler.store.setIsLoading(false);
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
    _handler.store.setEventsDateFiltered(
      _handler.appStore.events.where((event) {
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
    final eventsProminence = _handler.appStore.events.where((event) {
      // Ignora eventos que não estão aprovados.
      if (event.aprovado != 1) {
        return false;
      }

      // Verifica se o evento está em destaque.
      return event.destaque == 1;
    }).toList();

    // Aplica o filtro com base no valor de allEventsProminence.
    _handler.store.setEventsProminenceFiltered(
      _handler.store.allEventsProminence
          ? eventsProminence // Mostra todos os eventos destacados.
          : eventsProminence.take(9).toList(), // Limita a 9 eventos destacados.
    );
  }
}
