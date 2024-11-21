import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/shared/button_default.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/languages_model.dart';
import 'package:agendacultural/app/modules/logged/features/profile/sub_module/language/presenter/handler/language_state_handler.dart';

class ProfileLanguagePage extends StatefulWidget {
  const ProfileLanguagePage({Key? key}) : super(key: key);

  @override
  State<ProfileLanguagePage> createState() => _ProfileLanguagePageState();
}

class _ProfileLanguagePageState extends State<ProfileLanguagePage> {
  final LanguagePageStateHandler _handler = Modular.get();

  @override
  void initState() {
    super.initState();
    _handler.initialize();
  }

  @override
  dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return PopScope(
          canPop: false,
          onPopInvoked: (_) => Modular.to.navigate(RouterApp.logged),
          child: Scaffold(
            backgroundColor: corBg,
            appBar: AppBar(
              title: Row(
                children: [
                  const SizedBox(width: 8),
                  Semantics(
                    label: 'Voltar para a tela anterior',
                    child: GestureDetector(
                      onTap: () => Modular.to.navigate(RouterApp.logged),
                      child: SvgPicture.asset('imagens/icon_arrow_back.svg'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextContrastFont(
                    text: _handler.store.languageSelecionada.id == 1
                        ? 'Idioma'
                        : _handler.store.languageSelecionada.id == 2
                            ? 'Language'
                            : _handler.store.languageSelecionada.id == 3
                                ? 'Idioma'
                                : _handler.store.languageSelecionada.id == 4
                                    ? 'Langue'
                                    : 'Lingua',
                    style: TextStyle(
                      color: corTextAtual,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              backgroundColor: corBgAtual,
              surfaceTintColor: corBgAtual,
              elevation: 0,
              titleSpacing: 0,
              leadingWidth: 0,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: corBg,
                child: Column(
                  children: [
                    Text(
                      semanticsLabel: '',
                      _handler.store.languageSelecionada.id == 1
                          ? 'Qual é o seu idioma?'
                          : _handler.store.languageSelecionada.id == 2
                              ? 'What is your language?'
                              : _handler.store.languageSelecionada.id == 3
                                  ? '¿Cuál es tu idioma?'
                                  : _handler.store.languageSelecionada.id == 4
                                      ? 'Quelle est votre langue?'
                                      : 'Qual è la tua lingua?',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: Language.languageList().length,
                        itemBuilder: (_, index) {
                          var language = Language.languageList()[index];
                          return GestureDetector(
                            onTap: () => _handler.store.setLanguageSelecionada(language),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _handler.store.languageSelecionada.name == language.name
                                      ? Colors.black
                                      : const Color(0xFFD3D3D3),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'imagens/${language.flag}',
                                    height: 36,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    language.name,
                                    style: const TextStyle(fontSize: 16, color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 70),
                    ButtonDefault(
                      text: _handler.store.languageSelecionada.id == 1
                          ? 'Salvar'
                          : _handler.store.languageSelecionada.id == 2
                              ? 'Save'
                              : _handler.store.languageSelecionada.id == 3
                                  ? 'Salvar'
                                  : _handler.store.languageSelecionada.id == 4
                                      ? 'Sauvegarder'
                                      : 'Salvare',
                      function: () {
                        AppWidget.setLocale(context, Locale(_handler.store.languageSelecionada.languageCode, ''));
                        Dados.idiomaSalvo = _handler.store.languageSelecionada.languageCode;
                        Dados.setString('idioma', Dados.idiomaSalvo);
                        Modular.to.navigate(RouterApp.logged);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
