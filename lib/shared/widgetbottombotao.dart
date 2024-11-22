import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class widgetBottomBotao extends StatelessWidget {
  const widgetBottomBotao({
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

  @override
  Widget build(BuildContext context) {
    bool _negative = negative ?? false;

    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 65,
        margin: margin ?? const EdgeInsets.all(0),
        padding: padding ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: !_negative ? gradientPrincipal: null,
          border: _negative ? Border.all(color: corBackgroundLaranja, width: 3) : null,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            semanticsLabel: "Botão $text",
            text ?? "?",
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: textColor ??
                  (_negative ? corBackgroundLaranja : corBg),
            ),
          ),
        ),
      ),
    );
  }
}
