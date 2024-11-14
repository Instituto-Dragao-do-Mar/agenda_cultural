// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntroductionStore on IntroductionStoreBase, Store {
  late final _$controllerPageAtom =
      Atom(name: 'IntroductionStoreBase.controllerPage', context: context);

  @override
  PageController get controllerPage {
    _$controllerPageAtom.reportRead();
    return super.controllerPage;
  }

  @override
  set controllerPage(PageController value) {
    _$controllerPageAtom.reportWrite(value, super.controllerPage, () {
      super.controllerPage = value;
    });
  }

  late final _$currentStepAtom =
      Atom(name: 'IntroductionStoreBase.currentStep', context: context);

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  late final _$languageSelecionadaAtom =
      Atom(name: 'IntroductionStoreBase.languageSelecionada', context: context);

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

  late final _$statusAltoContrasteAtom =
      Atom(name: 'IntroductionStoreBase.statusAltoContraste', context: context);

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
      Atom(name: 'IntroductionStoreBase.fontSize', context: context);

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

  late final _$IntroductionStoreBaseActionController =
      ActionController(name: 'IntroductionStoreBase', context: context);

  @override
  void setController(PageController value) {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.setController');
    try {
      return super.setController(value);
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentStep(int value) {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.setCurrentStep');
    try {
      return super.setCurrentStep(value);
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLanguageSelecionada(Language value) {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.setLanguageSelecionada');
    try {
      return super.setLanguageSelecionada(value);
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusAltoContraste(bool value) {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.setStatusAltoContraste');
    try {
      return super.setStatusAltoContraste(value);
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontSize(double value) {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.setFontSize');
    try {
      return super.setFontSize(value);
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$IntroductionStoreBaseActionController.startAction(
        name: 'IntroductionStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$IntroductionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerPage: ${controllerPage},
currentStep: ${currentStep},
languageSelecionada: ${languageSelecionada},
statusAltoContraste: ${statusAltoContraste},
fontSize: ${fontSize}
    ''';
  }
}
