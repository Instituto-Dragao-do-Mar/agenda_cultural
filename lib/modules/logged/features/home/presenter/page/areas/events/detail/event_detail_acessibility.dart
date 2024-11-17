import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/common/utils/tradutors.dart';

class EventDetailAccessibilityWidget extends StatelessWidget {
  final String accessibility;

  const EventDetailAccessibilityWidget({super.key, required this.accessibility});

  @override
  Widget build(BuildContext context) {
    String text = accessibility;
    List<String> accessibilityTranslated = [];
    List<String> accessibilityAdjust = text.split(';').map((acess) => acess.trim()).toList();
    if (text.isEmpty) {
      text = AppLocalizations.of(context)!.e_accessibility_default;
    } else {
      for (String accessibility in accessibilityAdjust) {
        String accessibilityT = getNomeAcessib(accessibility, context);
        accessibilityTranslated.add(accessibilityT);
      }
      text = accessibilityTranslated.join('; ');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_accessibility,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
      ],
    );
  }
}
