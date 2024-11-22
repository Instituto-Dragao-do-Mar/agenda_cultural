import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/auth/presenter/store/auth_store.dart';

class AuthPageStateHandler {
  final AppStore _appStore;

  AuthPageStateHandler(this._appStore);

  final AuthStore _store = Modular.get();

  AuthStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    _appStore.setUser(User());
  }

  void dispose() => _store.dispose();
}
