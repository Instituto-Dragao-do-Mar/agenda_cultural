import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/pages/acesso/pagelogin.dart';
import 'package:agendacultural/pages/favorite/store/favorite_store.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late AppModel app;
  final favoriteStore = FavoriteStore();

  @override
  void initState() {
    super.initState();
    app = context.read<AppModel>();

    _initializeData();
  }

  void _initializeData() async {
    if (app.usuarioLogado?.guidid == null) {
      Future.delayed(
        const Duration(seconds: 0),
        () async {
          notifyPopUpWidget(
            context: context,
            permitirFechar: true,
            textDescritivo: AppLocalizations.of(context)!.e_alert_favorite_page,
            textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
            funcaoBotao: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const pageLogin(),
              ),
            ),
          );
        },
      );
      return;
    }
    favoriteStore.setIsLoading(true);
    // favoriteStore.setFavorites(
    // await EventoController().favoritosGet(
    //   userguidid: app.usuarioLogado?.guidid ?? '',
    //   token: app.usuarioLogado?.signature ?? '',
    // ),
    // );
    app.listaFavoritos = favoriteStore.favorites;
    favoriteStore.setListEventsFavorite(
      app.listaEventos.eventos?.where((evento) {
            return favoriteStore.favorites.favoritos?.map((e) => e.idevento).contains(evento.id) == true;
          }).toList() ??
          [],
    );
    favoriteStore.setIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (favoriteStore.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: favoriteStore.eventsFavorite
                    .map((evento) => ItemEventWidget(
                          evento: evento,
                          spacePrincipal: Espaco(),
                          onTapEvent: () {},
                        ))
                    .toList(),
              )
            ],
          ),
        );
      },
    );
  }
}
