import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/send-email/presenter/store/send_email_store.dart';

class SendEmailPageStateHandler {
  final AppStore _appStore;

  SendEmailPageStateHandler(this._appStore);

  final SendEmailStore _store = Modular.get();

  SendEmailStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {}

  Future<void> sendEmail(BuildContext context, bool mounted) async {
    UserController userController = UserController();
    _store.setIsLoading(true);

    if (_store.email.characters.isEmpty) {
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

    var errorMessage = await userController.sendRecoverPassword(email: _store.email);

    if (errorMessage != '') {
      if (!mounted) return;
      notifyPopUpWidget(context: context, description: errorMessage ?? '');
      _store.setIsLoading(false);
      return;
    }

    if (!mounted) return;
    notifyPopUpWidget(
      context: context,
      labelPrincipal: AppLocalizations.of(context)!.login_reset_conclude_title,
      description: AppLocalizations.of(context)!.login_reset_conclude_subtitle,
      labelButton: AppLocalizations.of(context)!.login_enter,
      error: false,
      functionButton: () => Modular.to.navigate(RouterApp.auth),
    );
    _store.setIsLoading(false);
    return;
  }

  void dispose() => _store.dispose();
}
