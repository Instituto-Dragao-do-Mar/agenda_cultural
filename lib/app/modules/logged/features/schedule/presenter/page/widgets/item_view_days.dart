import 'package:flutter/material.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/text_contrast_font.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

class ItemViewDaysWidget extends StatelessWidget {
  final DateTime data;
  final bool selecionada;

  const ItemViewDaysWidget({
    super.key,
    required this.data,
    required this.selecionada,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 70,
      decoration: selecionada
          ? const BoxDecoration(
              gradient: gradientPrincipal,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )
          : BoxDecoration(
              color: corBackgroundLaranja.withOpacity(.2),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextContrastFont(
            text: data.toIso8601String().formatDate(format: "dd"),
            style: TextStyle(
              fontSize: selecionada ? 26 : 22,
              color: selecionada ? Colors.white : corTextAtual,
              fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 5),
          TextContrastFont(
            text: selecionada
                ? data.toIso8601String().formatDate(format: "E").toUpperCase()
                : data.toIso8601String().formatDate(format: "E").capitalize(),
            style: TextStyle(
              fontSize: selecionada ? 20 : 16,
              color: selecionada ? Colors.white : corTextAtual,
              fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
