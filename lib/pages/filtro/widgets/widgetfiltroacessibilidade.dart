// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class widgetfiltroacessibilidade extends StatefulWidget {
  const widgetfiltroacessibilidade({
    super.key,
    required this.app,
    required this.options,
    required this.tedAcessibilidade,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedAcessibilidade;

  @override
  State<widgetfiltroacessibilidade> createState() =>
      _widgetfiltroacessibilidadeState();
}

class _widgetfiltroacessibilidadeState
    extends State<widgetfiltroacessibilidade> {
  late List<String> opcoes;
  bool expandido = false;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    if (widget.app.listaEspacos.espacos != null &&
        widget.app.listaEspacos.espacos!.isNotEmpty) {
      for (Espaco e in widget.app.listaEspacos.espacos!) {
        if (e.acessibilidadeFisica != null &&
            e.acessibilidadeFisica!.isNotEmpty) {
          for (String s in e.acessibilidadeFisica!.split(';')) {
            if (!opcoes.any((element) => element == s)) {
              opcoes.add(s);
            }
          }
        }
      }
    }
    if (!expandido) {
      if (opcoes.length > 4) {
        opcoes.removeRange(3, opcoes.length);
        opcoes.add('Ver mais');
      }
    } else {
      opcoes.add('Ver menos');
    }
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
          'Acessibilidade',
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetEspacoH(altura: 5),
        GroupButton(
          options: widget.options,
          isRadio: true,
          controller: controller,
          onSelected: (str, index, isSelected) {
            if (str == 'Ver mais') {
              expandido = true;
              processaOpcoes();
              controller.unselectAll();
              setState(() {});
            } else if (str == 'Ver menos') {
              expandido = false;
              processaOpcoes();
              controller.unselectAll();
              setState(() {});
            } else {
              widget.tedAcessibilidade.text = str;
            }            
            if (isSelected) {
              return index;
            }
          },
          buttons: opcoes,
        ),
      ],
    );
  }
}
