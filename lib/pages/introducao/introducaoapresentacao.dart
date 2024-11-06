import 'package:agendacultural/model/fontes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroducaoApresentacaoWidget extends StatefulWidget {
  const IntroducaoApresentacaoWidget({
    super.key,
  });

  @override
  State<IntroducaoApresentacaoWidget> createState() => _IntroducaoApresentacaoWidgetState();
}

class _IntroducaoApresentacaoWidgetState extends State<IntroducaoApresentacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.int_text_presentation,
      style: TextStyle(
        color: Colors.white,
        fontSize: Fontes.tamanhoBase.toDouble() + 2,
      ),
    );
  }
}
