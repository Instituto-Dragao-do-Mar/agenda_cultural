import 'package:agendacultural/app/core/domain/controller/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/app_widget.dart';
import 'package:agendacultural/app/common/utils/orders.dart';
import 'package:agendacultural/app/common/router/router.dart';
import 'package:agendacultural/app/common/utils/theme/fonts.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/utils/theme/colors.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';
import 'package:agendacultural/app/modules/splash/presenter/store/splash_store.dart';
import 'package:agendacultural/app/core/data_preferences/user_shared_preferences.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/user_controller.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/space_controller.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/event_controller.dart';
import 'package:agendacultural/app/modules/logged/features/map/presenter/page/map_page.dart';
import 'package:agendacultural/app/modules/splash/domain/controller/category_controller.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/home_page.dart';
import 'package:agendacultural/app/modules/logged/features/profile/presenter/page/profile_page.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/page/schedule_page.dart';
import 'package:agendacultural/app/modules/logged/features/favorites/presenter/page/favorite_page.dart';

class SplashPageStateHandler {
  final AppStore _appStore;

  SplashPageStateHandler(this._appStore);

  final SplashStore _store = Modular.get();

  SplashStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize(bool mounted, BuildContext context) async {
    await _initDataApp();
    await _initContrastFont();
    if (!mounted) return;
    _verifyAuthenticated(mounted, context);

    // Define as telas da aplicação e a tela atual
    _appStore.setScreens(
      [
        const HomePage(),
        const SchedulePage(),
        const MapPage(),
        const FavoritePage(),
        const ProfilePage(),
      ],
    );
    _appStore.setCurrentScreen(_appStore.screens[0]);
    _appStore.setCurrentTab(0);
  }

  //Ajusta o tamanho da fonte e o contraste
  Future<void> _initContrastFont() async {
    int fonte = await Dados.getInt('tamanhofontebase');
    if (fonte == 0) {
      await Dados.setInt('tamanhofontebase', 16);
      fonte = 16;
    }
    FontsApp.setTamanhoBase(fonte);

    bool altoContraste = await Dados.getBool('altocontraste');
    ColorsApp.setAltoContraste(altoContraste);
    ColorsApp.reloadColors();
  }

  Future<void> _initDataApp() async {
    //Categories
    _appStore.setCategories(await CategoryController().getCategories());

    //Events
    _appStore.setEvents(await EventController().getEvents());
    await sortEvents(_appStore.events);

    //Spaces
    _appStore.setSpaces(await SpaceController().getSpaces());

    //Favorites
    _appStore.setFavorites(
      await EventController().getFavorites(
        userGuidId: _appStore.userLogged.guidid ?? '',
        token: _appStore.userLogged.signature ?? '',
      ),
    );
  }

  void _verifyAuthenticated(bool mounted, BuildContext context) async {
    UserController userController = UserController();
    LogController logController = LogController();
    var userPrefs = await UserSharedPreferences.getUserData();

    //Verifica se o usuário já está logado
    if (userPrefs != null) {
      _appStore.setUser(
        await userController.getUserByPrefData(
          token: userPrefs.signature ?? '',
          email: userPrefs.email ?? '',
        ),
      );
      _appStore.setSignatureUser(userPrefs.signature ?? '');

      await UserSharedPreferences.setUser(
        userguidid: _appStore.userLogged.guidid ?? '',
        usertoken: _appStore.userLogged.signature ?? '',
        email: _appStore.userLogged.email ?? '',
        nome: _appStore.userLogged.nome ?? '',
      );

      if (_appStore.userLogged.guidid != null && _appStore.userLogged.guidid?.isNotEmpty == true) {
        await logController.postLog(
          idLogTipo: 1,
          guidUsuario: _appStore.userLogged.guidid ?? '',
          observacao: 'Usuário ${_appStore.userLogged.nome} realizou login',
        );
      }
    } else {
      await logController.postLog(
        idLogTipo: 1,
        guidUsuario: '',
        observacao: 'Usuário não identificado realizou login como visitante',
      );
    }

    if (!mounted) return;
    _navigatorIntroduction(mounted, context);
  }

  void _navigatorIntroduction(bool mounted, BuildContext context) async {
    await _getCookies(mounted, context);

    //Verifica se o usuário já visualizou a introdução
    if (!Dados.jaVisualizouIntroducao) {
      Modular.to.navigate(RouterApp.introduction);
      return;
    }

    Modular.to.navigate(RouterApp.logged);
  }

  Future<void> _getCookies(bool mounted, BuildContext context) async {
    //Puxa os dados do SharedPreferences e verifica se o usuário já visualizou os cookies
    Dados.jaVisualizouCookies = await Dados.getBool('cookies');
    Dados.jaVisualizouGoverno = await Dados.getBool('governo');
    Dados.jaVisualizouIntroducao = await Dados.getBool('introducao');
    Dados.jaPermitiuLocalizacao = await Dados.getBool('localizacao');
    Dados.idiomaSalvo = await Dados.getString('idioma');
    if (Dados.jaVisualizouCookies) {
      if (!mounted) return;
      AppWidget.setLocale(context, Locale(Dados.idiomaSalvo, ''));
    }
  }

  void dispose() => _store.dispose();
}
