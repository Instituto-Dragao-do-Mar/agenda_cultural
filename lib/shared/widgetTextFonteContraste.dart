import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

import '../model/cores.dart';
import '../model/fontes.dart';

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
    super.key,
    this.color,
    this.text,
    this.style,
    this.weight,
    this.semantics,
    this.align,
    this.fontsize,
    this.maxlines,
  });

  @override
  State<TextContrasteFonte> createState() => _TextContrasteFonteState();
}

class _TextContrasteFonteState extends State<TextContrasteFonte> {
  bool statusAltoContraste = Cores.contraste;
  double fontSize = Fontes.tamanhoBase.toDouble();

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
      semanticsLabel: widget.semantics,
      textAlign: widget.align,
      maxLines: widget.maxlines,
    
      
    );
  }
}
