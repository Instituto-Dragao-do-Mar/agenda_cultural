import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

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
        TextContrastFont(
          text: AppLocalizations.of(context)!.e_more_info,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - 2,
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
                TextContrastFont(
                  text: infocl,
                  style: GoogleFonts.inter(
                    fontSize: FontsApp.tamanhoBase - 2,
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
                TextContrastFont(
                  text: infoEntry,
                  style: GoogleFonts.inter(
                    fontSize: FontsApp.tamanhoBase - 2,
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
