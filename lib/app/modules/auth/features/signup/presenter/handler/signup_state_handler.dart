import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/store/signup_store.dart';

class SignupPageStateHandler {
  final AppStore _appStore;

  SignupPageStateHandler(this._appStore);

  final SignupStore _store = Modular.get();

  SignupStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  Future<void> saveCadastro(BuildContext context, bool mounted) async {
    UserController userController = UserController();
    _store.setIsLoading(true);

    if (_store.email.characters.isEmpty || _store.name.characters.isEmpty || _store.password.characters.isEmpty) {
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.login_notify_empty,
      );
      _store.setIsLoading(false);
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_store.email)) {
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.login_notify_invalid,
      );
      _store.setIsLoading(false);
      return;
    }

    if (_store.rulesMatch != 4) {
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.registern_notify_weak_password,
      );
      _store.setIsLoading(false);
      return;
    }

    if (_store.password != _store.confirmPassword) {
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.register_notify_different_passwords,
      );
      _store.setIsLoading(false);
      return;
    }

    if (!_store.isChecked) {
      notifyPopUpWidget(
        context: context,
        description: AppLocalizations.of(context)!.register_notify_accept_terms,
      );
      _store.setIsLoading(false);
      return;
    }

    var errorMessage = await userController.postUsers(
      nome: _store.name,
      email: _store.email,
      senha: _store.password,
    );

    if (errorMessage != '') {
      if (!mounted) return;
      notifyPopUpWidget(context: context, description: errorMessage ?? '');
      _store.setIsLoading(false);
      return;
    }

    if (!mounted) return;
    notifyPopUpWidget(
      context: context,
      labelPrincipal: AppLocalizations.of(context)!.register_notify_register_conclude,
      description: AppLocalizations.of(context)!.register_notify_register_conclude_text,
      labelButton: AppLocalizations.of(context)!.int_button_enter,
      error: false,
      functionButton: () async {
        LogController logController = LogController();

        User user = await userController.login(
          email: _store.email,
          senha: _store.password,
          alterPassword: false,
          appStore: _appStore,
        );

        if (user.guidid != null && user.guidid != '') {
          await logController.postLog(
            idLogTipo: 1,
            guidUsuario: user.guidid ?? '',
            observacao: 'Usuário ${user.nome} realizou login',
          );

          _store.setIsLoading(false);
          _appStore.setUser(user);
          _appStore.setCurrentScreen(_appStore.screens[0]);
          _appStore.setCurrentTab(0);
          Modular.to.navigate(RouterApp.logged);
        } else {
          _store.setIsLoading(false);
          Modular.to.navigate(RouterApp.auth + RouterApp.signin);
        }
      },
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
