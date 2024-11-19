import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class ItemEventInfoWidget extends StatelessWidget {
  final String nameEvent;
  final String nameSpace;
  final String date;

  const ItemEventInfoWidget({
    super.key,
    required this.nameEvent,
    required this.nameSpace,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextContrasteFonte(
            text: nameEvent,
            maxlines: 2,
            style: GoogleFonts.roboto(
              fontSize: FontsApp.tamanhoBase - 4,
              fontWeight: FontWeight.w500,
              color: corTextAtual,
            ),
          ),
          const SizedBox(height: 5),
          Flex(
            direction: Axis.vertical,
            children: [
              TextContrasteFonte(
                text: nameSpace,
                style: GoogleFonts.roboto(
                  fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 12),
                  color: corTextAtual,
                ),
                maxlines: 2,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              TextContrasteFonte(
                text: date,
                style: GoogleFonts.roboto(
                  fontSize: FontsApp.tamanhoBase - (FontsApp.tamanhoFonteBase16 - 12),
                  fontWeight: FontWeight.w500,
                  color: corTextAtual,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
