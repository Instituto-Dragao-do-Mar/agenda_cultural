import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/handler/home_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/area_events.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/spaces/area_spaces.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/area_location.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/general/button_filter.dart';
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
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
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
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: AreaLocationWidget(
                    onTapNavigateLocation: () => Modular.to.pushNamed(RouterApp.logged + RouterApp.myLocation),
                  ),
                ),
                AreaCategoryWidget(
                  scrollControllerCategories: _handler.store.scrollControllerCategories,
                  categories: _handler.appStore.categories,
                  showAllCategories: _handler.store.allCategories,
                  selectedCategory: _handler.store.selectedCategory,
                  onTapExpandCategories: () => _handler.store.setAllCategories(!_handler.store.allCategories),
                  applyFilterCategory: (categoria) {
                    LogController logController = LogController();

                    if (_handler.store.selectedCategory == categoria) {
                      _handler.store.selectedCategory = null;
                      _handler.filterEventsByDate(_handler.store.filterDate, _handler.store.setEventsDateFiltered);
                      _handler.initEventsProminence();
                    } else {
                      User user = _handler.appStore.userLogged;

                      logController.postLog(
                        idLogTipo: 8,
                        guidUsuario: user.guidid ?? '',
                        observacao: 'Usuário ${user.guidid != null ? '${user.nome}' : 'não identificado'} '
                            'selecionou a categoria ${categoria.nome} para filtro de eventos.',
                      );

                      _handler.store.selectedCategory = categoria;
                      _handler.filterEventsByDate(_handler.store.filterDate, _handler.store.setEventsDateFiltered);
                      _handler.filterEventsByDate(
                        _handler.store.filterDate,
                        _handler.store.setEventsProminenceFiltered,
                      );
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      if (_handler.appStore.isFilterOpen)
                        GestureDetector(
                          onTap: () {
                            _handler.appStore.setEventsFiltered([]);
                            _handler.appStore.setOptionSelectedSpace('');
                            _handler.appStore.setOptionSelectedPeriode('');
                            _handler.appStore.setOptionSelectedCategory('');
                            _handler.appStore.setOptionSelectedClassification('');
                            _handler.appStore.setOptionSelectedAccessibility('');
                            _handler.appStore.setOptionSelectedTicket('');
                            _handler.appStore.setIsFilterOpen(false);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.close, color: corBackgroundLaranja),
                                const Text('Limpar Filtros'),
                              ],
                            ),
                          ),
                        ),
                      const Spacer(),
                      ButtonFilterWidget(
                        onTapNavigateFilter: () => Modular.to.pushNamed(RouterApp.logged + RouterApp.filters),
                      ),
                    ],
                  ),
                ),
                if (_handler.store.eventsProminenceFiltered.isNotEmpty && !_handler.appStore.isFilterOpen)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.prominence,
                    title: AppLocalizations.of(context)!.home_emphasis_title,
                    subtitle: _handler.store.eventsProminenceFiltered.length >= 10
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
                    onConcludeFavorite: _handler.uploadDataFavorites,
                  ),
                if (_handler.store.eventsDateFiltered.isNotEmpty && !_handler.appStore.isFilterOpen)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.date,
                    title: filterDateToString(context, _handler.store.filterDate),
                    filterDateSelected: _handler.store.filterDate,
                    onItemSelected: (value) {
                      _handler.store.setFilterDate(
                        FilterDate.values.firstWhere((element) => filterDateToString(context, element) == value),
                      );
                      _handler.filterEventsByDate(_handler.store.filterDate, _handler.store.setEventsDateFiltered);
                    },
                    events: _handler.store.eventsDateFiltered,
                    spaces: _handler.appStore.spaces,
                    categories: _handler.appStore.categories,
                    favorites: _handler.appStore.favorites,
                    user: _handler.appStore.userLogged,
                    onConcludeFavorite: _handler.uploadDataFavorites,
                  ),
                if (_handler.appStore.isFilterOpen)
                  AreaEventsWidget(
                    exhibitionEvent: ExhibitionEvent.eventMap,
                    title: AppLocalizations.of(context)!.schedule_results,
                    events: _handler.appStore.eventsFiltered,
                    spaces: _handler.appStore.spaces,
                    categories: _handler.appStore.categories,
                    favorites: _handler.appStore.favorites,
                    user: _handler.appStore.userLogged,
                    onConcludeFavorite: _handler.uploadDataFavorites,
                  ),
                if (_handler.appStore.isFilterOpen && _handler.appStore.eventsFiltered.isEmpty)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: const Text('Nenhum evento encontrado com os filtros selecionados.'),
                  ),
                AreaSpacesWidget(
                  scrollControllerSpaces: _handler.store.scrollControllerSpaces,
                  spacesFiltered: _handler.store.spacesFiltered,
                  events: _handler.appStore.events,
                  spaces: _handler.appStore.spaces,
                  categories: _handler.appStore.categories,
                  favorites: _handler.appStore.favorites,
                  showAllSpaces: _handler.store.allSpaces,
                  onTapExpandSpaces: () {
                    _handler.store.setAllSpaces(!_handler.store.allSpaces);

                    if (_handler.store.allSpaces) {
                      _handler.store.setSpacesFiltered(
                        _handler.appStore.spaces.where((space) => space.aprovado == 1).toList(),
                      );
                    } else {
                      _handler.store.setSpacesFiltered(
                        _handler.appStore.spaces.where((space) => space.aprovado == 1).toList().take(10).toList(),
                      );
                    }
                  },
                  user: _handler.appStore.userLogged,
                  onConcludeFavorite: _handler.uploadDataFavorites,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
