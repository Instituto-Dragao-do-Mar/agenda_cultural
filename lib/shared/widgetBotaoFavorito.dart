import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/shared/widgetConfirma.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    favoritos.map((e) => e.idevento).contains(widget.evento.id)
        ? favorito = 1
        : favorito = 0;
  }

  @override
  Widget build(BuildContext context) {
    app?.getFavoritos();

    return Stack(
      children: [
        IconButton(
          iconSize: 28,
          onPressed: () async {},
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 1,
            top: 1,
          ),
          child: Semantics(
            label: favorito == 1 ? ("Remover ${widget.evento.nome} dos favoritos") : "Adicionar ${widget.evento.nome} aos favoritos",
            child: IconButton(
              iconSize: 26,
              onPressed: () async {
                if (!app!.isLog()) {
                  return widgetConfirma(
                    context: context,
                    cancelar: true,
                    descricao: 'Para favoritar é preciso estar logado '
                        'no aplicativo. Gostaria de ir para a página de login?',
                    funcaoSim: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const pageLogin(),
                        ),
                      );
                    },
                  );
                }
                var isFavorited =
                await EventoController().favoritosPost(
                  userguidid: app?.GetGuidId() ?? "",
                  token: app?.GetToken() ?? "",
                  idevento: widget.evento.id ?? 0,
                  ativo: favorito,
                );
                if (isFavorited) {
                  setState(() {
                    favorito == 0 ? favorito = 1 : favorito = 0;
                  });
                }
              },
              icon: favorito == 1
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
