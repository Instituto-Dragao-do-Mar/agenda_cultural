import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

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
        TextContrastFont(
          text: AppLocalizations.of(context)!.schedule_filter,
          style: TextStyle(
            color: corTextAtual,
            fontSize: FontsApp.tamanhoBase.toDouble(),
          ),
        ),
      ],
    );
  }
}
