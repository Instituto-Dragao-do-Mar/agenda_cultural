import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';

enum EditPopupType { texto, data, drop, datahora, ligadesliga }

class EditPopup {
  String? titulo;
  EditPopupType? tipo;
  TextEditingController? edit;
  bool? obrigatorio;
  List<String>? opcoes;
  Function(String)? funcao;
  int? maxlines;

  EditPopup({
    this.titulo,
    this.edit,
    this.tipo,
    this.obrigatorio,
    this.opcoes,
    this.funcao,
    this.maxlines,
  });
}

typedef MyFunction = Future<bool> Function();

Future<void> showFuturePopupDialog({
  BuildContext? context,
  List<EditPopup>? edits,
  MyFunction? functionButton,
  String? label,
}) async {
  await showDialog<void>(
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          label ?? 'Informe os parâmetros',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        content: SizedBox(
          height: (edits!.length * 32) + 120,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: edits.map((e) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 3, child: _getField(context, e)),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: corBackgroundLaranja),
            onPressed: () async {
              if (functionButton != null) {
                bool retorno = await functionButton();
                if (retorno) {
                  Navigator.of(context).pop();
                }
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              AppLocalizations.of(context)!.e_alert_send,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}

Widget _getField(BuildContext context, EditPopup e) {
  switch (e.tipo) {
    case EditPopupType.texto:
      return Padding(
        padding: const EdgeInsets.all(4),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withValues(alpha: .04),
            contentPadding: const EdgeInsets.all(16),
            focusColor: Colors.black,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: .5, color: Color(0XFFD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: corBackgroundLaranja),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
          ),
          controller: e.edit,
          maxLines: 3,
        ),
      );
    case EditPopupType.drop:
      return Container();
    default:
      return Container();
  }
}
