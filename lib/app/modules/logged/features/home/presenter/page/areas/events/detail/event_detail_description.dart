import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';

class EventDetailDescriptionWidget extends StatelessWidget {
  final String description;

  const EventDetailDescriptionWidget({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextContrastFont(
          text: AppLocalizations.of(context)!.e_descr,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        ReadMoreText(
          description,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
          colorClickableText: corBackgroundLaranja,
          trimLength: 300,
          trimMode: TrimMode.Length,
          trimCollapsedText: AppLocalizations.of(context)!.e_descr_more,
          trimExpandedText: AppLocalizations.of(context)!.e_descr_less,
          moreStyle: TextStyle(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.bold,
            color: corBackgroundLaranja,
          ),
          lessStyle: TextStyle(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.bold,
            color: corBackgroundLaranja,
          ),
        ),
      ],
    );
  }
}
