// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
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

  late final _$scrollControllerAtom =
      Atom(name: 'HomeStoreBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
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
isLoading: ${isLoading},
scrollController: ${scrollController},
categories: ${categories},
allCategories: ${allCategories},
selectedCategory: ${selectedCategory},
events: ${events},
spaces: ${spaces}
    ''';
  }
}
