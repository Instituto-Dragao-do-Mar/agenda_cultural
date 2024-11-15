// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_area_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoggedAreaStore on LoggedAreaStoreBase, Store {
  late final _$currentTabAtom =
      Atom(name: 'LoggedAreaStoreBase.currentTab', context: context);

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
      Atom(name: 'LoggedAreaStoreBase.currentScreen', context: context);

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
      Atom(name: 'LoggedAreaStoreBase.screens', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: 'LoggedAreaStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$LoggedAreaStoreBaseActionController =
      ActionController(name: 'LoggedAreaStoreBase', context: context);

  @override
  void setCurrentTab(int value) {
    final _$actionInfo = _$LoggedAreaStoreBaseActionController.startAction(
        name: 'LoggedAreaStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(value);
    } finally {
      _$LoggedAreaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentScreen(Widget value) {
    final _$actionInfo = _$LoggedAreaStoreBaseActionController.startAction(
        name: 'LoggedAreaStoreBase.setCurrentScreen');
    try {
      return super.setCurrentScreen(value);
    } finally {
      _$LoggedAreaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addScreen(Widget value) {
    final _$actionInfo = _$LoggedAreaStoreBaseActionController.startAction(
        name: 'LoggedAreaStoreBase.addScreen');
    try {
      return super.addScreen(value);
    } finally {
      _$LoggedAreaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$LoggedAreaStoreBaseActionController.startAction(
        name: 'LoggedAreaStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$LoggedAreaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$LoggedAreaStoreBaseActionController.startAction(
        name: 'LoggedAreaStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$LoggedAreaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab},
currentScreen: ${currentScreen},
screens: ${screens},
isLoading: ${isLoading}
    ''';
  }
}
