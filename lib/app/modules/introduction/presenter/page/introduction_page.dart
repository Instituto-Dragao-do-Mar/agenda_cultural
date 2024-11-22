import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/widgets/step.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/introducao_model.dart';
import 'package:agendacultural/app/modules/introduction/presenter/handler/introduction_state_handler.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/widgets/dialog_accept_cookies.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/widgets/screens/language_introduction.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/widgets/screens/presentation_introduction.dart';
import 'package:agendacultural/app/modules/introduction/presenter/page/widgets/screens/accessibility_introduction.dart';

List<Introduction> screens = [
  Introduction(order: 1, image: 'imagens/introduction_1.jpg'),
  Introduction(order: 2, image: 'imagens/introduction_2.jpg'),
  Introduction(order: 3, image: 'imagens/introduction_3.jpg'),
];

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final IntroductionPageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
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
          canPop: _handler.store.currentStep == 1,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                PageView.builder(
                  controller: _handler.store.controllerPage,
                  itemCount: screens.length,
                  onPageChanged: (int index) => _handler.store.setCurrentStep(index + 1),
                  itemBuilder: (context, index) {
                    return Observer(
                      warnWhenNoObservables: false,
                      builder: (_) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(screens[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: screens[index].order == 1
                              ? LanguageIntroductionScreen(
                                  languageSelecionada: _handler.store.languageSelecionada,
                                  setLanguageSelecionada: (language) {
                                    _handler.store.setLanguageSelecionada(language);
                                    AppWidget.setLocale(context, Locale(language.languageCode, ''));
                                    Dados.idiomaSalvo = language.languageCode;
                                  },
                                  onNextStep: () {
                                    _handler.store.setCurrentStep(2);
                                    _handler.store.controllerPage.nextPage(
                                      duration: const Duration(milliseconds: 200),
                                      curve: Curves.bounceIn,
                                    );
                                  },
                                )
                              : screens[index].order == 2
                                  ? AccessibilityIntroductionScreen(
                                      statusAltoContraste: _handler.store.statusAltoContraste,
                                      fontSize: _handler.store.fontSize,
                                      setAltoContraste: (value) async {
                                        _handler.store.setStatusAltoContraste(value);
                                        ColorsApp.setAltoContraste(value);
                                        await Dados.setBool('altocontraste', value);
                                        ColorsApp.reloadColors();
                                      },
                                      setFontSize: (isIncrement) async {
                                        if (isIncrement) {
                                          if (_handler.store.fontSize < 24) {
                                            _handler.store.setFontSize(_handler.store.fontSize + 2);
                                          }
                                        } else {
                                          if (_handler.store.fontSize > 16) {
                                            _handler.store.setFontSize(_handler.store.fontSize - 2);
                                          }
                                        }
                                        FontsApp.setTamanhoBase(_handler.store.fontSize.toInt());
                                        await Dados.setInt('tamanhofontebase', _handler.store.fontSize.toInt());
                                      },
                                      onNextStep: () {
                                        _handler.store.setCurrentStep(3);
                                        _handler.store.controllerPage.nextPage(
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                    )
                                  : PresentationIntroductionScreen(
                                      onTapEnter: () => _openDialogAcceptCookies(context),
                                    ),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 40),
                    child: StepWidget(
                      totalSteps: 3,
                      currentStep: _handler.store.currentStep,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openDialogAcceptCookies(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return DialogAcceptCookies(
          onAccept: () => _handleCookiesChoice(context, true),
          onRecuse: () => _handleCookiesChoice(context, false),
        );
      },
    );
  }

  void _handleCookiesChoice(BuildContext context, bool accepted) {
    Dados.setBool('cookies', accepted);
    Dados.jaVisualizouCookies = accepted;

    if (Dados.idiomaSalvo.isEmpty) {
      Dados.idiomaSalvo = 'pt';
    }
    Dados.setString('idioma', Dados.idiomaSalvo);
    Dados.setBool('introducao', true);
    Dados.jaVisualizouIntroducao = true;

    Modular.to.navigate(RouterApp.logged);
  }
}
