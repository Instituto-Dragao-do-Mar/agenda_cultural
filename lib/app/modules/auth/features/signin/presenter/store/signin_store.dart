import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

class SigninStore = SigninStoreBase with _$SigninStore;

abstract class SigninStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool obscureText = true;

  @action
  void setObscureText(bool value) => obscureText = value;

  @action
  void dispose() {
    setIsLoading(false);
    setEmail('');
    setPassword('');
    setObscureText(true);
  }
}
