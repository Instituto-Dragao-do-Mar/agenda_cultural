import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';

import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/modules/logged/features/home/domain/enum/filter_date.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  @observable
  ScrollController scrollControllerGeneral = ScrollController();

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  //Categories

  @observable
  ScrollController scrollControllerCategories = ScrollController();

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
  FilterDate filterDate = FilterDate.thisWeek;

  @action
  void setFilterDate(FilterDate value) => filterDate = value;

  @observable
  List<Evento> eventsDateFiltered = [];

  @action
  void setEventsDateFiltered(List<Evento> value) => eventsDateFiltered = value;

  @observable
  List<Evento> eventsProminenceFiltered = [];

  @action
  void setEventsProminenceFiltered(List<Evento> value) => eventsProminenceFiltered = value;

  @observable
  bool allEventsProminence = false;

  @action
  void setAllEventsProminence(bool value) => allEventsProminence = value;

  //Spaces

  @observable
  ScrollController scrollControllerSpaces = ScrollController();

  @observable
  List<Espaco> spaces = [];

  @action
  void setSpaces(List<Espaco> value) => spaces = value;

  @observable
  List<Espaco> spacesFiltered = [];

  @action
  void setSpacesFiltered(List<Espaco> value) => spacesFiltered = value;

  @observable
  bool allSpaces = false;

  @action
  void setAllSpaces(bool value) => allSpaces = value;

  @action
  void dispose() {}
}
