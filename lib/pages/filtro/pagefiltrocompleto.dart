// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroacessibilidade.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltrocategoria.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroclassificacao.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroespaco.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroingresso.dart';
import 'package:agendacultural/pages/filtro/widgets/widgetfiltroperiodo.dart';
import 'package:agendacultural/pages/home/widgethomeminhalocalizacao.dart';
import 'package:agendacultural/pages/home/widgets/widgettopocomum.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/shared/widgetbottombotao.dart';
import 'package:agendacultural/shared/widgetespacoh.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

class pageFiltroCompleto extends StatefulWidget {
  const pageFiltroCompleto({super.key});

  @override
  State<pageFiltroCompleto> createState() => _pageFiltroCompletoState();
}

class _pageFiltroCompletoState extends State<pageFiltroCompleto> {
  late AppModel app;
  int? fonte;
  bool? contraste = false;  

  GroupButtonOptions options = GroupButtonOptions(
    selectedShadow: const [],
    selectedTextStyle: const TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
    selectedColor: corBackgroundLaranja,
    unselectedShadow: const [],
    unselectedColor: corBackgroundNegative,
    unselectedTextStyle: TextStyle(
      fontSize: 12,
      color: Colors.amber[900],
    ),
    selectedBorderColor: corBackgroundLaranja,
    unselectedBorderColor: corBackgroundLaranja,
    borderRadius: BorderRadius.circular(5),
    spacing: 10,
    runSpacing: 10,
    groupingType: GroupingType.wrap,
    direction: Axis.horizontal,
    mainGroupAlignment: MainGroupAlignment.start,
    crossGroupAlignment: CrossGroupAlignment.start,
    groupRunAlignment: GroupRunAlignment.start,
    textAlign: TextAlign.center,
    textPadding: EdgeInsets.zero,
    alignment: Alignment.center,
    elevation: 0,
  );

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widgetTopoComum(
            text: "Filtrar",
            funcaoImagem1: () async {
              Navigator.pop(context);
            },
            urlImagem1: 'seta.png',
          ),
          const widgetEspacoH(altura: 16),
          Expanded(
            child: Scrollbar(
              controller: scrollController,
              trackVisibility: true,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: ListadeFiltros(),
              ),
            ),
          ),
          const widgetEspacoH(altura: 16),
          widgetBottomBotao(
            function: () {},
            text: "Aplicar",
          ),
        ],
      ),
    );
  }

  Widget ListadeFiltros() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Localização',
          style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
        ),
        const widgetHomeMinhaLocalizacao(),
        const widgetEspacoH(altura: 16),
        widgetfiltroespaco(
          app: app,
          options: options,
          tedEspaco: app.tedEspaco,
        ),
        const widgetEspacoH(altura: 16),
        
        widgetfiltroperiodo(
          app: app,
          options: options,
          tedPeriodo: app.tedPeriodo,
        ),
        widgetfiltrocategoria(
          app: app,
          options: options,
          tedCategoria: app.tedCategoria,
         
        ),
        widgetfiltroclassificacao(
          app: app,
          options: options,
          tedClassificacao: app.tedClassificacao,
        ),
        widgetfiltroacessibilidade(
          app: app,
          options: options,
          tedAcessibilidade:app. tedAcessibilidade,
        ),
        widgetfiltroingresso(
          app: app,
          options: options,
          tedIngresso: app.tedIngresso,
        ),
      ],
    );
  }
}
