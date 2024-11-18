import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/languages_model.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/widgetbotao.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PerfilIdiomaPage extends StatefulWidget {
  const PerfilIdiomaPage({Key? key}) : super(key: key);

  @override
  State<PerfilIdiomaPage> createState() => _PerfilIdiomaPageState();
}

bool status = false;
double fontSize = 16;

class _PerfilIdiomaPageState extends State<PerfilIdiomaPage> {
  Language? languageSelecionada;

  @override
  void initState() {
    super.initState();
    String idiomaSalvo = Dados.idiomaSalvo;
    languageSelecionada = Language.languageList().firstWhere(
      (language) => language.languageCode == idiomaSalvo,
      orElse: () => Language(1, 'bandeirabrasil.png', 'Português', 'pt'),
    );
  }

  //, orElse: () => Language(2, 'bandeiraeua.png', 'English', 'en')

  @override
  Widget build(BuildContext context) {
    BaseController baseController = Provider.of<BaseController>(context);

    return Scaffold(
      backgroundColor: corBg,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: AppLocalizations.of(context)!.profile_language,
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          semanticsLabel: "Tela de ",
          urlImagem1: 'seta.png',
          labelImagem1: "Voltar para página anterior",
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const WidgetBottomNavigator(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: corBg,
          child: Column(
            children: [
              Text(
                semanticsLabel: '',
                AppLocalizations.of(context)!.int_title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
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
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                languageSelecionada!.name == language.name ? Colors.black : Colors.grey.withOpacity(.5),
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
                                color: Colors.black,
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
              widgetBotao(
                text: AppLocalizations.of(context)!.profile_accessibility_save,
                function: () {
                  AppWidget.setLocale(context, Locale(languageSelecionada!.languageCode, ''));
                  Dados.idiomaSalvo = languageSelecionada!.languageCode;
                  Dados.setString('idioma', Dados.idiomaSalvo);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
