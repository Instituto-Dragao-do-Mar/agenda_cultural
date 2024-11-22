// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on SigninStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SigninStoreBase.isLoading', context: context);

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

  late final _$emailAtom =
      Atom(name: 'SigninStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SigninStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: 'SigninStoreBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$SigninStoreBaseActionController =
      ActionController(name: 'SigninStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$SigninStoreBaseActionController.startAction(
        name: 'SigninStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SigninStoreBaseActionController.startAction(
        name: 'SigninStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SigninStoreBaseActionController.startAction(
        name: 'SigninStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureText(bool value) {
    final _$actionInfo = _$SigninStoreBaseActionController.startAction(
        name: 'SigninStoreBase.setObscureText');
    try {
      return super.setObscureText(value);
    } finally {
      _$SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SigninStoreBaseActionController.startAction(
        name: 'SigninStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SigninStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
email: ${email},
password: ${password},
obscureText: ${obscureText}
    ''';
  }
}
