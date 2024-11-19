import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/app/common/utils/tradutors.dart';

class FiltroAcessibilidadeWidget extends StatefulWidget {
  const FiltroAcessibilidadeWidget({
    super.key,
    required this.app,
    required this.options,
    required this.tedAcessibilidade,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedAcessibilidade;

  @override
  State<FiltroAcessibilidadeWidget> createState() =>
      _FiltroAcessibilidadeWidgetState();
}

class _FiltroAcessibilidadeWidgetState
    extends State<FiltroAcessibilidadeWidget> {
  late List<String> opcoes;
  List<String> acessibTrad = [];
  bool jaInicializado = false;
  bool expandido = false;
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    // if (widget.app.listaEspacos.espacos != null &&
    //     widget.app.listaEspacos.espacos!.isNotEmpty) {
    //   for (Espaco e in widget.app.listaEspacos.espacos!) {
    //     if (e.acessibilidadeFisica != null &&
    //         e.acessibilidadeFisica!.isNotEmpty) {
    //       for (String s in e.acessibilidadeFisica!.split(';')) {
    //         if (!opcoes.any((element) => element == s)) {
    //           opcoes.add(s);
    //         }
    //       }
    //     }
    //   }
    // }
  }

  void traduzOpcoes() {
    for (String acessibilidade in opcoes) {
      String acessTrad = getNomeAcessib(acessibilidade, context);
      acessibTrad.add(acessTrad);
    }
    if (!expandido) {
      if (acessibTrad.length > 4) {
        acessibTrad.removeRange(3, acessibTrad.length);
        acessibTrad.add('Ver mais');
      }
    } else {
      acessibTrad.removeRange(0, 4);
      acessibTrad.add('Ver menos');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (jaInicializado == false) {
      traduzOpcoes();
      jaInicializado = true;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const widgetEspacoH(altura: 16),
        Text(
          AppLocalizations.of(context)!.e_accessibility,
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
              traduzOpcoes();
              controller.unselectAll();
              setState(() {}); 
            } else if (str == 'Ver menos') {
              expandido = false;
              processaOpcoes();
              traduzOpcoes();
              controller.unselectAll();
              setState(() {});
            } else {
              widget.tedAcessibilidade.text = str;
            }
            if (isSelected) {
              return index;
            }
          },
          buttons: acessibTrad,
        ),
      ],
    );
  }
}
