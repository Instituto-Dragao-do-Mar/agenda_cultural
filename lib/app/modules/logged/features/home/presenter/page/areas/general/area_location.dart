import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class AreaLocationWidget extends StatelessWidget {
  final void Function() onTapNavigateLocation;

  const AreaLocationWidget({
    super.key,
    required this.onTapNavigateLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 8),
      child: GestureDetector(
        onTap: onTapNavigateLocation,
        child: Row(
          children: [
            TextContrastFont(
              text: AppLocalizations.of(context)!.home_location,
              color: corBackgroundLaranja,
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios,
              color: corBackgroundLaranja,
              size: FontsApp.tamanhoBase.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
