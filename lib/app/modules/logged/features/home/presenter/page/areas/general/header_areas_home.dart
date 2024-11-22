import 'package:flutter/material.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

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
          TextContrastFont(text: title, weight: FontWeight.w600, semantics: title),
          InkWell(
            onTap: () => onTap(),
            child: secundaryComponent ??
                TextContrastFont(
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
