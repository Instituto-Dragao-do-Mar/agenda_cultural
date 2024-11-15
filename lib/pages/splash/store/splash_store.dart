import 'package:mobx/mobx.dart';

import 'package:agendacultural/model/usuario_model.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {
  @observable
  Usuario user = Usuario();

  @action
  void setUser(Usuario value) => user = value;

  @action
  void setSignatureUser(String value) => user.signature = value;

  @action
  void dispose() => setUser(Usuario());
}
