import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';

part 'search_filter_store.g.dart';

class SearchFilterStore = SearchFilterStoreBase with _$SearchFilterStore;

abstract class SearchFilterStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  List<Event> eventsFilter = [];

  @action
  void setEventsFilter(List<Event> value) => eventsFilter = value;

  @action
  void dispose() {
    searchController.clear();
    eventsFilter.clear();
  }
}
