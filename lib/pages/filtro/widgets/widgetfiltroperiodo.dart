// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class widgetfiltroperiodo extends StatefulWidget {
  const widgetfiltroperiodo({
    super.key,
    required this.app,
    required this.options,
    required this.tedPeriodo,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedPeriodo;

  @override
  State<widgetfiltroperiodo> createState() => _widgetfiltroperiodoState();
}

class _widgetfiltroperiodoState extends State<widgetfiltroperiodo> {
  late List<String> opcoes;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const widgetEspacoH(altura: 16),
        Text(
          AppLocalizations.of(context)!.filter_periode,
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetEspacoH(altura: 5),
        GroupButton(
          options: widget.options,
          isRadio: true,
          onSelected: (
            str,
            index,
            isSelected,
          ) {
            widget.tedPeriodo.text = str;
            if (isSelected) {
              return index;
            }
          },
          buttons: [
            AppLocalizations.of(context)!.filter_periode_one,
            AppLocalizations.of(context)!.filter_periode_two,
            AppLocalizations.of(context)!.filter_periode_three,
            AppLocalizations.of(context)!.filter_periode_four,
            AppLocalizations.of(context)!.filter_periode_five,
          ],
        ),
      ],
    );
  }
}
