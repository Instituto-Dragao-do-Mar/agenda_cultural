import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbotaoswitch.dart';

class AccessibilityIntroductionScreen extends StatelessWidget {
  final bool statusAltoContraste;
  final double fontSize;
  final void Function(bool value) setAltoContraste;
  final void Function(bool isIncrement) setFontSize;
  final void Function() onNextStep;

  const AccessibilityIntroductionScreen({
    super.key,
    required this.statusAltoContraste,
    required this.fontSize,
    required this.setAltoContraste,
    required this.setFontSize,
    required this.onNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(flex: 2),
        Text(
          AppLocalizations.of(context)!.int_title_accessibility,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.int_first_subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Semantics(
              label: statusAltoContraste ? 'Desativar alto contraste' : 'Ativar alto contraste',
              child: widgetBotaoSwitch(
                value: statusAltoContraste,
                function: (value) => setAltoContraste(value),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_first_explanation,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_second_title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context)!.int_second_example_title,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.int_second_example_text,
                semanticsLabel: AppLocalizations.of(context)!.int_second_example_text,
                style: TextStyle(color: Colors.white, fontSize: FontsApp.tamanhoBase.toDouble()),
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
                  ? 'Diminuir fonte para ${fontSize - 1} pixels'
                  : 'Fonte no tamanho mínimo, impossível diminuir',
              child: IconButton(
                icon: const Icon(Icons.remove, size: 30, color: Colors.white),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(corBackgroundLaranja),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
                ),
                onPressed: () => setFontSize(false),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.int_font_size} $fontSize px',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
            Semantics(
              label: fontSize < 24
                  ? 'Aumentar fonte para ${fontSize + 1} pixels'
                  : 'Fonte no tamanho máximo, impossível aumentar',
              child: IconButton(
                icon: const Icon(Icons.add, size: 30, color: Colors.white),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(corBackgroundLaranja),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
                ),
                onPressed: () => setFontSize(true),
              ),
            ),
          ],
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
