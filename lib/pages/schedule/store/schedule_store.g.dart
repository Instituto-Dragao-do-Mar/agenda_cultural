// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleStore on ScheduleStoreBase, Store {
  late final _$initialControllerAtom =
      Atom(name: 'ScheduleStoreBase.initialController', context: context);

  @override
  TextEditingController get initialController {
    _$initialControllerAtom.reportRead();
    return super.initialController;
  }

  @override
  set initialController(TextEditingController value) {
    _$initialControllerAtom.reportWrite(value, super.initialController, () {
      super.initialController = value;
    });
  }

  late final _$finalControllerAtom =
      Atom(name: 'ScheduleStoreBase.finalController', context: context);

  @override
  TextEditingController get finalController {
    _$finalControllerAtom.reportRead();
    return super.finalController;
  }

  @override
  set finalController(TextEditingController value) {
    _$finalControllerAtom.reportWrite(value, super.finalController, () {
      super.finalController = value;
    });
  }

  late final _$listDatesFilterAtom =
      Atom(name: 'ScheduleStoreBase.listDatesFilter', context: context);

  @override
  List<DateTime> get listDatesFilter {
    _$listDatesFilterAtom.reportRead();
    return super.listDatesFilter;
  }

  @override
  set listDatesFilter(List<DateTime> value) {
    _$listDatesFilterAtom.reportWrite(value, super.listDatesFilter, () {
      super.listDatesFilter = value;
    });
  }

  late final _$dateSelectedAtom =
      Atom(name: 'ScheduleStoreBase.dateSelected', context: context);

  @override
  DateTime get dateSelected {
    _$dateSelectedAtom.reportRead();
    return super.dateSelected;
  }

  @override
  set dateSelected(DateTime value) {
    _$dateSelectedAtom.reportWrite(value, super.dateSelected, () {
      super.dateSelected = value;
    });
  }

  late final _$eventsFilterAtom =
      Atom(name: 'ScheduleStoreBase.eventsFilter', context: context);

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

  late final _$ScheduleStoreBaseActionController =
      ActionController(name: 'ScheduleStoreBase', context: context);

  @override
  void setTextInitialController(String value) {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.setTextInitialController');
    try {
      return super.setTextInitialController(value);
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTextFinalController(String value) {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.setTextFinalController');
    try {
      return super.setTextFinalController(value);
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListDatesFilter(List<DateTime> value) {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.setListDatesFilter');
    try {
      return super.setListDatesFilter(value);
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateSelected(DateTime value) {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.setDateSelected');
    try {
      return super.setDateSelected(value);
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventsFilter(List<Event> value) {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.setEventsFilter');
    try {
      return super.setEventsFilter(value);
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$ScheduleStoreBaseActionController.startAction(
        name: 'ScheduleStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$ScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialController: ${initialController},
finalController: ${finalController},
listDatesFilter: ${listDatesFilter},
dateSelected: ${dateSelected},
eventsFilter: ${eventsFilter}
    ''';
  }
}
