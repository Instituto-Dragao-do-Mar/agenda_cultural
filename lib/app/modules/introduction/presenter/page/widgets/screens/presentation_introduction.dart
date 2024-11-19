import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/widgetbottombotao.dart';

class PresentationIntroductionScreen extends StatelessWidget {
  final void Function() onTapEnter;

  const PresentationIntroductionScreen({
    super.key,
    required this.onTapEnter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppLocalizations.of(context)!.int_text_presentation,
          style: TextStyle(
            color: Colors.white,
            fontSize: FontsApp.tamanhoBase.toDouble() + 2,
          ),
        ),
        const SizedBox(height: 80),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: widgetBottomBotao(
            text: AppLocalizations.of(context)!.int_button_enter,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            function: onTapEnter,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
