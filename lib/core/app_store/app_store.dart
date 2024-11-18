import 'package:mobx/mobx.dart';
import 'package:agendacultural/model/usuario_model.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  //login

  @observable
  Usuario userLogged = Usuario();

  @action
  void setUser(Usuario value) => userLogged = value;

  @action
  void setSignatureUser(String value) => userLogged.signature = value;
}