// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on SignupStoreBase, Store {
  late final _$nameAtom = Atom(name: 'SignupStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignupStoreBase.email', context: context);

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
      Atom(name: 'SignupStoreBase.password', context: context);

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
      Atom(name: 'SignupStoreBase.isPasswordVisible', context: context);

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
      Atom(name: 'SignupStoreBase.confirmPassword', context: context);

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
      Atom(name: 'SignupStoreBase.isConfirmPasswordVisible', context: context);

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
      Atom(name: 'SignupStoreBase.haveUpperCase', context: context);

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
      Atom(name: 'SignupStoreBase.haveLowerCase', context: context);

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
      Atom(name: 'SignupStoreBase.haveNumber', context: context);

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
      Atom(name: 'SignupStoreBase.haveMinDigits', context: context);

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
      Atom(name: 'SignupStoreBase.rulesMatch', context: context);

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

  late final _$isCheckedAtom =
      Atom(name: 'SignupStoreBase.isChecked', context: context);

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  late final _$SignupStoreBaseActionController =
      ActionController(name: 'SignupStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsPasswordVisible() {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setIsPasswordVisible');
    try {
      return super.setIsPasswordVisible();
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsConfirmPasswordVisible() {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setIsConfirmPasswordVisible');
    try {
      return super.setIsConfirmPasswordVisible();
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveUpperCase(int value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setHaveUpperCase');
    try {
      return super.setHaveUpperCase(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveLowerCase(int value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setHaveLowerCase');
    try {
      return super.setHaveLowerCase(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveNumber(int value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setHaveNumber');
    try {
      return super.setHaveNumber(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHaveMinDigits(int value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setHaveMinDigits');
    try {
      return super.setHaveMinDigits(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRulesMatch(int value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setRulesMatch');
    try {
      return super.setRulesMatch(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsChecked(bool value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setIsChecked');
    try {
      return super.setIsChecked(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
isPasswordVisible: ${isPasswordVisible},
confirmPassword: ${confirmPassword},
isConfirmPasswordVisible: ${isConfirmPasswordVisible},
haveUpperCase: ${haveUpperCase},
haveLowerCase: ${haveLowerCase},
haveNumber: ${haveNumber},
haveMinDigits: ${haveMinDigits},
rulesMatch: ${rulesMatch},
isChecked: ${isChecked}
    ''';
  }
}
