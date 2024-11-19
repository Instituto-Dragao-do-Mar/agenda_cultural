import 'package:mobx/mobx.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';

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
  List<Category> categories = [];

  @action
  void setCategories(List<Category> value) => categories = value;

  //Events

  @observable
  List<Event> events = [];

  @action
  void setEvents(List<Event> value) => events = value;

  //Spaces

  @observable
  List<Space> spaces = [];

  @action
  void setSpaces(List<Space> value) => spaces = value;

  //Favorites

  @observable
  List<Favorite> favorites = [];

  @action
  void setFavorites(List<Favorite> value) => favorites = value;
}