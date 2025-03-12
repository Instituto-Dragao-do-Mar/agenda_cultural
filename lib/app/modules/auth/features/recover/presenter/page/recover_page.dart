import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/rules_auth.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_password_auth.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_confirm_password_auth.dart';
import 'package:agendacultural/app/modules/auth/features/recover/presenter/page/widgets/recover_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/recover/presenter/handler/recover_state_handler.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  final RecoverPageStateHandler _handler = Modular.get();
  UserController? usuarioController;

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          backgroundColor: corBgAtual,
          appBar: const RecoverAppBar(),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextContrastFont(
                      text: 'Insira uma nova senha!',
                      semantics: 'Insira uma nova senha!',
                      style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase + 2)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InputPasswordAuthWidget(
                  label: AppLocalizations.of(context)!.register_password,
                  valuePassword: _handler.store.password,
                  obscureText: _handler.store.isPasswordVisible,
                  onChanged: _handler.onChangedAndVerifyPassword,
                  onSetObscureText: _handler.store.setIsPasswordVisible,
                ),
                const SizedBox(height: 20),
                InputConfirmPasswordAuthWidget(
                  label: AppLocalizations.of(context)!.register_confirm_password,
                  valueConfirmPassword: _handler.store.confirmPassword,
                  obscureText: _handler.store.isConfirmPasswordVisible,
                  onChanged: _handler.store.setConfirmPassword,
                  onSubmitted: (_) async => await _handler.recoverPassword(context, mounted),
                  setObscureText: _handler.store.setIsConfirmPasswordVisible,
                ),
                const SizedBox(height: 20),
                _handler.store.password != '' || _handler.store.confirmPassword != ''
                    ? RulesAuthWidget(
                        haveMinDigits: _handler.store.haveMinDigits,
                        haveUpperCase: _handler.store.haveUpperCase,
                        haveLowerCase: _handler.store.haveLowerCase,
                        haveNumber: _handler.store.haveNumber,
                        rulesMatch: _handler.store.rulesMatch,
                      )
                    : const Column(),
                const SizedBox(height: 50),
                Semantics(
                  label: AppLocalizations.of(context)!.profile_accessibility_save,
                  child: ButtonDefault(
                    text: _handler.store.isLoading ? '...' : AppLocalizations.of(context)!.profile_accessibility_save,
                    function: () async {
                      _handler.store.isLoading ? () {} : await _handler.recoverPassword(context, mounted);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
