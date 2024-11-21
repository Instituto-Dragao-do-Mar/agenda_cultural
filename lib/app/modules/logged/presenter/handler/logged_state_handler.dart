import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/logged/presenter/store/logged_area_store.dart';

class LoggedPageStateHandler {
  final AppStore _appStore;

  LoggedPageStateHandler(this._appStore);

  final LoggedAreaStore _store = Modular.get();

  LoggedAreaStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  Future<void> setScreen(int index) async {
    _appStore.setCurrentScreen(_appStore.screens[index]);
    _appStore.setCurrentTab(index);
  }

  void dispose() => _store.dispose();
}
