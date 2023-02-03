// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class widgetfiltroclassificacao extends StatefulWidget {
  const widgetfiltroclassificacao({
    super.key,
    required this.app,
    required this.options,
    required this.tedClassificacao,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedClassificacao;

  @override
  State<widgetfiltroclassificacao> createState() =>
      _widgetfiltroclassificacaoState();
}

class _widgetfiltroclassificacaoState extends State<widgetfiltroclassificacao> {
  late List<String> opcoes;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    for (Evento e in widget.app.listaEventos.eventos!) {
      if (!opcoes.any((element) => element == e.classificacaoetaria)) {
        opcoes.add(e.classificacaoetaria!);
      }
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
          'Classificação',
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetEspacoH(altura: 5),
        GroupButton(
          options: widget.options,
          isRadio: true,
          controller: controller,
          onSelected: (str, index, isSelected) {
            widget.tedClassificacao.text = str;
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
