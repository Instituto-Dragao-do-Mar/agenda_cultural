import 'package:mobx/mobx.dart';
import 'package:flutter/cupertino.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';

part 'schedule_store.g.dart';

class ScheduleStore = ScheduleStoreBase with _$ScheduleStore;

abstract class ScheduleStoreBase with Store {
  @observable
  TextEditingController initialController = TextEditingController();

  @action
  void setTextInitialController(String value) => initialController.text = value;

  @observable
  TextEditingController finalController = TextEditingController();

  @action
  void setTextFinalController(String value) => finalController.text = value;

  @observable
  List<DateTime> listDatesFilter = [];

  @action
  void setListDatesFilter(List<DateTime> value) => listDatesFilter = value;

  @observable
  DateTime dateSelected = DateTime.now();

  @action
  void setDateSelected(DateTime value) => dateSelected = value;

  @observable
  List<Event> eventsFilter = [];

  @action
  void setEventsFilter(List<Event> value) => eventsFilter = value;

  @action
  void dispose() {
    initialController.clear();
    finalController.clear();
    listDatesFilter.clear();
    eventsFilter.clear();
  }
}
