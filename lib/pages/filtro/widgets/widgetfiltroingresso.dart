// ignore_for_file: camel_case_types

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class widgetfiltroingresso extends StatefulWidget {
  const widgetfiltroingresso({
    super.key,
    required this.app,
    required this.options,
    required this.tedIngresso,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedIngresso;

  @override
  State<widgetfiltroingresso> createState() => _widgetfiltroingressoState();
}

class _widgetfiltroingressoState extends State<widgetfiltroingresso> {
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
          'Ingresso',
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
            widget.tedIngresso.text = str;
            if (isSelected) {
              return index;
            }
          },
          buttons: const [
            "Todos",
            "Gratuito",
            "Pago",
          ],
        ),
      ],
    );
  }
}
