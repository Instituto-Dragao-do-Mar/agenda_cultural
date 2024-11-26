import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

part 'filters_store.g.dart';

class FiltersStore = FiltersStoreBase with _$FiltersStore;

abstract class FiltersStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ScrollController scrollController = ScrollController();

  //Spaces

  @observable
  List<String> optionsSpaces = [];

  @action
  void setOptionsSpaces(List<String> value) => optionsSpaces = value;

  //Periode

  @observable
  GroupButtonController controllerGroupPeriode = GroupButtonController();

  //Categories

  @observable
  GroupButtonController controllerGroupCategory = GroupButtonController();

  @observable
  bool isExpandedCategory = false;

  @action
  void setIsExpandedCategory(bool value) => isExpandedCategory = value;

  @observable
  List<String> optionsCategories = [];

  @action
  void setOptionsCategories(List<String> value) => optionsCategories = value;

  //Classification

  @observable
  GroupButtonController controllerGroupClassification = GroupButtonController();

  @observable
  List<String> optionsClassification = [];

  @action
  void setOptionsClassification(List<String> value) => optionsClassification = value;

  //Accessibility

  @observable
  GroupButtonController controllerGroupAccessibility = GroupButtonController();

  @observable
  bool isExpandedAccessibility = false;

  @action
  void setIsExpandedAccessibility(bool value) => isExpandedAccessibility = value;

  @observable
  List<String> optionsAccessibility = [];

  @action
  void setOptionsAccessibility(List<String> value) => optionsAccessibility = value;

  //Ticket

  @observable
  GroupButtonController controllerGroupTicket = GroupButtonController();

  @action
  void dispose() {
    setOptionsSpaces([]);
    controllerGroupPeriode.unselectAll();
    controllerGroupCategory.unselectAll();
    setIsExpandedCategory(false);
    setOptionsCategories([]);
    controllerGroupClassification.unselectAll();
    setOptionsClassification([]);
    controllerGroupAccessibility.unselectAll();
    setIsExpandedAccessibility(false);
    setOptionsAccessibility([]);
    controllerGroupTicket.unselectAll();
  }
}
