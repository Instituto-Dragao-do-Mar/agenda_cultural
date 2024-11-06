// ignore_for_file: file_names

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/shared/widgetNotificacaoPopUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/event/item_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetFavoritos extends StatefulWidget {
  const WidgetFavoritos({Key? key}) : super(key: key);

  @override
  State<WidgetFavoritos> createState() => _WidgetFavoritosState();
}

class _WidgetFavoritosState extends State<WidgetFavoritos> {
  late AppModel app;
  late BaseController baseController;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();
    app.getFavoritos();
    baseController = context.read<BaseController>();
  }

  @override
  Widget build(BuildContext context) {
    showNaoLogadoFavoritos();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: app.listaEventos.eventos!
                  .where((evento) =>
                      app.listaFavoritos.favoritos
                          ?.map((e) => e.idevento)
                          .contains(evento.id) ==
                      true)
                  .map(
                (e) {
                  return ItemEventWidget(
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

  Future<void> showNaoLogadoFavoritos() async {
    await Future.delayed(
      const Duration(seconds: 0),
      () async {
        if (!app.isLog()) {
          widgetNotificaoPopUp(
            context: context,
            permitirFechar: true,
            textDescritivo: AppLocalizations.of(context)!.e_alert_favorite_page,
            textBotao:
                AppLocalizations.of(context)!.profile_general_alert_accept,
            funcaoBotao: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const pageLogin(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
