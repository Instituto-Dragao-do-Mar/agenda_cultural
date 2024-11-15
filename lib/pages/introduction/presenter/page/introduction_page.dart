import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:agendacultural/main.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/modules/logged/presenter/page/logged_area_page.dart';
import 'package:agendacultural/pages/introduction/presenter/page/widgets/step.dart';
import 'package:agendacultural/pages/introduction/domain/entities/introducao_model.dart';
import 'package:agendacultural/pages/introduction/presenter/store/introduction_store.dart';
import 'package:agendacultural/pages/introduction/presenter/page/widgets/dialog_accept_cookies.dart';
import 'package:agendacultural/pages/introduction/presenter/page/widgets/screens/language_introduction.dart';
import 'package:agendacultural/pages/introduction/presenter/page/widgets/screens/presentation_introduction.dart';
import 'package:agendacultural/pages/introduction/presenter/page/widgets/screens/accessibility_introduction.dart';

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
  final _introductionStore = IntroductionStore();

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _introductionStore.currentStep == 1,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Observer(builder: (context) {
          return Stack(
            children: [
              PageView.builder(
                controller: _introductionStore.controllerPage,
                itemCount: screens.length,
                onPageChanged: (int index) => _introductionStore.setCurrentStep(index + 1),
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
                                languageSelecionada: _introductionStore.languageSelecionada,
                                setLanguageSelecionada: (language) {
                                  _introductionStore.setLanguageSelecionada(language);
                                  MyApp.setLocale(context, Locale(language.languageCode, ''));
                                  Dados.idiomaSalvo = language.languageCode;
                                },
                                onNextStep: () {
                                  _introductionStore.setCurrentStep(2);
                                  _introductionStore.controllerPage.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.bounceIn,
                                  );
                                },
                              )
                            : screens[index].order == 2
                                ? AccessibilityIntroductionScreen(
                                    statusAltoContraste: _introductionStore.statusAltoContraste,
                                    fontSize: _introductionStore.fontSize,
                                    setAltoContraste: (value) async {
                                      _introductionStore.setStatusAltoContraste(value);
                                      Cores.setAltoContraste(value);
                                      await Dados.setBool('altocontraste', value);
                                      Cores.reloadColors();
                                    },
                                    setFontSize: (isIncrement) async {
                                      if (isIncrement) {
                                        if (_introductionStore.fontSize < 24) {
                                          _introductionStore.setFontSize(_introductionStore.fontSize + 2);
                                        }
                                      } else {
                                        if (_introductionStore.fontSize > 16) {
                                          _introductionStore.setFontSize(_introductionStore.fontSize - 2);
                                        }
                                      }
                                      Fontes.setTamanhoBase(_introductionStore.fontSize.toInt());
                                      await Dados.setInt('tamanhofontebase', _introductionStore.fontSize.toInt());
                                    },
                                    onNextStep: () {
                                      _introductionStore.setCurrentStep(3);
                                      _introductionStore.controllerPage.nextPage(
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
                    currentStep: _introductionStore.currentStep,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoggedAreaPage()),
    );
  }
}
