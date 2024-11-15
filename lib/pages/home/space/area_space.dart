import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/dados/dados.dart';
import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/home/space/item_space.dart';
import 'package:agendacultural/modules/logged/features/home/presenter/page/areas/general/header_areas_home.dart';

class AreaSpaceWidget extends StatefulWidget {
  const AreaSpaceWidget({super.key});

  @override
  State<AreaSpaceWidget> createState() => _AreaSpaceWidgetState();
}

class _AreaSpaceWidgetState extends State<AreaSpaceWidget> {
  ScrollController scrollController = ScrollController();
  bool wrap = false;

  late AppModel app;

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);

    if (!Dados.verTodosEspacos) {
      wrap = false;
    } else {
      wrap = true;
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) {
    int contadorDisplay = 0;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 20),
        HeaderCardsWidget(
          title: AppLocalizations.of(context)!.home_spaces_title,
          subtitle: Dados.verTodosEspacos
              ? AppLocalizations.of(context)!.home_spaces_less
              : AppLocalizations.of(context)!.home_spaces_all,
          onTap: () async {
            Dados.verTodosEspacos = !Dados.verTodosEspacos;
            await Dados.setBool('espacos', Dados.verTodosEspacos);
            setState(() {});
          },
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: Dados.verTodosEspacos ? 500 : 263 / Fontes.tamanhoFonteBase16 * Fontes.tamanhoBase,
          child: SingleChildScrollView(
            scrollDirection: Dados.verTodosEspacos ? Axis.vertical : Axis.horizontal,
            controller: scrollController,
            child: Wrap(
              children: app.listaEspacos.espacos!.map(
                (e) {
                  if (!wrap && contadorDisplay > 9) {
                    return const SizedBox.shrink();
                  }
                  if (e.aprovado == 0) {
                    return const SizedBox.shrink();
                  }

                  contadorDisplay++;

                  return ItemSpaceWidget(espaco: e);
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
