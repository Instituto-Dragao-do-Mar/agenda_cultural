import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/button_default.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/controller/user_controller.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/rules_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/terms_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/signup_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/handler/signup_state_handler.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/input_name_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/input_email_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/input_password_signup.dart';
import 'package:agendacultural/app/modules/auth/features/signup/presenter/page/widgets/input_confirm_password_signup.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

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
        return PopScope(
          canPop: false,
          onPopInvoked: (_) {
            if (FocusScope.of(context).hasPrimaryFocus) {
              Navigator.pop(context);
            } else {
              Modular.to.pop();
            }
          },
          child: Scaffold(
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
                      style: FontsApp.poppins12W400Grey((FontsApp.tamanhoBase)),
                    ),
                    const SizedBox(height: 20),
                    InputNameSignupWidget(
                      label: AppLocalizations.of(context)!.register_name,
                      onChanged: (value) => _handler.store.setName(value),
                    ),
                    const SizedBox(height: 20),
                    InputEmailSignupWidget(
                      label: AppLocalizations.of(context)!.register_email,
                      onChanged: (value) => _handler.store.setEmail(value),
                    ),
                    const SizedBox(height: 20),
                    InputPasswordSignupWidget(
                      label: AppLocalizations.of(context)!.register_password,
                      valuePassword: _handler.store.password,
                      obscureText: _handler.store.isPasswordVisible,
                      onChanged: _handler.onChangedAndVerifyPassword,
                      onSetObscureText: _handler.store.setIsPasswordVisible,
                    ),
                    const SizedBox(height: 20),
                    InputConfirmPasswordSignupWidget(
                      label: AppLocalizations.of(context)!.register_confirm_password,
                      valueConfirmPassword: _handler.store.confirmPassword,
                      obscureText: _handler.store.isConfirmPasswordVisible,
                      onChanged: (value) => _handler.store.setConfirmPassword(value),
                      setObscureText: _handler.store.setIsConfirmPasswordVisible,
                    ),
                    const SizedBox(height: 20),
                    _handler.store.password != '' || _handler.store.confirmPassword != ''
                        ? RulesSignupWidget(
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
    notifyPopUpWidget(context: context, textDescritivo: 'Erro ao abrir o link');
  }
}
