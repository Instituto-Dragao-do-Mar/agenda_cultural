import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/presenter/store/splash_store.dart';

class SplashPageStateHandler {
  final AppStore _appStore;

  SplashPageStateHandler(this._appStore);

  final SplashStore _store = Modular.get();

  SplashStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  void dispose() => _store.dispose();
}
