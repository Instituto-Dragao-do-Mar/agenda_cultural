import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/notify_pop_up.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/rules_auth.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_email_auth.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_password_auth.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_confirm_password_auth.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/terms_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/signup_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/handler/signup_state_handler.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/input_name_signup.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupPageStateHandler _handler = Modular.get();
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
          appBar: const SignupAppBar(),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextContrastFont(
                    text: AppLocalizations.of(context)!.register_subtitle,
                    semantics: AppLocalizations.of(context)!.register_subtitle,
                    maxlines: 10,
                    style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase + 2)),
                  ),
                  const SizedBox(height: 20),
                  InputNameSignupWidget(
                    label: AppLocalizations.of(context)!.register_name,
                    onChanged: (value) => _handler.store.setName(value),
                  ),
                  const SizedBox(height: 20),
                  InputEmailAuthWidget(
                    label: AppLocalizations.of(context)!.register_email,
                    onChanged: (value) => _handler.store.setEmail(value),
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
                  TermsSignupWidget(
                    isChecked: _handler.store.isChecked,
                    setIsChecked: _handler.store.setIsChecked,
                    onTapTerms: () => _openLink('https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos'),
                    onTapPrivacy: () => _openLink(
                      'https://grupo-manual.gitbook.io/app-cultura.ce/termos-e-servicos/politica-de-privacidade',
                    ),
                  ),
                  const SizedBox(height: 50),
                  Semantics(
                    label: AppLocalizations.of(context)!.register_conclude,
                    child: ButtonDefault(
                      text: _handler.store.isLoading ? '...' : AppLocalizations.of(context)!.register_conclude,
                      function: () async {
                        _handler.store.isLoading ? () {} : await _handler.saveCadastro(context, mounted);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openLink(String url) async {
    try {
      await launchUrlString(url);
    } catch (e) {
      _showNotificationError();
    }
  }

  void _showNotificationError() {
    notifyPopUpWidget(context: context, description: 'Erro ao abrir o link');
  }
}
