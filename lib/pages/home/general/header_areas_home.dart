import 'package:flutter/material.dart';

import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';

class HeaderCardsCategoryWidget extends StatelessWidget {
  const HeaderCardsCategoryWidget({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.funcao,
    this.widget,
  });

  final String titulo;
  final String subtitulo;
  final VoidCallback funcao;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextContrasteFonte(
            text: titulo,
            weight: FontWeight.w600,
            semantics: titulo,
          ),
          InkWell(
            onTap: () => funcao(),
            child: widget ??
                TextContrasteFonte(
                  text: subtitulo,
                  color: corBackgroundLaranja,
                  weight: FontWeight.w600,
                  semantics: subtitulo,
                ),
          )
        ],
      ),
    );
  }
}
