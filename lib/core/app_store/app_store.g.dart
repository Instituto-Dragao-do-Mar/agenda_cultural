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
  Usuario get userLogged {
    _$userLoggedAtom.reportRead();
    return super.userLogged;
  }

  @override
  set userLogged(Usuario value) {
    _$userLoggedAtom.reportWrite(value, super.userLogged, () {
      super.userLogged = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'AppStoreBase.categories', context: context);

  @override
  List<Categoria> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Categoria> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$eventsAtom = Atom(name: 'AppStoreBase.events', context: context);

  @override
  List<Evento> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Evento> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$spacesAtom = Atom(name: 'AppStoreBase.spaces', context: context);

  @override
  List<Espaco> get spaces {
    _$spacesAtom.reportRead();
    return super.spaces;
  }

  @override
  set spaces(List<Espaco> value) {
    _$spacesAtom.reportWrite(value, super.spaces, () {
      super.spaces = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'AppStoreBase.favorites', context: context);

  @override
  List<Favorito> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Favorito> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setUser(Usuario value) {
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
  void setCategories(List<Categoria> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setCategories');
    try {
      return super.setCategories(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEvents(List<Evento> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setEvents');
    try {
      return super.setEvents(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpaces(List<Espaco> value) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSpaces');
    try {
      return super.setSpaces(value);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites(List<Favorito> value) {
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
categories: ${categories},
events: ${events},
spaces: ${spaces},
favorites: ${favorites}
    ''';
  }
}
