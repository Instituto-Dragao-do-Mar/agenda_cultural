// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecoverStore on RecoverStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'RecoverStoreBase.isLoading', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'RecoverStoreBase.password', context: context);

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

  late final _$isPasswordVisibleAtom =
      Atom(name: 'RecoverStoreBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'RecoverStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$isConfirmPasswordVisibleAtom =
      Atom(name: 'RecoverStoreBase.isConfirmPasswordVisible', context: context);

  @override
  bool get isConfirmPasswordVisible {
    _$isConfirmPasswordVisibleAtom.reportRead();
    return super.isConfirmPasswordVisible;
  }

  @override
  set isConfirmPasswordVisible(bool value) {
    _$isConfirmPasswordVisibleAtom
        .reportWrite(value, super.isConfirmPasswordVisible, () {
      super.isConfirmPasswordVisible = value;
    });
  }

  late final _$haveUpperCaseAtom =
      Atom(name: 'RecoverStoreBase.haveUpperCase', context: context);

  @override
  int get haveUpperCase {
    _$haveUpperCaseAtom.reportRead();
    return super.haveUpperCase;
  }

  @override
  set haveUpperCase(int value) {
    _$haveUpperCaseAtom.reportWrite(value, super.haveUpperCase, () {
      super.haveUpperCase = value;
    });
  }

  late final _$haveLowerCaseAtom =
      Atom(name: 'RecoverStoreBase.haveLowerCase', context: context);

  @override
  int get haveLowerCase {
    _$haveLowerCaseAtom.reportRead();
    return super.haveLowerCase;
  }

  @override
  set haveLowerCase(int value) {
    _$haveLowerCaseAtom.reportWrite(value, super.haveLowerCase, () {
      super.haveLowerCase = value;
    });
  }

  late final _$haveNumberAtom =
      Atom(name: 'RecoverStoreBase.haveNumber', context: context);

  @override
  int get haveNumber {
    _$haveNumberAtom.reportRead();
    return super.haveNumber;
  }

  @override
  set haveNumber(int value) {
    _$haveNumberAtom.reportWrite(value, super.haveNumber, () {
      super.haveNumber = value;
    });
  }

  late final _$haveMinDigitsAtom =
      Atom(name: 'RecoverStoreBase.haveMinDigits', context: context);

  @override
  int get haveMinDigits {
    _$haveMinDigitsAtom.reportRead();
    return super.haveMinDigits;
  }

  @override
  set haveMinDigits(int value) {
    _$haveMinDigitsAtom.reportWrite(value, super.haveMinDigits, () {
      super.haveMinDigits = value;
    });
  }

  late final _$rulesMatchAtom =
      Atom(name: 'RecoverStoreBase.rulesMatch', context: context);

  @override
  int get rulesMatch {
    _$rulesMatchAtom.reportRead();
    return super.rulesMatch;
  }

  @override
  set rulesMatch(int value) {
    _$rulesMatchAtom.reportWrite(value, super.rulesMatch, () {
      super.rulesMatch = value;
    });
  }

  late final _$RecoverStoreBaseActionController =
      ActionController(name: 'RecoverStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsPasswordVisible() {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setIsPasswordVisible');
    try {
      return super.setIsPasswordVisible();
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsConfirmPasswordVisible() {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setIsConfirmPasswordVisible');
    try {
      return super.setIsConfirmPasswordVisible();
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveUpperCase(int value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setHaveUpperCase');
    try {
      return super.setHaveUpperCase(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveLowerCase(int value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setHaveLowerCase');
    try {
      return super.setHaveLowerCase(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveNumber(int value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setHaveNumber');
    try {
      return super.setHaveNumber(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveMinDigits(int value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setHaveMinDigits');
    try {
      return super.setHaveMinDigits(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRulesMatch(int value) {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.setRulesMatch');
    try {
      return super.setRulesMatch(value);
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$RecoverStoreBaseActionController.startAction(
        name: 'RecoverStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$RecoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
password: ${password},
isPasswordVisible: ${isPasswordVisible},
confirmPassword: ${confirmPassword},
isConfirmPasswordVisible: ${isConfirmPasswordVisible},
haveUpperCase: ${haveUpperCase},
haveLowerCase: ${haveLowerCase},
haveNumber: ${haveNumber},
haveMinDigits: ${haveMinDigits},
rulesMatch: ${rulesMatch}
    ''';
  }
}
