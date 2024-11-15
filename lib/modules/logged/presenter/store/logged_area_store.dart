import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import 'package:agendacultural/modules/logged/features/home/presenter/page/home_page.dart';

part 'logged_area_store.g.dart';

class LoggedAreaStore = LoggedAreaStoreBase with _$LoggedAreaStore;

abstract class LoggedAreaStoreBase with Store {
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
  void addScreen(Widget value) => screens.add(value);

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  void dispose() {}
}
