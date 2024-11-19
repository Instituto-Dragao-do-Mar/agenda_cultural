import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:agendacultural/shared/widgetdropdownsearch.dart';

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
    // for (Espaco e in widget.app.listaEspacos.espacos!) {
    //   if (!opcoes.any((element) => element == e.nome)) {
    //     opcoes.add(e.nome!);
    //   }
    // }
    opcoes.insert(0, 'Selecionar espaço');
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
          AppLocalizations.of(context)!.filter_spaces,
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetEspacoH(altura: 5),
        widgetDropdownSearch(
          funcao: (s) {},
          valorInicial: AppLocalizations.of(context)!.filter_sel_space,
          itens: opcoes,
          width: 400,
        ),
      ],
    );
  }
}
