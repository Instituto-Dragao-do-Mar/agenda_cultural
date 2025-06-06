import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class ItemSpaceInfo extends StatelessWidget {
  final String? nameSpace;
  final String address;

  const ItemSpaceInfo({
    super.key,
    required this.nameSpace,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextContrastFont(
            text: nameSpace ?? 'Nome não informado!',
            maxlines: 2,
            style: GoogleFonts.roboto(
              fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 12),
              fontWeight: FontWeight.w500,
              color: corTextAtual,
            ),
          ),
          const SizedBox(height: 5),
          Flex(
            direction: Axis.vertical,
            children: [
              TextContrastFont(
                text: address != '' ? address : 'Endereço não informado!',
                style: GoogleFonts.roboto(
                  fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 12),
                  color: corTextAtual,
                ),
                maxlines: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
