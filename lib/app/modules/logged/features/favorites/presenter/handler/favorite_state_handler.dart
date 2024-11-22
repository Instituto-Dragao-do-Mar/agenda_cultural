import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:agendacultural/shared/notify_pop_up.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';
import 'package:agendacultural/app/modules/logged/features/favorites/presenter/store/favorite_store.dart';

class FavoritePageStateHandler {
  final AppStore _appStore;

  FavoritePageStateHandler(this._appStore);

  final FavoriteStore _store = Modular.get();

  FavoriteStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize(BuildContext context) async {
    _store.setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    if (_appStore.userLogged.guidid == null) {
      Future.delayed(
        const Duration(seconds: 0),
        () async => notifyPopUpWidget(
          context: context,
          permitirFechar: true,
          textDescritivo: AppLocalizations.of(context)!.e_alert_favorite_page,
          textBotao: AppLocalizations.of(context)!.profile_general_alert_accept,
          funcaoBotao: () => Modular.to.navigate(RouterApp.auth),
        ),
      );
      _store.setIsLoading(false);
      return;
    } else {
      _appStore.setFavorites(
        await EventController().getFavorites(
          userGuidId: _appStore.userLogged.guidid ?? '',
          token: _appStore.userLogged.signature ?? '',
        ),
      );

      _store.setListEventsFavorite(
        _appStore.events.where((evento) {
          return _appStore.favorites.map((e) => e.idevento).contains(evento.id) == true;
        }).toList(),
      );
      _store.setIsLoading(false);
      return;
    }
  }

  void uploadDataFavorites() async {
    _store.setIsLoading(true);
    _appStore.setFavorites(
      await EventController().getFavorites(
        userGuidId: _appStore.userLogged.guidid ?? '',
        token: _appStore.userLogged.signature ?? '',
      ),
    );

    _store.setListEventsFavorite(
      _appStore.events.where((evento) {
        return _appStore.favorites.map((e) => e.idevento).contains(evento.id) == true;
      }).toList(),
    );
    _store.setIsLoading(false);
  }

  void dispose() => _store.dispose();
}
