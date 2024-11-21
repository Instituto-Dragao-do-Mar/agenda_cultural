// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_area_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoggedAreaStore on LoggedAreaStoreBase, Store {
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
isLoading: ${isLoading}
    ''';
  }
}
