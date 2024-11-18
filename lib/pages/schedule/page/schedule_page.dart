import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/item/item_event.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/pages/filtro/pagefiltrocompleto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:agendacultural/model/fontes.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/widgetTextFonteContraste.dart';
import 'package:agendacultural/pages/schedule/widgets/view_days.dart';
import 'package:agendacultural/pages/home/general/button_filter.dart';
import 'package:agendacultural/pages/schedule/widgets/choice_dates.dart';
import 'package:agendacultural/pages/schedule/store/schedule_store.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late AppModel app;
  final scheduleStore = ScheduleStore();

  @override
  void initState() {
    super.initState();
    app = Provider.of<AppModel>(context, listen: false);
    _initializeData();
  }

  @override
  void dispose() {
    scheduleStore.dispose();
    super.dispose();
  }

  void _initializeData() {
    scheduleStore.setTextInitialController(DateTime.now().toIso8601String());
    scheduleStore.setTextFinalController(DateTime.now().add(const Duration(days: 30)).toIso8601String());
    _updateListDatesAndEvents();
  }

  void _updateListDatesAndEvents() {
    // Atualiza a lista de datas no intervalo selecionado
    scheduleStore.setListDatesFilter(_calculateDaysInterval(
      DateTime.parse(scheduleStore.initialController.text.substring(0, 10)),
      DateTime.parse(scheduleStore.finalController.text.substring(0, 10)),
    ));

    // Filtra eventos para mostrar apenas os que estão dentro do intervalo de datas selecionado
    final DateTime startDate = DateTime.parse(scheduleStore.initialController.text.substring(0, 10));
    final DateTime endDate = DateTime.parse(scheduleStore.finalController.text.substring(0, 10));

    scheduleStore.setEventsFilter(
      app.listaEventos.eventos?.where((event) {
            return app.getEventoDatas(event).any((date) {
              return date.isAfter(startDate.subtract(const Duration(days: 1))) &&
                  date.isBefore(endDate.add(const Duration(days: 1)));
            });
          }).toList() ??
          [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChoiceDatesWidget(
                onTapDate: (controller) async {
                  final value = await _onTapInsertDate(controller);
                  if (value != null) {
                    if (controller == scheduleStore.initialController) {
                      scheduleStore.setTextInitialController(value.toIso8601String());

                      // Verifica se a data inicial é maior que a data final e ajusta se necessário
                      if (DateTime.parse(scheduleStore.initialController.text)
                          .isAfter(DateTime.parse(scheduleStore.finalController.text))) {
                        scheduleStore.setTextFinalController(value.toIso8601String());
                      }
                    } else {
                      scheduleStore.setTextFinalController(value.toIso8601String());

                      // Verifica se a data final é menor que a data inicial e ajusta se necessário
                      if (DateTime.parse(scheduleStore.finalController.text)
                          .isBefore(DateTime.parse(scheduleStore.initialController.text))) {
                        scheduleStore.setTextInitialController(value.toIso8601String());
                      }
                    }

                    // Atualiza a lista de eventos e datas
                    _updateListDatesAndEvents();
                  }
                },
                initialController: scheduleStore.initialController,
                finalController: scheduleStore.finalController,
              ),
              const SizedBox(height: 20),
              ViewDaysWidget(
                listDatesFilter: scheduleStore.listDatesFilter,
                dateSelected: scheduleStore.dateSelected,
                onTapDate: (date) {
                  if (date == scheduleStore.dateSelected) {
                    // Desmarca a data e volta para os eventos no intervalo de datas
                    scheduleStore.setDateSelected(DateTime.now().subtract(const Duration(days: 1)));
                    _updateListDatesAndEvents();
                  } else {
                    // Seleciona a data específica e mostra eventos somente para aquele dia
                    scheduleStore.setDateSelected(date);
                    scheduleStore.setEventsFilter(
                      app.listaEventos.eventos?.where((event) {
                            return app.getEventoDatas(event).any((element) => element.compareTo(date) == 0);
                          }).toList() ??
                          [],
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 8),
                  TextContrasteFonte(
                    text: AppLocalizations.of(context)!.schedule_results,
                    style: Fontes.poppins16W400Black(Fontes.tamanhoBase),
                  ),
                  const Spacer(),
                  ButtonFilterWidget(
                    onTapNavigateFilter: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FiltroCompletoPage(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Wrap(
              //   children: scheduleStore.eventsFilter
              //       .map((event) => ItemEventWidget(
              //             event: event,
              //             spacePrincipal: Espaco(),
              //             onTapEvent: () {},
              //           ))
              //       .toList(),
              // ),
            ],
          ),
        );
      },
    );
  }

  List<DateTime> _calculateDaysInterval(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  Future<DateTime?> _onTapInsertDate(TextEditingController controller) async {
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
}
