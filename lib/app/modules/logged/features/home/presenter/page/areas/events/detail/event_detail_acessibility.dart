import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/tradutors.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

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
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
      ],
    );
  }
}
