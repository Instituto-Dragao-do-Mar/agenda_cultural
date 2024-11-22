import 'package:mobx/mobx.dart';

part 'send_email_store.g.dart';

class SendEmailStore = SendEmailStoreBase with _$SendEmailStore;

abstract class SendEmailStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void dispose() {
    setIsLoading(false);
    setEmail('');
  }
}
