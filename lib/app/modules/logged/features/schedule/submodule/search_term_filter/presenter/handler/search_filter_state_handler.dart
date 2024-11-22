import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/orders.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/submodule/search_term_filter/presenter/store/search_filter_store.dart';

class SearchFilterPageStateHandler {
  final AppStore _appStore;

  SearchFilterPageStateHandler(this._appStore);

  final SearchFilterStore _store = Modular.get();

  SearchFilterStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    if (_appStore.events.isEmpty) {
      _appStore.setEvents(await EventController().getEvents());
      await sortEvents(_appStore.events);
    }

    _store.setEventsFilter(_appStore.events);
    _store.searchController.addListener(
      () => _store.eventsFilter = _appStore.events.where((event) {
        return event.nome?.toLowerCase().contains(_store.searchController.text.toLowerCase()) ?? false;
      }).toList(),
    );
  }

  void uploadDataFavorites(bool isDetail) async {
    if (isDetail) _store.setIsLoading(true);

    _appStore.setFavorites(
      await EventController().getFavorites(
        userGuidId: _appStore.userLogged.guidid ?? '',
        token: _appStore.userLogged.signature ?? '',
      ),
    );

    if (isDetail) _store.setIsLoading(false);
  }

  void dispose() => _store.dispose();
}
