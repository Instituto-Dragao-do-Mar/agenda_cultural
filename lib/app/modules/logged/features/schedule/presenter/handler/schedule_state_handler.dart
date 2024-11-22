import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/store/schedule_store.dart';

class SchedulePageStateHandler {
  final AppStore _appStore;

  SchedulePageStateHandler(this._appStore);

  final ScheduleStore _store = Modular.get();

  ScheduleStore get store => _store;

  AppStore get appStore => _appStore;

  void initialize(BuildContext context) async {
    _store.setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1));

    _store.setTextInitialController(DateTime.now().toIso8601String());
    _store.setTextFinalController(DateTime.now().add(const Duration(days: 30)).toIso8601String());
    _updateListDatesAndEvents();

    _store.setIsLoading(false);
  }

  void onTapSelectDate(TextEditingController controller, BuildContext context) async {
    final value = await _onTapInsertDate(controller, context);
    if (value != null) {
      if (controller == _store.initialController) {
        _store.setTextInitialController(value.toIso8601String());

        // Verifica se a data inicial é maior que a data final e ajusta se necessário
        if (DateTime.parse(_store.initialController.text).isAfter(DateTime.parse(_store.finalController.text))) {
          _store.setTextFinalController(value.toIso8601String());
        }
      } else {
        _store.setTextFinalController(value.toIso8601String());

        // Verifica se a data final é menor que a data inicial e ajusta se necessário
        if (DateTime.parse(_store.finalController.text).isBefore(DateTime.parse(_store.initialController.text))) {
          _store.setTextInitialController(value.toIso8601String());
        }
      }

      // Atualiza a lista de eventos e datas
      _updateListDatesAndEvents();
    }
  }

  void onTapFilterDate(DateTime dateTime) async {
    if (dateTime == _store.dateSelected) {
      // Desmarca a data e volta para os eventos no intervalo de datas
      _store.setDateSelected(DateTime.now().subtract(const Duration(days: 1)));
      _updateListDatesAndEvents();
    } else {
      // Seleciona a data específica e mostra eventos somente para aquele dia
      _store.setDateSelected(dateTime);

      final filteredEvents = _appStore.events.where((event) {
        return (event.eventosdatas ?? []).any((eventDate) {
          final date = DateTime.parse(eventDate.datahora!.substring(0, 10));
          return date.compareTo(dateTime) == 0;
        });
      }).toList();

      // Atualiza a lista filtrada no store
      _store.setEventsFilter(filteredEvents);
    }
  }

  void _updateListDatesAndEvents() {
    // Parse as datas de início e fim do intervalo selecionado
    final DateTime startDate = DateTime.parse(_store.initialController.text.substring(0, 10));
    final DateTime endDate = DateTime.parse(_store.finalController.text.substring(0, 10));

    // Atualiza a lista de datas no intervalo selecionado
    _store.setListDatesFilter(_calculateDaysInterval(startDate, endDate));

    // Filtra eventos para mostrar apenas os que estão dentro do intervalo de datas selecionado
    final filteredEvents = _appStore.events.where((event) {
      return (event.eventosdatas ?? []).any((eventDate) {
        final date = DateTime.parse(eventDate.datahora!.substring(0, 10));
        return date.isAfter(startDate.subtract(const Duration(days: 1))) &&
            date.isBefore(endDate.add(const Duration(days: 1)));
      });
    }).toList();

    // Atualiza a lista filtrada no store
    _store.setEventsFilter(filteredEvents);
  }

  List<DateTime> _calculateDaysInterval(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  Future<DateTime?> _onTapInsertDate(TextEditingController controller, BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controller.text) ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 180)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: corBackgroundLaranja,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );

    return pickedDate;
  }

  void dispose() => _store.dispose();
}
