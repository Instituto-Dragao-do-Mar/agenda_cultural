import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/controller/evento_controller.dart';

class ButtonFavoriteWidget extends StatefulWidget {
  final Evento evento;
  final bool isCardEvent;

  const ButtonFavoriteWidget({
    super.key,
    required this.evento,
    this.isCardEvent = false,
  });

  @override
  State<ButtonFavoriteWidget> createState() => _ButtonFavoriteWidgetState();
}

class _ButtonFavoriteWidgetState extends State<ButtonFavoriteWidget> {
  late AppModel app;
  List<Favorito> favorites = <Favorito>[];
  int isFavorite = 0;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();

    favorites = app.listaFavoritos.favoritos ?? <Favorito>[];
    favorites.map((e) => e.idevento).contains(widget.evento.id) ? isFavorite = 1 : isFavorite = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: isFavorite == 1
          ? 'Remover ${widget.evento.nome} dos favoritos'
          : 'Adicionar ${widget.evento.nome} aos favoritos',
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: GestureDetector(
          onTap: () async {
            if (app.usuarioLogado?.guidid == null) {
              notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.e_alert_favorite,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pageLogin(),
                  ),
                ),
              );
              return;
            }

            var isFavorited = await EventoController().postFavorited(
              userguidid: app.usuarioLogado?.guidid ?? '',
              token: app.usuarioLogado?.signature ?? '',
              idevento: widget.evento.id ?? 0,
              ativo: isFavorite,
            );

            if (isFavorited) {
              setState(() => isFavorite == 0 ? isFavorite = 1 : isFavorite = 0);
            }
          },
          child: Icon(
            Icons.favorite,
            color: isFavorite == 1
                ? Colors.red
                : widget.isCardEvent
                    ? Colors.white
                    : Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
