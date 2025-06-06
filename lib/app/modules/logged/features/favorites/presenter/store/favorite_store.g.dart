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

  late final _$eventsFavoriteAtom =
      Atom(name: 'FavoriteStoreBase.eventsFavorite', context: context);

  @override
  List<Event> get eventsFavorite {
    _$eventsFavoriteAtom.reportRead();
    return super.eventsFavorite;
  }

  @override
  set eventsFavorite(List<Event> value) {
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
  void setListEventsFavorite(List<Event> value) {
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
eventsFavorite: ${eventsFavorite}
    ''';
  }
}
