import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class SpaceDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SpaceDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: corBgAtual,
      leadingWidth: 40,
      leading: Semantics(
        container: false,
        label: "Voltar para tela anterior",
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(
              'imagens/icon_arrow_back.svg',
            ),
          ),
        ),
      ),
      centerTitle: false,
      title: TextContrasteFonte(
        text: AppLocalizations.of(context)!.e_title_e,
        style: TextStyle(
          color: corTextAtual,
          fontSize: FontsApp.tamanhoBase.toDouble(),
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
