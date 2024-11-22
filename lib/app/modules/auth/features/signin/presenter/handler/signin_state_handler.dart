import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/controller/user_controller.dart';
import 'package:agendacultural/pages/acesso/pageNovaSenha.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/store/signin_store.dart';

class SigninPageStateHandler {
  final AppStore _appStore;

  SigninPageStateHandler(this._appStore);

  final SigninStore _store = Modular.get();

  SigninStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  Future<void> sendLogin(BuildContext context, bool mounted) async {
    UserController userController = UserController();

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_store.email)) {
      if (!mounted) return;
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_invalid,
      );
      return;
    }

    _appStore.setUser(
      await userController.login(
        email: _store.email,
        senha: _store.password,
        alterPassword: false,
        appStore: _appStore,
      ),
    );

    if (UserController.errorMessage == 'Alterar Senha') {
      if (!mounted) return;
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_reset,
        textBotao: AppLocalizations.of(context)!.login_notify_reset_button,
        funcaoBotao: () async {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PageNovaSenha(),
            ),
          );
        },
      );
      return;
    }

    if (_appStore.userLogged.guidid != null) {
      // app.listaNotificacoes = await NotificacaoController().NotificacaoGet(
      //   userguidid: app.getGuidId(),
      //   token: app.getToken(),
      // );
      _appStore.setCurrentScreen(_appStore.screens[0]);
      _appStore.setCurrentTab(0);
      Modular.to.navigate(RouterApp.logged);
    } else {
      if (!mounted) return;
      notifyPopUpWidget(
        context: context,
        textDescritivo: AppLocalizations.of(context)!.login_notify_data_invalid,
      );
    }
  }

  void dispose() => _store.dispose();
}
