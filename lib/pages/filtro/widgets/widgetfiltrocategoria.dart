// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class widgetfiltrocategoria extends StatefulWidget {
  const widgetfiltrocategoria({
    super.key,
    required this.app,
    required this.options,
    required this.tedCategoria,
  
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedCategoria;

  @override
  State<widgetfiltrocategoria> createState() => _widgetfiltrocategoriaState();
}

class _widgetfiltrocategoriaState extends State<widgetfiltrocategoria> {
  late List<String> opcoes;
  late bool expandido;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    expandido = false;

    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = widget.app.listaCategoria.categorias!.map((e) => e.nome!).toList();
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
          'Categoria',
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
              widget.tedCategoria.text = str;
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
