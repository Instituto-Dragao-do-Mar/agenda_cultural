import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/store/profile_store.dart';

class ProfilePageStateHandler {
  final AppStore _appStore;

  ProfilePageStateHandler(this._appStore);

  final ProfileStore _store = Modular.get();

  ProfileStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  void dispose() {}
}
