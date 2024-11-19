import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fonts.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';

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
  List<String> classifTrad = [];
  GroupButtonController controller = GroupButtonController();

  @override
  void initState() {
    super.initState();
    processaOpcoes();
  }

  void processaOpcoes() {
    opcoes = [];
    // for (Event e in widget.app.listaEventos.eventos!) {
    //   if (!opcoes.any((element) => element == e.classificacaoetaria)) {
    //     opcoes.add(e.classificacaoetaria!);
    //   }
    // }
  }

  void traduzOpcoes() {
    var an = AppLocalizations.of(context)!.e_more_info_years;
    var fr = AppLocalizations.of(context)!.e_more_info_classif_free;
    for (String classificacao in opcoes) {
      String classificacaoTrad = '';
      classificacao == 'Livre'
          ? classificacaoTrad = fr
          : classificacaoTrad.replaceAll('anos', an);
      classifTrad.add(classificacaoTrad);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    traduzOpcoes();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const widgetEspacoH(altura: 16),
        Text(
          AppLocalizations.of(context)!.e_more_info_classif,
          style: FontsApp.poppins16W400Black(FontsApp.tamanhoBase),
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
          buttons: classifTrad,
        ),
      ],
    );
  }
}
