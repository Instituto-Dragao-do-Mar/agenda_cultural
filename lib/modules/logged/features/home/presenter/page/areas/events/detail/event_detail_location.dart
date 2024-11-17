import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/espaco_model.dart';

class EventDetailLocation extends StatelessWidget {
  final Espaco spacePrincipal;

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
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            fontWeight: FontWeight.w600,
            color: corTextAtual,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          spacePrincipal.nome ?? '',
          style: GoogleFonts.inter(
            fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
        if (spacePrincipal.endereco != null)
          Text(
            spacePrincipal.endereco ?? '',
            style: GoogleFonts.inter(
              fontSize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
              color: corTextAtual,
            ),
          ),
      ],
    );
  }
}
