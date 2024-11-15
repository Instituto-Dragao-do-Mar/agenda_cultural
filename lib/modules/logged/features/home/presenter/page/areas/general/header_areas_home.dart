import 'package:flutter/material.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class HeaderCardsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onTap;
  final Widget? secundaryComponent;

  const HeaderCardsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.secundaryComponent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextContrasteFonte(text: title, weight: FontWeight.w600, semantics: title),
          InkWell(
            onTap: () => onTap(),
            child: secundaryComponent ??
                TextContrasteFonte(
                  text: subtitle,
                  color: corBackgroundLaranja,
                  weight: FontWeight.w600,
                  semantics: subtitle,
                ),
          )
        ],
      ),
    );
  }
}
