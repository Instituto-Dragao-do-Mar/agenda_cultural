// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on SplashStoreBase, Store {
  late final _$userAtom = Atom(name: 'SplashStoreBase.user', context: context);

  @override
  Usuario get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Usuario value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$SplashStoreBaseActionController =
      ActionController(name: 'SplashStoreBase', context: context);

  @override
  void setUser(Usuario value) {
    final _$actionInfo = _$SplashStoreBaseActionController.startAction(
        name: 'SplashStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$SplashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignatureUser(String value) {
    final _$actionInfo = _$SplashStoreBaseActionController.startAction(
        name: 'SplashStoreBase.setSignatureUser');
    try {
      return super.setSignatureUser(value);
    } finally {
      _$SplashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SplashStoreBaseActionController.startAction(
        name: 'SplashStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SplashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
