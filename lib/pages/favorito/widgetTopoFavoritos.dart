// ignore_for_file: file_names, must_be_immutable

import 'package:agendacultural/pages/home/general/widgettopocomum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetTopoFavoritos extends StatelessWidget {
  Function? notify;
  WidgetTopoFavoritos({super.key, this.notify});

  @override
  Widget build(BuildContext context) {
    return widgetTopoComum(
      text: AppLocalizations.of(context)!.favorites_title,
      funcaoImagem1: () async {
        notify!();
      },
      urlImagem1: 'seta.png',
      labelImagem1: "Voltar para página anterior",
      semanticsLabel: "Página de ",
      // funcaoImagem2: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const pageFiltro(),
      //     ),
      //   );
      // },
      // urlImagem2: 'favoritos.png',
      // labelImagem2: "Filtrar",
    );
  }
}
