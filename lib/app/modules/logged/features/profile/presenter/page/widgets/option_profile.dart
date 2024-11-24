import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/common/widgets/text_contrast_font.dart';

class OptionProfileWidget extends StatelessWidget {
  final String subtitle;
  final void Function()? onTap;

  const OptionProfileWidget({
    super.key,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Semantics(
        label: subtitle,
        child: GestureDetector(
          onTap: onTap,
          child: TextContrastFont(
            text: subtitle,
            style: FontsApp.roboto16W400Grey(FontsApp.tamanhoBase),
            semantics: subtitle,
          ),
        ),
      ),
    );
  }
}
