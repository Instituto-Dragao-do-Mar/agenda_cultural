import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = SignupStoreBase with _$SignupStore;

abstract class SignupStoreBase with Store {
  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

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

  @observable
  bool isChecked = false;

  @action
  void setIsChecked(bool value) => isChecked = value;

  @action
  void dispose() {
    setName('');
    setEmail('');
    setPassword('');
    setConfirmPassword('');
    setHaveUpperCase(0);
    setHaveLowerCase(0);
    setHaveNumber(0);
    setHaveMinDigits(0);
    setRulesMatch(0);
    setIsChecked(false);
  }
}
