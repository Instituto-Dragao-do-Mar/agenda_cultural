import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';

class SpaceDetailLocationWidget extends StatelessWidget {
  final String address;

  const SpaceDetailLocationWidget({
    super.key,
    required this.address,
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
          address,
          style: GoogleFonts.inter(
            fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 14),
            color: corTextAtual,
          ),
        ),
      ],
    );
  }
}
