import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 8),
            Semantics(
              label: 'Voltar para a tela anterior',
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('imagens/icon_arrow_back.svg'),
              ),
            ),
            const SizedBox(width: 8),
            TextContrastFont(
              text: AppLocalizations.of(context)!.profile_general_upon_title,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Text(
            AppLocalizations.of(context)!.profile_general_upon_text,
            style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
          ),
        ),
      ),
    );
  }
}
