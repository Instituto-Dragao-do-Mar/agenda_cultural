// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class widgetBotao extends StatelessWidget {
  const widgetBotao({
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
          color: _negative ? corBackgroundNegative : corBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(border ?? 5),
          ),
          border: _negative ? Border.all(color: corBackground, width: 3) : null,
        ),
        child: Center(
          child: Text(
            text ?? "?",
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: textColor ??
                  (_negative ? corBackground : corBackgroundNegative),
            ),
          ),
        ),
      ),
    );
  }
}
