import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

import '../model/colors.dart';
import '../model/fonts.dart';

class TextContrasteFonte extends StatefulWidget {
  final TextStyle? style;
  final String? text;
  final Color? color;
  final FontWeight? weight;
  final String? semantics;
  final TextAlign? align;
  final double? fontsize;
  final int? maxlines;

  const TextContrasteFonte({
    Key? key,
    this.color,
    this.text,
    this.style,
    this.weight,
    this.semantics,
    this.align,
    this.fontsize,
    this.maxlines,
  }) : super(key: key);

  @override
  State<TextContrasteFonte> createState() => _TextContrasteFonteState();
}

class _TextContrasteFonteState extends State<TextContrasteFonte> {
  bool statusAltoContraste = ColorsApp.contraste;
  double fontSize = FontsApp.tamanhoBase.toDouble();

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text ?? "",
      style: widget.style ??
          TextStyle(
            color: widget.color ?? corTextAtual,
            fontSize: widget.fontsize ?? fontSize,
            fontWeight: widget.weight,
          ),
      overflow: TextOverflow.ellipsis,
      semanticsLabel: widget.semantics,
      textAlign: widget.align,
      maxLines: widget.maxlines,
    );
  }
}
