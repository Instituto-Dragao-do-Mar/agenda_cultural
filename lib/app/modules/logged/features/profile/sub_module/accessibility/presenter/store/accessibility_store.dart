import 'package:mobx/mobx.dart';

part 'accessibility_store.g.dart';

class AccessibilityStore = AccessibilityStoreBase with _$AccessibilityStore;

abstract class AccessibilityStoreBase with Store {
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
