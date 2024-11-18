import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/app/modules/introduction/domain/entities/languages_model.dart';

part 'introduction_store.g.dart';

class IntroductionStore = IntroductionStoreBase with _$IntroductionStore;

abstract class IntroductionStoreBase with Store {
  @observable
  PageController controllerPage = PageController();

  @action
  void setController(PageController value) => controllerPage = value;

  @observable
  int currentStep = 1;

  @action
  void setCurrentStep(int value) => currentStep = value;

  @observable
  Language languageSelecionada = Language.languageList().first;

  @action
  void setLanguageSelecionada(Language value) => languageSelecionada = value;

  @observable
  bool statusAltoContraste = false;

  @action
  void setStatusAltoContraste(bool value) => statusAltoContraste = value;

  @observable
  double fontSize = 16;

  @action
  void setFontSize(double value) => fontSize = value;

  @action
  void dispose() {}
}
