import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/filter_date.dart';

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
  bool allCategories = false;

  @action
  void setAllCategories(bool value) => allCategories = value;

  @observable
  Category? selectedCategory;

  @action
  void setSelectedCategory(Category value) => selectedCategory = value;

  //Events

  @observable
  FilterDate filterDate = FilterDate.thisWeek;

  @action
  void setFilterDate(FilterDate value) => filterDate = value;

  @observable
  List<Event> eventsDateFiltered = [];

  @action
  void setEventsDateFiltered(List<Event> value) => eventsDateFiltered = value;

  @observable
  List<Event> eventsProminenceFiltered = [];

  @action
  void setEventsProminenceFiltered(List<Event> value) => eventsProminenceFiltered = value;

  @observable
  bool allEventsProminence = false;

  @action
  void setAllEventsProminence(bool value) => allEventsProminence = value;

  //Spaces

  @observable
  ScrollController scrollControllerSpaces = ScrollController();

  @observable
  List<Space> spacesFiltered = [];

  @action
  void setSpacesFiltered(List<Space> value) => spacesFiltered = value;

  @observable
  bool allSpaces = false;

  @action
  void setAllSpaces(bool value) => allSpaces = value;

  //Favorites

  @action
  void dispose() {}
}
