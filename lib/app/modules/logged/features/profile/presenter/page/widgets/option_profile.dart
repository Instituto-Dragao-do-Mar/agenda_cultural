import 'package:flutter/material.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/shared/widgetemconstrucao.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class OptionProfileWidget extends StatelessWidget {
  final String subtitle;
  final Widget? landingPage;
  final void Function()? onTap;

  const OptionProfileWidget({
    super.key,
    required this.subtitle,
    this.landingPage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Semantics(
        label: subtitle,
        child: GestureDetector(
          onTap: onTap ??
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => landingPage ?? const widgetEmConstrucao(),
                  ),
                );
              },
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
