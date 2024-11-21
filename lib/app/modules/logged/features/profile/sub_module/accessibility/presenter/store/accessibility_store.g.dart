// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessibility_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccessibilityStore on AccessibilityStoreBase, Store {
  late final _$statusAltoContrasteAtom = Atom(
      name: 'AccessibilityStoreBase.statusAltoContraste', context: context);

  @override
  bool get statusAltoContraste {
    _$statusAltoContrasteAtom.reportRead();
    return super.statusAltoContraste;
  }

  @override
  set statusAltoContraste(bool value) {
    _$statusAltoContrasteAtom.reportWrite(value, super.statusAltoContraste, () {
      super.statusAltoContraste = value;
    });
  }

  late final _$fontSizeAtom =
      Atom(name: 'AccessibilityStoreBase.fontSize', context: context);

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$AccessibilityStoreBaseActionController =
      ActionController(name: 'AccessibilityStoreBase', context: context);

  @override
  void setStatusAltoContraste(bool value) {
    final _$actionInfo = _$AccessibilityStoreBaseActionController.startAction(
        name: 'AccessibilityStoreBase.setStatusAltoContraste');
    try {
      return super.setStatusAltoContraste(value);
    } finally {
      _$AccessibilityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontSize(double value) {
    final _$actionInfo = _$AccessibilityStoreBaseActionController.startAction(
        name: 'AccessibilityStoreBase.setFontSize');
    try {
      return super.setFontSize(value);
    } finally {
      _$AccessibilityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$AccessibilityStoreBaseActionController.startAction(
        name: 'AccessibilityStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$AccessibilityStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusAltoContraste: ${statusAltoContraste},
fontSize: ${fontSize}
    ''';
  }
}
