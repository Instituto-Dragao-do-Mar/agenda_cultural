import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class EventDetailMoreInfoWidget extends StatelessWidget {
  final String price;
  final String ageRating;

  const EventDetailMoreInfoWidget({
    super.key,
    required this.price,
    required this.ageRating,
  });

  @override
  Widget build(BuildContext context) {
    var entry = AppLocalizations.of(context)!.e_more_info_entry;
    var free = AppLocalizations.of(context)!.e_more_info_free;
    var oaid = AppLocalizations.of(context)!.e_more_info_paid;
    String? infoEntry = '$entry: ${price == 'Gratuito' ? free : oaid}';

    var classif = AppLocalizations.of(context)!.e_more_info_classif;
    var years = AppLocalizations.of(context)!.e_more_info_years;
    var classifFree = AppLocalizations.of(context)!.e_more_info_classif_free;
    String? infocl = '$classif: ${ageRating == "Livre" ? classifFree : ageRating.replaceAll('anos', years)}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrasteFonte(
          text: AppLocalizations.of(context)!.e_more_info,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - 2,
            fontWeight: FontWeight.w600,
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
                  'imagens/icon_user.svg',
                  height: 18,
                ),
                const SizedBox(width: 5),
                TextContrasteFonte(
                  text: infocl,
                  style: GoogleFonts.inter(
                    fontSize: Fontes.tamanhoBase - 2,
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'imagens/icon_ticket.svg',
                  height: 16,
                ),
                const SizedBox(width: 5),
                TextContrasteFonte(
                  text: infoEntry,
                  style: GoogleFonts.inter(
                    fontSize: Fontes.tamanhoBase - 2,
                    fontWeight: FontWeight.w500,
                    color: corTextAtual,
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
