import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/app/common/utils/tradutors.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';

class FilterCategoryWidget extends StatefulWidget {
  const FilterCategoryWidget({
    super.key,
    required this.app,
    required this.options,
    required this.tedCategoria,
  });

  final AppModel app;
  final GroupButtonOptions options;
  final TextEditingController tedCategoria;

  @override
  State<FilterCategoryWidget> createState() => _FilterCategoryWidgetState();
}

class _FilterCategoryWidgetState extends State<FilterCategoryWidget> {
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
    // opcoes = widget.app.listaCategoria.categorias!.map((e) => e.nome!).toList();
  }

  void traduzOpcoes() {
    for (String categoria in opcoes) {
      String categoriaTrad = getNomeCategoria(categoria, context);
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
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context)!.e_category,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
        ),
        const SizedBox(height: 5),
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
