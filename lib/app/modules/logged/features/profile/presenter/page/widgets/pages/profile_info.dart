import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class ProfileInfo extends StatelessWidget {
  final String nameUser;
  final String emailUser;

  const ProfileInfo({
    super.key,
    required this.nameUser,
    required this.emailUser,
  });

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
              text: AppLocalizations.of(context)!.profile_account_data,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.profile_account_data,
              semanticsLabel: AppLocalizations.of(context)!.profile_account_data,
              style: FontsApp.poppins18W500Black((FontsApp.tamanhoBase)),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.register_name,
              semanticsLabel: AppLocalizations.of(context)!.register_name,
              style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
            ),
            const SizedBox(height: 5),
            Semantics(
              label: 'Nome do usuário $nameUser',
              child: TextField(
                style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                enabled: false,
                decoration: InputDecoration(
                  hintText: nameUser,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  focusColor: Colors.black,
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.register_email,
              semanticsLabel: AppLocalizations.of(context)!.register_email,
              style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
            ),
            const SizedBox(height: 5),
            Semantics(
              label: 'Email do usuário $emailUser',
              child: TextField(
                style: FontsApp.poppins16W400Grey(FontsApp.tamanhoBase),
                enabled: false,
                decoration: InputDecoration(
                  hintText: emailUser,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  focusColor: Colors.black,
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0XFFD9D9D9)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
