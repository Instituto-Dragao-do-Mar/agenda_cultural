// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchFilterStore on SearchFilterStoreBase, Store {
  late final _$searchControllerAtom =
      Atom(name: 'SearchFilterStoreBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$eventsFilterAtom =
      Atom(name: 'SearchFilterStoreBase.eventsFilter', context: context);

  @override
  List<Event> get eventsFilter {
    _$eventsFilterAtom.reportRead();
    return super.eventsFilter;
  }

  @override
  set eventsFilter(List<Event> value) {
    _$eventsFilterAtom.reportWrite(value, super.eventsFilter, () {
      super.eventsFilter = value;
    });
  }

  late final _$SearchFilterStoreBaseActionController =
      ActionController(name: 'SearchFilterStoreBase', context: context);

  @override
  void setEventsFilter(List<Event> value) {
    final _$actionInfo = _$SearchFilterStoreBaseActionController.startAction(
        name: 'SearchFilterStoreBase.setEventsFilter');
    try {
      return super.setEventsFilter(value);
    } finally {
      _$SearchFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$SearchFilterStoreBaseActionController.startAction(
        name: 'SearchFilterStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$SearchFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchController: ${searchController},
eventsFilter: ${eventsFilter}
    ''';
  }
}
