import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_email_auth.dart';
import 'package:agendacultural/app/modules/auth/features/widgets/input_password_auth.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/page/widgets/signin_app_bar.dart';
import 'package:agendacultural/app/modules/auth/features/signin/presenter/handler/signin_state_handler.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SigninPageStateHandler _handler = Modular.get();

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
          appBar: const SigninAppBar(),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'imagens/icon_idm_orange.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  TextContrastFont(
                    text: AppLocalizations.of(context)!.login_enter,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: FontsApp.tamanhoBase + 8,
                        fontWeight: FontWeight.w500,
                        color: !ColorsApp.contraste ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextContrastFont(
                        text: AppLocalizations.of(context)!.login_text,
                        semantics: AppLocalizations.of(context)!.login_text,
                        style: FontsApp.poppins14W400Grey((FontsApp.tamanhoBase)),
                        maxlines: 3,
                      ),
                      GestureDetector(
                        onTap: () => Modular.to.pushNamed(RouterApp.auth + RouterApp.signup),
                        child: TextContrastFont(
                          text: AppLocalizations.of(context)!.register,
                          semantics: AppLocalizations.of(context)!.register,
                          style: TextStyle(color: corBackgroundLaranja, fontSize: FontsApp.tamanhoBase.toDouble() - 2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InputEmailAuthWidget(
                    label: AppLocalizations.of(context)!.login_email,
                    onChanged: _handler.store.setEmail,
                  ),
                  const SizedBox(height: 20),
                  InputPasswordAuthWidget(
                    label: AppLocalizations.of(context)!.login_password,
                    valuePassword: _handler.store.password,
                    obscureText: _handler.store.obscureText,
                    onChanged: _handler.store.setPassword,
                    onSubmitted: (_) async => await _handler.sendLogin(context, mounted),
                    onSetObscureText: () => _handler.store.setObscureText(!_handler.store.obscureText),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Modular.to.pushNamed(RouterApp.auth + RouterApp.sendEmail),
                        child: TextContrastFont(
                          text: AppLocalizations.of(context)!.login_reset_password,
                          semantics: 'Esqueci minha senha',
                          style: TextStyle(
                            color: corBackgroundLaranja,
                            fontSize: FontsApp.tamanhoBase.toDouble() - 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Semantics(
                    label: AppLocalizations.of(context)!.login_enter,
                    child: ButtonDefault(
                      text: _handler.store.isLoading ? '...' : AppLocalizations.of(context)!.login_enter,
                      function: () async {
                        _handler.store.isLoading ? () {} : await _handler.sendLogin(context, mounted);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
