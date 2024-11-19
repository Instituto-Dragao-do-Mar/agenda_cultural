import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/pages/perfil/widgetperfil.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/pages/favorite/page/favorite_page.dart';
import 'package:agendacultural/pages/schedule/page/schedule_page.dart';
import 'package:agendacultural/app/modules/logged/presenter/store/logged_area_store.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/page/map_page.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/home_page.dart';

class LoggedPageStateHandler {
  final AppStore _appStore;

  LoggedPageStateHandler(this._appStore);

  final LoggedAreaStore _store = Modular.get();

  LoggedAreaStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize() async {
    _store.setScreens(
      [
        const HomePage(),
        const SchedulePage(),
        const MapPage(),
        const FavoritePage(),
        const widgetPerfil(),
      ],
    );
    await setScreen(0);
  }

  Future<void> setScreen(int index) async {
    _store.setCurrentScreen(_store.screens[index]);
    _store.setCurrentTab(index);
  }

  void dispose() => _store.dispose();
}
