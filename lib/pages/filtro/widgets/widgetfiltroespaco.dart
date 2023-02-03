// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetdropdownsearch.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class widgetfiltroespaco extends StatefulWidget {
  const widgetfiltroespaco({
    super.key,
    required this.app,
    required this.options,
    required this.tedEspaco,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedEspaco;

  @override
  State<widgetfiltroespaco> createState() => _widgetfiltroespacoState();
}

class _widgetfiltroespacoState extends State<widgetfiltroespaco> {
  late List<String> opcoes;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    for (Espaco e in widget.app.listaEspacos.espacos!) {
      if (!opcoes.any((element) => element == e.nome)) {
        opcoes.add(e.nome!);
      }
    }
    opcoes.insert(0, 'Selecionar Espaço');
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
          'Espaços Culturais',
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetEspacoH(altura: 5),        
        widgetDropdownSearch(
          funcao: (s) {},
          valorInicial: 'Selecionar espaço',
          itens: opcoes,
          width: 400,
        ),
      ],
    );
  }
}
