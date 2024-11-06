// ignore_for_file: camel_case_types, must_be_immutable

import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class widgetBotao extends StatelessWidget {
  widgetBotao({
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
    this.child,
  });

  final double? width;
  final double? height;
  String? text;
  Widget? child;
  final double? border;
  final VoidCallback? function;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? textColor;
  final bool? negative;

  @override
  Widget build(BuildContext context) {
    bool negativo = negative ?? false;

    return GestureDetector(
      onTap: () {
        if (function != null) {
          function!();
        }
      },
      child: Semantics(
        container: true,
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 65,
          margin: margin ?? const EdgeInsets.all(0),
          padding: padding ?? const EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: !negativo ? gradientPrincipal : null,
            borderRadius: BorderRadius.all(
              Radius.circular(border ?? 5),
            ),
            border: negativo
                ? Border.all(color: corBackgroundLaranja, width: 3)
                : null,
          ),
          child: Center(
            child: child ??
                Text(
                  semanticsLabel: "Botão $text",
                  text ?? "?",
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color:
                        textColor ?? (negativo ? corBackgroundLaranja : corBg),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
