import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/store/home_store.dart';

class HomePageStateHandler {
  final AppStore _appStore;

  HomePageStateHandler(this._appStore);

  final HomeStore _store = Modular.get();

  HomeStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  void dispose() => _store.dispose();
}
