import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class AppBarSearchFilter extends StatelessWidget {
  const AppBarSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(width: 8),
        Semantics(
          label: 'Voltar para a tela anterior',
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              'imagens/icon_arrow_back.svg',
            ),
          ),
        ),
        const SizedBox(width: 8),
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.schedule_filter,
          style: TextStyle(
            color: corTextAtual,
            fontSize: Fontes.tamanhoBase.toDouble(),
          ),
        ),
      ],
    );
  }
}
