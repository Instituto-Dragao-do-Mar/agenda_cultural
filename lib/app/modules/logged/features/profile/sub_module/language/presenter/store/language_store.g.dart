// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on LanguageStoreBase, Store {
  late final _$languageSelecionadaAtom =
      Atom(name: 'LanguageStoreBase.languageSelecionada', context: context);

  @override
  Language get languageSelecionada {
    _$languageSelecionadaAtom.reportRead();
    return super.languageSelecionada;
  }

  @override
  set languageSelecionada(Language value) {
    _$languageSelecionadaAtom.reportWrite(value, super.languageSelecionada, () {
      super.languageSelecionada = value;
    });
  }

  late final _$LanguageStoreBaseActionController =
      ActionController(name: 'LanguageStoreBase', context: context);

  @override
  void setLanguageSelecionada(Language value) {
    final _$actionInfo = _$LanguageStoreBaseActionController.startAction(
        name: 'LanguageStoreBase.setLanguageSelecionada');
    try {
      return super.setLanguageSelecionada(value);
    } finally {
      _$LanguageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$LanguageStoreBaseActionController.startAction(
        name: 'LanguageStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$LanguageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
languageSelecionada: ${languageSelecionada}
    ''';
  }
}
