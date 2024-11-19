import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';

class SpaceDetailMoreInfoWidget extends StatelessWidget {
  final void Function() onTap;

  const SpaceDetailMoreInfoWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrastFont(
          text: AppLocalizations.of(context)!.e_more_info,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - 2,
            fontWeight: FontWeight.w500,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_phone.svg',
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => notifyPopUpWidget(
                    context: context,
                    permitirFechar: true,
                    textDescritivo: AppLocalizations.of(context)!.profile_general_alert,
                    textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                    funcaoBotao: onTap,
                  ),
                  child: TextContrastFont(
                    text: AppLocalizations.of(context)!.e_more_info_scheduling,
                    style: GoogleFonts.inter(
                      decoration: TextDecoration.underline,
                      fontSize: FontsApp.tamanhoBase - 2,
                      fontWeight: FontWeight.w500,
                      color: corTextAtual,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
