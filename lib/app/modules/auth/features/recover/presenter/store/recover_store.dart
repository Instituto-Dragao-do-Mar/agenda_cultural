import 'package:mobx/mobx.dart';

part 'recover_store.g.dart';

class RecoverStore = RecoverStoreBase with _$RecoverStore;

abstract class RecoverStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool isPasswordVisible = false;

  @action
  void setIsPasswordVisible() => isPasswordVisible = !isPasswordVisible;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @observable
  bool isConfirmPasswordVisible = false;

  @action
  void setIsConfirmPasswordVisible() => isConfirmPasswordVisible = !isConfirmPasswordVisible;

  @observable
  int haveUpperCase = 0;

  @action
  void setHaveUpperCase(int value) => haveUpperCase = value;

  @observable
  int haveLowerCase = 0;

  @action
  void setHaveLowerCase(int value) => haveLowerCase = value;

  @observable
  int haveNumber = 0;

  @action
  void setHaveNumber(int value) => haveNumber = value;

  @observable
  int haveMinDigits = 0;

  @action
  void setHaveMinDigits(int value) => haveMinDigits = value;

  @observable
  int rulesMatch = 0;

  @action
  void setRulesMatch(int value) => rulesMatch = value;

  @action
  void dispose() {
    setIsLoading(false);
    setPassword('');
    setIsPasswordVisible();
    setConfirmPassword('');
    setIsConfirmPasswordVisible();
    setHaveUpperCase(0);
    setHaveLowerCase(0);
    setHaveNumber(0);
    setHaveMinDigits(0);
    setRulesMatch(0);
  }
}
