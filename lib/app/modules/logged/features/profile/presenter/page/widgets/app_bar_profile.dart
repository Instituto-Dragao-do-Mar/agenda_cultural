import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';

class AppBarProfile extends StatelessWidget {
  final void Function() onTapReturn;

  const AppBarProfile({
    super.key,
    required this.onTapReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Semantics(
          label: 'Voltar para a tela anterior',
          child: GestureDetector(
            onTap: onTapReturn,
            child: SvgPicture.asset(
              'imagens/icon_arrow_back.svg',
            ),
          ),
        ),
        const SizedBox(width: 8),
        TextContrastFont(
          text: AppLocalizations.of(context)!.profile_title,
          style: TextStyle(
            color: corTextAtual,
            fontSize: FontsApp.tamanhoBase.toDouble(),
          ),
        ),
        const Spacer(),
        Semantics(
          label: 'Sair do aplicativo',
          child: GestureDetector(
            onTap: () => Modular.to.navigate(RouterApp.auth),
            child: SvgPicture.asset('imagens/icon_logout.svg', height: 24),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
