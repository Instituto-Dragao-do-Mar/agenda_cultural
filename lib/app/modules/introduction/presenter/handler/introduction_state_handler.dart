import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/introduction/presenter/store/introduction_store.dart';

class IntroductionPageStateHandler {
  final AppStore _appStore;

  IntroductionPageStateHandler(this._appStore);

  final IntroductionStore _store = Modular.get();

  IntroductionStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  void dispose() => _store.dispose();
}
