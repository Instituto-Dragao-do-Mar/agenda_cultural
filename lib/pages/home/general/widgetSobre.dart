import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:agendacultural/shared/widgetBottomNavigator.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../model/fonts.dart';
import '../../../shared/themes.dart';

class WidgetSobre extends StatefulWidget {
  const WidgetSobre({Key? key}) : super(key: key);

  @override
  State<WidgetSobre> createState() => _WidgetSobreState();
}

class _WidgetSobreState extends State<WidgetSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopoComum(
          text: AppLocalizations.of(context)!.profile_general_upon_title,
          semanticsLabel: "Página",
          funcaoImagem1: () async {
            Navigator.pop(context);
          },
          urlImagem1: 'seta.png',
          labelImagem1: "Clicar duas vezes para voltar para página anterior",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 50, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                TextContrastFont(
                  text: AppLocalizations.of(context)!.profile_general_upon_text,
                  style: FontsApp.poppins16W500Black(FontsApp.tamanhoBase),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: WidgetBottomNavigator(),
    );
  }
}
