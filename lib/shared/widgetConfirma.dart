import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

void widgetConfirma({
  String titulo = 'Atenção',
  String? descricao,
  BuildContext? context,
  VoidCallback? funcaoSim,
  String? textBotao,
  bool? cancelar = true,
}) {
  showAdaptiveActionSheet(
    context: context!,
    title: Text(descricao!),
    actions: <BottomSheetAction>[
      BottomSheetAction(
        title: Text(textBotao ?? 'Sim'),
        onPressed: (context) {
          Navigator.pop(context);
          funcaoSim!();
        },
      ),
    ],
    cancelAction: cancelar == true ? CancelAction(title: Text('Cancela')) : null,
  );
}
