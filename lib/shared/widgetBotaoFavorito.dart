import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/shared/widgetNotificacaoPopUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controller/evento_controller.dart';
import '../model/app_model.dart';
import '../model/evento_model.dart';
import '../model/favorito_model.dart';

class WidgetBotaoFavorito extends StatefulWidget {
  Evento evento;

  WidgetBotaoFavorito({super.key, required this.evento});

  @override
  State<WidgetBotaoFavorito> createState() => _WidgetBotaoFavoritoState();
}

class _WidgetBotaoFavoritoState extends State<WidgetBotaoFavorito> {
  List<Favorito> favoritos = <Favorito>[];
  AppModel? app;
  int favorito = 0;

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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () async {
            if (!app!.isLog()) {
              widgetNotificaoPopUp(
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
            color: favorito == 1 ? Colors.red : Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}
