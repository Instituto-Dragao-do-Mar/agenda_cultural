import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';

class EventDetailLocation extends StatelessWidget {
  final Space spacePrincipal;

  const EventDetailLocation({
    super.key,
    required this.spacePrincipal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.e_location,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          spacePrincipal.nome ?? '',
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
        if (spacePrincipal.endereco != null)
          Text(
            spacePrincipal.endereco ?? '',
            style: GoogleFonts.inter(
              fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
              color: corTextAtual,
            ),
          ),
      ],
    );
  }
}
