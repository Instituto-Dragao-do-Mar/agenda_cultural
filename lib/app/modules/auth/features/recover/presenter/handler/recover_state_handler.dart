import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/recover/presenter/store/recover_store.dart';

class RecoverPageStateHandler {
  final AppStore _appStore;

  RecoverPageStateHandler(this._appStore);

  final RecoverStore _store = Modular.get();

  RecoverStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  Future<void> recoverPassword(BuildContext context, bool mounted) async {
    UserController userController = UserController();
    _store.setIsLoading(true);

    if (_store.password.characters.isEmpty || _store.confirmPassword.characters.isEmpty) {
      notifyPopUpWidget(
        context: context,
        description: 'Os campos precisam ser preenchidos.',
      );
      _store.setIsLoading(false);
      return;
    }

    if (_store.rulesMatch != 4) {
      notifyPopUpWidget(
        context: context,
        description: 'Senha fraca.',
      );
      _store.setIsLoading(false);
      return;
    }

    if (_store.password != _store.confirmPassword) {
      notifyPopUpWidget(
        context: context,
        description: 'Senhas não coincidem.',
      );
      _store.setIsLoading(false);
      return;
    }

    var errorMessage = await userController.recoverPassword(
      email: _appStore.userLogged.email ?? '',
      newPassword: _store.password,
    );

    if (errorMessage != '') {
      if (!mounted) return;
      notifyPopUpWidget(context: context, description: errorMessage);
      _store.setIsLoading(false);
      return;
    }

    if (!mounted) return;
    notifyPopUpWidget(
      context: context,
      labelPrincipal: 'Senha alterada!',
      description: 'Clique no botão abaixo para prosseguir para o login.',
      labelButton: 'Entrar',
      error: false,
      functionButton: () => Modular.to.navigate(RouterApp.auth),
    );
    _store.setIsLoading(false);
    return;
  }

  void onChangedAndVerifyPassword(String value) {
    value.characters.length >= 6 ? _store.setHaveMinDigits(1) : _store.setHaveMinDigits(0);
    value.contains(RegExp(r'[0-9]')) ? _store.setHaveNumber(1) : _store.setHaveNumber(0);
    value.contains(RegExp(r'[a-z]')) ? _store.setHaveLowerCase(1) : _store.setHaveLowerCase(0);
    value.contains(RegExp(r'[A-Z]')) ? _store.setHaveUpperCase(1) : _store.setHaveUpperCase(0);

    var half1Rules = _store.haveUpperCase + _store.haveLowerCase;
    var half2Rules = _store.haveNumber + _store.haveMinDigits;

    _store.setRulesMatch(half1Rules + half2Rules);
    _store.setPassword(value);
  }

  void dispose() => _store.dispose();
}
