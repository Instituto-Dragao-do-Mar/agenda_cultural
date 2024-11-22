import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class SigninAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SigninAppBar({super.key});

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
