import 'package:agendacultural/model/cores.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:flutter/material.dart';

class InsertDateWidget extends StatelessWidget {
  final void Function() onTapDate;
  final bool firstDate;
  final String label;
  final TextEditingController controller;

  const InsertDateWidget({
    super.key,
    required this.onTapDate,
    required this.controller,
    required this.label,
    required this.firstDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDate,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(firstDate ? 10 : 0),
            bottomLeft: Radius.circular(firstDate ? 10 : 0),
            topRight: Radius.circular(!firstDate ? 10 : 0),
            bottomRight: Radius.circular(!firstDate ? 10 : 0),
          ),
          border: Border.all(color: Cores.contraste ? Colors.white : corBackgroundLaranja.withOpacity(.2)),
        ),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextContrasteFonte(
              text: label,
              color: corBackgroundLaranja,
              weight: FontWeight.bold,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
            const SizedBox(width: 5),
            TextContrasteFonte(
              text: controller.text.formatDate(format: "E, dd MMM"),
              color: corTextAtual,
              fontsize: Fontes.tamanhoBase - (Fontes.tamanhoFonteBase16 - 14),
            ),
          ],
        ),
      ),
    );
  }
}
