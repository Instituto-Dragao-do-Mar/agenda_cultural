import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/home_page.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  //Login

  @observable
  User userLogged = User();

  @action
  void setUser(User value) => userLogged = value;

  @action
  void setSignatureUser(String value) => userLogged.signature = value;

  //Logged Area

  @observable
  int currentTab = 0;

  @action
  void setCurrentTab(int value) => currentTab = value;

  @observable
  Widget currentScreen = const HomePage();

  @action
  void setCurrentScreen(Widget value) => currentScreen = value;

  @observable
  List<Widget> screens = [];

  @action
  void setScreens(List<Widget> value) => screens = value;

  //Categories

  @observable
  List<Category> categories = [];

  @action
  void setCategories(List<Category> value) => categories = value;

  //Events

  @observable
  List<Event> events = [];

  @action
  void setEvents(List<Event> value) => events = value;

  //Spaces

  @observable
  List<Space> spaces = [];

  @action
  void setSpaces(List<Space> value) => spaces = value;

  //Favorites

  @observable
  List<Favorite> favorites = [];

  @action
  void setFavorites(List<Favorite> value) => favorites = value;
}