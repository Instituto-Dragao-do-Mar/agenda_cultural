import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/localizacaopage/my_location_page.dart';

class AreaLocationWidget extends StatelessWidget {
  const AreaLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 8),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyLocationPage(),
          ),
        ),
        child: Row(
          children: [
            TextContrasteFonte(
              text: AppLocalizations.of(context)!.home_location,
              color: corBackgroundLaranja,
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios,
              color: corBackgroundLaranja,
              size: Fontes.tamanhoBase.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
