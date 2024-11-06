import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroducaoAcessibilidadeWidget extends StatefulWidget {
  const IntroducaoAcessibilidadeWidget({Key? key}) : super(key: key);

  @override
  State<IntroducaoAcessibilidadeWidget> createState() =>
      _IntroducaoAcessibilidadeWidgetState();
}

bool status = false;
double fontSize = 16;

class _IntroducaoAcessibilidadeWidgetState
    extends State<IntroducaoAcessibilidadeWidget> {
  int opcaoSelecionada = 0;

  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.int_title_accessibility,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.int_first_subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Semantics(
              label: statusAltoContraste
                  ? "Desativar alto contraste"
                  : "Ativar alto contraste",
              child: widgetBotaoSwitch(
                value: statusAltoContraste,
                function: (value) {
                  setState(() {
                    statusAltoContraste = value;
                    setAltoContraste(statusAltoContraste);
                  });
                },
              ),
            )
          ],
        ), 
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_first_explanation,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_second_title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_second_example_title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.int_second_example_text,
                semanticsLabel:
                    "Mas a terra de Oz nunca foi civilizada, porque vivemos separados do resto do mundo.Fonte atual: $fontSize pixels",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Fontes.tamanhoBase.toDouble(),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Semantics(
              label: fontSize > 16
                  ? "Diminuir fonte para ${fontSize - 1} pixels"
                  : "Fonte no tamanho mínimo, impossível diminuir",
              child: IconButton(
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    corBackgroundLaranja,
                  ),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(2),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (fontSize > 16) {
                      fontSize--;
                    }
                    setFontSize(fontSize);
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.int_font_size} $fontSize px",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Semantics(
              label: fontSize < 24
                  ? "Aumentar fonte para ${fontSize + 1} pixels"
                  : "Fonte no tamanho máximo, impossível aumentar",
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    corBackgroundLaranja,
                  ),
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.all(2),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (fontSize < 24) {
                      fontSize++;
                    }
                    setFontSize(fontSize);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future setFontSize(double fontSize) async {
    Fontes.setTamanhoBase(fontSize.toInt());
    await Dados.setInt('tamanhofontebase', fontSize.toInt());
  }

  Future setAltoContraste(bool val) async {
    Cores.setAltoContraste(val);
    await Dados.setBool('altocontraste', val);
    Cores.reloadColors();
  }
}
