// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  late final _$userLoggedAtom =
      Atom(name: 'AppStoreBase.userLogged', context: context);

  @override
  User get userLogged {
    _$userLoggedAtom.reportRead();
    return super.userLogged;
  }

  @override
  set userLogged(User value) {
    _$userLoggedAtom.reportWrite(value, super.userLogged, () {
      super.userLogged = value;
    });
  }

  late final _$currentTabAtom =
      Atom(name: 'AppStoreBase.currentTab', context: context);

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  late final _$currentScreenAtom =
      Atom(name: 'AppStoreBase.currentScreen', context: context);

  @override
  Widget get currentScreen {
    _$currentScreenAtom.reportRead();
    return super.currentScreen;
  }

  @override
  set currentScreen(Widget value) {
    _$currentScreenAtom.reportWrite(value, super.currentScreen, () {
      super.currentScreen = value;
    });
  }

  late final _$screensAtom =
      Atom(name: 'AppStoreBase.screens', context: context);

  @override
  List<Widget> get screens {
    _$screensAtom.reportRead();
    return super.screens;
  }

  @override
  set screens(List<Widget> value) {
    _$screensAtom.reportWrite(value, super.screens, () {
      super.screens = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'AppStoreBase.categories', context: context);

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$eventsAtom = Atom(name: 'AppStoreBase.events', context: context);

  @override
  List<Event> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Event> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$spacesAtom = Atom(name: 'AppStoreBase.spaces', context: context);

  @override
  List<Space> get spaces {
    _$spacesAtom.reportRead();
    return super.spaces;
  }

  @override
  set spaces(List<Space> value) {
    _$spacesAtom.reportWrite(value, super.spaces, () {
      super.spaces = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'AppStoreBase.favorites', context: context);

  @override
  List<Favorite> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Favorite> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setUser(User value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignatureUser(String value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSignatureUser');
    try {
      return super.setSignatureUser(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentTab(int value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentScreen(Widget value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setCurrentScreen');
    try {
      return super.setCurrentScreen(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setScreens(List<Widget> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setScreens');
    try {
      return super.setScreens(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<Category> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setCategories');
    try {
      return super.setCategories(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEvents(List<Event> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setEvents');
    try {
      return super.setEvents(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpaces(List<Space> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSpaces');
    try {
      return super.setSpaces(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites(List<Favorite> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setFavorites');
    try {
      return super.setFavorites(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userLogged: ${userLogged},
currentTab: ${currentTab},
currentScreen: ${currentScreen},
screens: ${screens},
categories: ${categories},
events: ${events},
spaces: ${spaces},
favorites: ${favorites}
    ''';
  }
}
