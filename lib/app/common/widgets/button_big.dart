import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class ButtonBig extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final double? border;
  final VoidCallback? function;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? textColor;
  final bool? negative;
  final BorderRadiusGeometry? borderRadius;

  const ButtonBig({
    super.key,
    this.width,
    this.text,
    this.border,
    this.height,
    this.function,
    this.margin,
    this.padding,
    this.textColor,
    this.negative,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    bool negativeButton = negative ?? false;

    return GestureDetector(
      onTap: function,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 65,
        margin: margin ?? const EdgeInsets.all(0),
        padding: padding ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: !negativeButton ? gradientPrincipal : null,
          border: negativeButton ? Border.all(color: corBackgroundLaranja, width: 3) : null,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            semanticsLabel: text ?? '',
            text ?? '',
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: textColor ?? (negativeButton ? corBackgroundLaranja : corBg),
            ),
          ),
        ),
      ),
    );
  }
}
