// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$scrollControllerGeneralAtom =
      Atom(name: 'HomeStoreBase.scrollControllerGeneral', context: context);

  @override
  ScrollController get scrollControllerGeneral {
    _$scrollControllerGeneralAtom.reportRead();
    return super.scrollControllerGeneral;
  }

  @override
  set scrollControllerGeneral(ScrollController value) {
    _$scrollControllerGeneralAtom
        .reportWrite(value, super.scrollControllerGeneral, () {
      super.scrollControllerGeneral = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$scrollControllerCategoriesAtom =
      Atom(name: 'HomeStoreBase.scrollControllerCategories', context: context);

  @override
  ScrollController get scrollControllerCategories {
    _$scrollControllerCategoriesAtom.reportRead();
    return super.scrollControllerCategories;
  }

  @override
  set scrollControllerCategories(ScrollController value) {
    _$scrollControllerCategoriesAtom
        .reportWrite(value, super.scrollControllerCategories, () {
      super.scrollControllerCategories = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: 'HomeStoreBase.categories', context: context);

  @override
  List<Categoria> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Categoria> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$allCategoriesAtom =
      Atom(name: 'HomeStoreBase.allCategories', context: context);

  @override
  bool get allCategories {
    _$allCategoriesAtom.reportRead();
    return super.allCategories;
  }

  @override
  set allCategories(bool value) {
    _$allCategoriesAtom.reportWrite(value, super.allCategories, () {
      super.allCategories = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: 'HomeStoreBase.selectedCategory', context: context);

  @override
  Categoria? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Categoria? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$eventsAtom =
      Atom(name: 'HomeStoreBase.events', context: context);

  @override
  List<Evento> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Evento> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$filterDateAtom =
      Atom(name: 'HomeStoreBase.filterDate', context: context);

  @override
  FilterDate get filterDate {
    _$filterDateAtom.reportRead();
    return super.filterDate;
  }

  @override
  set filterDate(FilterDate value) {
    _$filterDateAtom.reportWrite(value, super.filterDate, () {
      super.filterDate = value;
    });
  }

  late final _$eventsDateFilteredAtom =
      Atom(name: 'HomeStoreBase.eventsDateFiltered', context: context);

  @override
  List<Evento> get eventsDateFiltered {
    _$eventsDateFilteredAtom.reportRead();
    return super.eventsDateFiltered;
  }

  @override
  set eventsDateFiltered(List<Evento> value) {
    _$eventsDateFilteredAtom.reportWrite(value, super.eventsDateFiltered, () {
      super.eventsDateFiltered = value;
    });
  }

  late final _$eventsProminenceFilteredAtom =
      Atom(name: 'HomeStoreBase.eventsProminenceFiltered', context: context);

  @override
  List<Evento> get eventsProminenceFiltered {
    _$eventsProminenceFilteredAtom.reportRead();
    return super.eventsProminenceFiltered;
  }

  @override
  set eventsProminenceFiltered(List<Evento> value) {
    _$eventsProminenceFilteredAtom
        .reportWrite(value, super.eventsProminenceFiltered, () {
      super.eventsProminenceFiltered = value;
    });
  }

  late final _$allEventsProminenceAtom =
      Atom(name: 'HomeStoreBase.allEventsProminence', context: context);

  @override
  bool get allEventsProminence {
    _$allEventsProminenceAtom.reportRead();
    return super.allEventsProminence;
  }

  @override
  set allEventsProminence(bool value) {
    _$allEventsProminenceAtom.reportWrite(value, super.allEventsProminence, () {
      super.allEventsProminence = value;
    });
  }

  late final _$scrollControllerSpacesAtom =
      Atom(name: 'HomeStoreBase.scrollControllerSpaces', context: context);

  @override
  ScrollController get scrollControllerSpaces {
    _$scrollControllerSpacesAtom.reportRead();
    return super.scrollControllerSpaces;
  }

  @override
  set scrollControllerSpaces(ScrollController value) {
    _$scrollControllerSpacesAtom
        .reportWrite(value, super.scrollControllerSpaces, () {
      super.scrollControllerSpaces = value;
    });
  }

  late final _$spacesAtom =
      Atom(name: 'HomeStoreBase.spaces', context: context);

  @override
  List<Espaco> get spaces {
    _$spacesAtom.reportRead();
    return super.spaces;
  }

  @override
  set spaces(List<Espaco> value) {
    _$spacesAtom.reportWrite(value, super.spaces, () {
      super.spaces = value;
    });
  }

  late final _$spacesFilteredAtom =
      Atom(name: 'HomeStoreBase.spacesFiltered', context: context);

  @override
  List<Espaco> get spacesFiltered {
    _$spacesFilteredAtom.reportRead();
    return super.spacesFiltered;
  }

  @override
  set spacesFiltered(List<Espaco> value) {
    _$spacesFilteredAtom.reportWrite(value, super.spacesFiltered, () {
      super.spacesFiltered = value;
    });
  }

  late final _$allSpacesAtom =
      Atom(name: 'HomeStoreBase.allSpaces', context: context);

  @override
  bool get allSpaces {
    _$allSpacesAtom.reportRead();
    return super.allSpaces;
  }

  @override
  set allSpaces(bool value) {
    _$allSpacesAtom.reportWrite(value, super.allSpaces, () {
      super.allSpaces = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'HomeStoreBase.favorites', context: context);

  @override
  List<Favorito> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Favorito> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<Categoria> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCategories');
    try {
      return super.setCategories(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllCategories(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setAllCategories');
    try {
      return super.setAllCategories(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(Categoria value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEvents(List<Evento> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setEvents');
    try {
      return super.setEvents(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterDate(FilterDate value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilterDate');
    try {
      return super.setFilterDate(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventsDateFiltered(List<Evento> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setEventsDateFiltered');
    try {
      return super.setEventsDateFiltered(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventsProminenceFiltered(List<Evento> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setEventsProminenceFiltered');
    try {
      return super.setEventsProminenceFiltered(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllEventsProminence(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setAllEventsProminence');
    try {
      return super.setAllEventsProminence(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpaces(List<Espaco> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSpaces');
    try {
      return super.setSpaces(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpacesFiltered(List<Espaco> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSpacesFiltered');
    try {
      return super.setSpacesFiltered(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllSpaces(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setAllSpaces');
    try {
      return super.setAllSpaces(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites(List<Favorito> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFavorites');
    try {
      return super.setFavorites(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scrollControllerGeneral: ${scrollControllerGeneral},
isLoading: ${isLoading},
scrollControllerCategories: ${scrollControllerCategories},
categories: ${categories},
allCategories: ${allCategories},
selectedCategory: ${selectedCategory},
events: ${events},
filterDate: ${filterDate},
eventsDateFiltered: ${eventsDateFiltered},
eventsProminenceFiltered: ${eventsProminenceFiltered},
allEventsProminence: ${allEventsProminence},
scrollControllerSpaces: ${scrollControllerSpaces},
spaces: ${spaces},
spacesFiltered: ${spacesFiltered},
allSpaces: ${allSpaces},
favorites: ${favorites}
    ''';
  }
}
