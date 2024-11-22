import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/app/modules/logged/features/favorites/presenter/handler/favorite_state_handler.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/detail/event_detail.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoritePageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
    _handler.initialize(context);
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_handler.store.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              children: _handler.store.eventsFavorite.map((event) {
                var eventsDate = event.eventosdatas!.first;
                Space spaceReal = _handler.appStore.spaces.firstWhere((element) => element.id == eventsDate.idespaco);
                Space spacePrincipal;
                if (spaceReal.idespacoprincipal == 0) {
                  spacePrincipal = spaceReal;
                } else {
                  spacePrincipal = _handler.appStore.spaces.firstWhere((element) {
                    return element.id == spaceReal.idespacoprincipal;
                  });
                }

                return ItemEventWidget(
                  event: event,
                  spacePrincipal: spacePrincipal,
                  user: _handler.appStore.userLogged,
                  favorites: _handler.appStore.favorites,
                  onTapEvent: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventDetail(
                        event: event,
                        spaceReal: spaceReal,
                        spacePrincipal: spacePrincipal,
                        categories: _handler.appStore.categories,
                        favorites: _handler.appStore.favorites,
                        user: _handler.appStore.userLogged,
                      ),
                    ),
                  ),
                  onConcludeFavorite: _handler.uploadDataFavorites,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
