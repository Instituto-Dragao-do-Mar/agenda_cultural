import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/categoria_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  //Categories

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  List<Categoria> categories = [];

  @action
  void setCategories(List<Categoria> value) => categories = value;

  @observable
  bool allCategories = false;

  @action
  void setAllCategories(bool value) => allCategories = value;

  @observable
  Categoria? selectedCategory;

  @action
  void setSelectedCategory(Categoria value) => selectedCategory = value;

  //Events

  @observable
  List<Evento> events = [];

  @action
  void setEvents(List<Evento> value) => events = value;

  @observable
  List<Espaco> spaces = [];

  @action
  void setSpaces(List<Espaco> value) => spaces = value;

  @action
  void dispose() {}
}
