// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    bool negative = false;

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
          gradient: !negative ? gradientPrincipal: null,
          border: negative ? Border.all(color: corBackgroundLaranja, width: 3) : null,
        ),
        child: Center(
          child: Text(
            semanticsLabel: "Botão $text",
            text ?? "?",
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: textColor ??
                  (negative ? corBackgroundLaranja : corBg),
            ),
          ),
        ),
      ),
    );
  }
}
