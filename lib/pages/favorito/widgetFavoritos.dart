import 'package:agendacultural/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/fontes.dart';
import '../../shared/widgetTextFonteContraste.dart';
import '../../shared/widgetimagem.dart';
import '../evento/widgethomeeventoscontainer.dart';

class WidgetFavoritos extends StatefulWidget {
  const WidgetFavoritos({Key? key}) : super(key: key);

  @override
  State<WidgetFavoritos> createState() => _WidgetFavoritosState();
}

class _WidgetFavoritosState extends State<WidgetFavoritos> {
  late AppModel app;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    app = context.read<AppModel>();
    app.getFavoritos();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextContrasteFonte(
                  text: 'Favoritos',
                  style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: app.listaEventos.eventos!.where((evento) => app.listaFavoritos.favoritos
                  ?.map((e) => e.idevento).contains(evento.id) == true).map(
                (e) {
                  return widgetHomeCategoriasEventosContainer(
                    evento: e,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
