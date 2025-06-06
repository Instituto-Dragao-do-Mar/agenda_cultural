import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class MyLocationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyLocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const SizedBox(width: 8),
          Semantics(
            label: 'Voltar para a tela anterior',
            child: GestureDetector(
              onTap: () => Modular.to.pop(),
              child: SvgPicture.asset(
                'imagens/icon_arrow_back.svg',
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextContrastFont(
            text: AppLocalizations.of(context)!.location_title,
            style: TextStyle(
              color: corTextAtual,
              fontSize: FontsApp.tamanhoBase.toDouble(),
            ),
          ),
          const Spacer(),
        ],
      ),
      backgroundColor: corBgAtual,
      surfaceTintColor: corBgAtual,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}