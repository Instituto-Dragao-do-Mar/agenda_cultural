// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteStore on FavoriteStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'FavoriteStoreBase.isLoading', context: context);

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

  late final _$favoritesAtom =
      Atom(name: 'FavoriteStoreBase.favorites', context: context);

  @override
  ListaFavoritos get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ListaFavoritos value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$eventsFavoriteAtom =
      Atom(name: 'FavoriteStoreBase.eventsFavorite', context: context);

  @override
  List<Evento> get eventsFavorite {
    _$eventsFavoriteAtom.reportRead();
    return super.eventsFavorite;
  }

  @override
  set eventsFavorite(List<Evento> value) {
    _$eventsFavoriteAtom.reportWrite(value, super.eventsFavorite, () {
      super.eventsFavorite = value;
    });
  }

  late final _$FavoriteStoreBaseActionController =
      ActionController(name: 'FavoriteStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$FavoriteStoreBaseActionController.startAction(
        name: 'FavoriteStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites(ListaFavoritos value) {
    final _$actionInfo = _$FavoriteStoreBaseActionController.startAction(
        name: 'FavoriteStoreBase.setFavorites');
    try {
      return super.setFavorites(value);
    } finally {
      _$FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListEventsFavorite(List<Evento> value) {
    final _$actionInfo = _$FavoriteStoreBaseActionController.startAction(
        name: 'FavoriteStoreBase.setListEventsFavorite');
    try {
      return super.setListEventsFavorite(value);
    } finally {
      _$FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$FavoriteStoreBaseActionController.startAction(
        name: 'FavoriteStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$FavoriteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favorites: ${favorites},
eventsFavorite: ${eventsFavorite}
    ''';
  }
}
