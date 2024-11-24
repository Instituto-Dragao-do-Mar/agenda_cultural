import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class SearchProgrammingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchProgrammingAppBar({super.key});

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
            text: AppLocalizations.of(context)!.e_ticket_search,
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
