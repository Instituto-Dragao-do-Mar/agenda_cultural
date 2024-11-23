import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
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
                      _handler.filterEventsByDate(_handler.store.filterDate, _handler.store.setEventsDateFiltered);
                      _handler.initEventsProminence();
                    } else {
                      _handler.store.selectedCategory = categoria;
                      _handler.filterEventsByDate(_handler.store.filterDate, _handler.store.setEventsDateFiltered);
                      _handler.filterEventsByDate(
                        _handler.store.filterDate,
                        _handler.store.setEventsProminenceFiltered,
                      );
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
                if (_handler.store.eventsDateFiltered.isNotEmpty)
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
