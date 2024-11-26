import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:mobx/mobx.dart';

part 'filters_store.g.dart';

class FiltersStore = FiltersStoreBase with _$FiltersStore;

abstract class FiltersStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ScrollController scrollController = ScrollController();

  //Periode

  @observable
  GroupButtonController controllerGroupPeriode = GroupButtonController();

  @observable
  String optionSelectedPeriode = '';

  @action
  void setOptionSelectedPeriode(String value) => optionSelectedPeriode = value;

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

  @observable
  String optionSelectedCategory = '';

  @action
  void setOptionSelectedCategory(String value) => optionSelectedCategory = value;

  //Classification

  @observable
  GroupButtonController controllerGroupClassification = GroupButtonController();

  @observable
  List<String> optionsClassification = [];

  @action
  void setOptionsClassification(List<String> value) => optionsClassification = value;

  @observable
  String optionSelectedClassification = '';

  @action
  void setOptionSelectedClassification(String value) => optionSelectedClassification = value;

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

  @observable
  String optionSelectedAccessibility = '';

  @action
  void setOptionSelectedAccessibility(String value) => optionSelectedAccessibility = value;

  //Ticket

  @observable
  GroupButtonController controllerGroupTicket = GroupButtonController();

  @observable
  String optionSelectedTicket = '';

  @action
  void setOptionSelectedTicket(String value) => optionSelectedTicket = value;

  @action
  void dispose() {}
}
