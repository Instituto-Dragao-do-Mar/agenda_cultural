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
  List<Favorito> favoritos = <Favorito>[];
  int favorito = 0;

  AppModel? app;

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();

    favoritos = app?.listaFavoritos.favoritos ?? <Favorito>[];
    favoritos.map((e) => e.idevento).contains(widget.evento.id) ? favorito = 1 : favorito = 0;
  }

  @override
  Widget build(BuildContext context) {
    app?.getFavoritos();

    return Semantics(
      label: favorito == 1
          ? ("Remover ${widget.evento.nome} dos favoritos")
          : "Adicionar ${widget.evento.nome} aos favoritos",
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: GestureDetector(
          onTap: () async {
            if (!app!.isLog()) {
              notifyPopUpWidget(
                context: context,
                permitirFechar: true,
                textDescritivo: AppLocalizations.of(context)!.e_alert_favorite,
                textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
                funcaoBotao: () async => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const pageLogin(),
                  ),
                ),
              );
              return;
            }

            var isFavorited = await EventoController().favoritosPost(
              userguidid: app?.GetGuidId() ?? "",
              token: app?.GetToken() ?? "",
              idevento: widget.evento.id ?? 0,
              ativo: favorito,
            );

            if (isFavorited) {
              setState(() => favorito == 0 ? favorito = 1 : favorito = 0);
            }
          },
          child: Icon(
            Icons.favorite,
            color: favorito == 1
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
