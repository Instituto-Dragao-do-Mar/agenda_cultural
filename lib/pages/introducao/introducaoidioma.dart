import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/main.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/model/languages_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Idioma {
  String? idioma;
  String? imagemBandeira;

  Idioma({
    this.idioma,
    this.imagemBandeira,
  });
}

class IntroducaoIdiomaWidget extends StatefulWidget {
  const IntroducaoIdiomaWidget({
    super.key,
  });

  @override
  State<IntroducaoIdiomaWidget> createState() => _IntroducaoIdiomaWidgetState();
}

class _IntroducaoIdiomaWidgetState extends State<IntroducaoIdiomaWidget> {
  Language? languageSelecionada;

  @override
  void initState() {
    super.initState();
    languageSelecionada = Language.languageList().first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          semanticsLabel: '',
          AppLocalizations.of(context)!.int_title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: Language.languageList().length,
            itemBuilder: (BuildContext context, int index) {
              var language = Language.languageList()[index];
              return GestureDetector(
                onTap: () {
                  languageSelecionada = language;
                  MyApp.setLocale(
                    context,
                    Locale(languageSelecionada!.languageCode, ''),
                  );
                  Dados.idiomaSalvo = languageSelecionada!.languageCode;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: languageSelecionada!.name == language.name
                          ? Colors.white
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      widgetImagemInterna(
                        imagem: Imagem(
                          url: language.flag,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        language.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
