// ignore_for_file: camel_case_types

import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/dates.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
          color: corBackground.withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.toIso8601String().formatDate(format: "dd"),
            style: TextStyle(
              fontSize: selecionada ? 26 : 22,
              color: Colors.black,
              fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            selecionada
                ? data.toIso8601String().formatDate(format: "E").toUpperCase()
                : data.toIso8601String().formatDate(format: "E").capitalize(),
            style: TextStyle(
              fontSize: selecionada ? 20 : 16,
              color: Colors.black,
              fontWeight: selecionada ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
