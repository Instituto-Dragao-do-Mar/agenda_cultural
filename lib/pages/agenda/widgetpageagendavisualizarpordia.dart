// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

import '../../model/cores.dart';
import '../../shared/constantes.dart';
import '../../shared/widgetTextFonteContraste.dart';

class widgetPageAgendaVisualizarPorDia extends StatelessWidget {
  const widgetPageAgendaVisualizarPorDia({
    super.key,
    required this.data,
    required this.selecionada,
  });

  final DateTime data;
  final bool selecionada;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 80,
      width: 70,
      decoration: selecionada
          ? BoxDecoration(
              gradient: gradientPrincipal,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            )
          : BoxDecoration(
              color: corBackgroundLaranja.withOpacity(.2),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextContrasteFonte(
            text: data.toIso8601String().formatDate(format: "dd"),
            style: TextStyle(
              fontSize: selecionada ? 26 : 22,
              color: selecionada ? Colors.white : corTextAtual,
              fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 5),
          TextContrasteFonte(
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
