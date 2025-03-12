import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/button_default.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';
import 'package:agendacultural/app/modules/auth/presenter/handler/auth_state_handler.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthPageStateHandler _handler = Modular.get();

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
    return Container(
      color: corBgAtual,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: corBgAtual,
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'imagens/realizacao_gov.png',
                  height: 50,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Semantics(
                      container: true,
                      label: 'Logo do Cultura cê é, Agenda Cultural do Ceará',
                      child: Image.asset(
                        'imagens/logo_screen_login.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonDefault(
                          margin: const EdgeInsets.only(left: 32, right: 32, bottom: 10),
                          text: AppLocalizations.of(context)!.login_enter,
                          function: () => Modular.to.pushNamed(RouterApp.auth + RouterApp.signin),
                        ),
                        ButtonDefault(
                          margin: const EdgeInsets.symmetric(horizontal: 32),
                          text: AppLocalizations.of(context)!.register,
                          negative: true,
                          function: () => Modular.to.pushNamed(RouterApp.auth + RouterApp.signup),
                        ),
                        GestureDetector(
                          onTap: () async {
                            LogController logController = LogController();

                            await logController.postLog(
                              idLogTipo: 1,
                              guidUsuario: '',
                              observacao: 'Usuário não identificado realizou login como visitante',
                            );

                            _handler.appStore.setCurrentScreen(_handler.appStore.screens[0]);
                            _handler.appStore.setCurrentTab(0);
                            _handler.appStore.setUser(User());
                            Modular.to.navigate(RouterApp.logged);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 32, right: 32, top: 10),
                            width: double.infinity,
                            height: 35,
                            child: Center(
                              child: TextContrastFont(
                                text: AppLocalizations.of(context)!.visitor,
                                semantics: AppLocalizations.of(context)!.visitor,
                                style: GoogleFonts.roboto(fontSize: 16, color: corBackgroundLaranja),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Image.asset(
                  !ColorsApp.contraste ? 'imagens/management_idm.png' : 'imagens/management_idm_contrast.png',
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
