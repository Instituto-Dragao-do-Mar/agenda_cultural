// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendEmailStore on SendEmailStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SendEmailStoreBase.isLoading', context: context);

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
      Atom(name: 'SendEmailStoreBase.email', context: context);

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

  late final _$SendEmailStoreBaseActionController =
      ActionController(name: 'SendEmailStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$SendEmailStoreBaseActionController.startAction(
        name: 'SendEmailStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$SendEmailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SendEmailStoreBaseActionController.startAction(
        name: 'SendEmailStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SendEmailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SendEmailStoreBaseActionController.startAction(
        name: 'SendEmailStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SendEmailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
email: ${email}
    ''';
  }
}
