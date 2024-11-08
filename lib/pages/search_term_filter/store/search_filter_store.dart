import 'package:agendacultural/model/evento_model.dart';

import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';

part 'search_filter_store.g.dart';

class SearchFilterStore = SearchFilterStoreBase with _$SearchFilterStore;

abstract class SearchFilterStoreBase with Store {
  @observable
  TextEditingController searchController = TextEditingController();

  @observable
  List<Evento> eventsFilter = [];

  @action
  void setEventsFilter(List<Evento> value) => eventsFilter = value;

  @action
  void dispose() {
    searchController.clear();
    eventsFilter.clear();
  }
}
