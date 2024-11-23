import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class ProgrammingSpaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onTapSearchEvent;

  const ProgrammingSpaceAppBar({
    super.key,
    required this.onTapSearchEvent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
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
            text: AppLocalizations.of(context)!.e_title_e,
            style: TextStyle(
              color: corTextAtual,
              fontSize: FontsApp.tamanhoBase.toDouble(),
            ),
          ),
          const Spacer(),
          Semantics(
            label: 'Ir para a tela de filtros',
            child: GestureDetector(
              onTap: onTapSearchEvent,
              child: SvgPicture.asset('imagens/icon_favorite.svg'),
            ),
          ),
          const SizedBox(width: 8),
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
