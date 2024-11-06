import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltroCategoriaWidget extends StatefulWidget {
  const FiltroCategoriaWidget({
    super.key,
    required this.app,
    required this.options,
    required this.tedCategoria,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedCategoria;

  @override
  State<FiltroCategoriaWidget> createState() => _FiltroCategoriaWidgetState();
}

class _FiltroCategoriaWidgetState extends State<FiltroCategoriaWidget> {
  late List<String> opcoes;
  List<String> categTrad = [];
  bool jaInicializado = false;
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
  }

  void traduzOpcoes() {
    for (String categoria in opcoes) {
      String categoriaTrad = widget.app.getNomeCategoria(categoria, context);
      categTrad.add(categoriaTrad);
    }
    if (!expandido) {
      if (categTrad.length > 4) {
        categTrad.removeRange(3, categTrad.length);
        categTrad.add('Ver mais');
      }
    } else {
      categTrad.removeRange(0, 4);
      categTrad.add('Ver menos');
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
          AppLocalizations.of(context)!.e_category,
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
              widget.tedCategoria.text = str;
            }
            if (isSelected) {
              return index;
            }
          },
          buttons: categTrad,
        ),
      ],
    );
  }
}
