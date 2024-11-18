import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:mobx/mobx.dart';
import 'package:agendacultural/model/usuario_model.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  //Login

  @observable
  Usuario userLogged = Usuario();

  @action
  void setUser(Usuario value) => userLogged = value;

  @action
  void setSignatureUser(String value) => userLogged.signature = value;

  //Categories

  @observable
  List<Categoria> categories = [];

  @action
  void setCategories(List<Categoria> value) => categories = value;

  //Events

  @observable
  List<Evento> events = [];

  @action
  void setEvents(List<Evento> value) => events = value;

  //Spaces

  @observable
  List<Espaco> spaces = [];

  @action
  void setSpaces(List<Espaco> value) => spaces = value;

  //Favorites

  @observable
  List<Favorito> favorites = [];

  @action
  void setFavorites(List<Favorito> value) => favorites = value;
}