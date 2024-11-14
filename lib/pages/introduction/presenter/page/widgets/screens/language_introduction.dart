import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/pages/introduction/domain/entities/languages_model.dart';

class LanguageIntroductionScreen extends StatelessWidget {
  final Language languageSelecionada;
  final void Function(Language language) setLanguageSelecionada;
  final void Function() onNextStep;

  const LanguageIntroductionScreen({
    super.key,
    required this.languageSelecionada,
    required this.setLanguageSelecionada,
    required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        Text(
          semanticsLabel: AppLocalizations.of(context)!.int_title,
          AppLocalizations.of(context)!.int_title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 290,
          child: ListView.builder(
            itemCount: Language.languageList().length,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var language = Language.languageList()[index];

              return GestureDetector(
                onTap: () => setLanguageSelecionada(language),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: languageSelecionada.name == language.name ? Colors.white : Colors.transparent,
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
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: onNextStep,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16, right: 8),
                child: Text(
                  AppLocalizations.of(context)!.int_button_forward,
                  semanticsLabel: AppLocalizations.of(context)!.int_button_forward,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
