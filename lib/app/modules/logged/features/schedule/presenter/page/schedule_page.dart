import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agendacultural/app/common/utils/theme/themes.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/exhibition_event.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/page/widgets/view_days.dart';
import 'package:agendacultural/app/modules/logged/features/home/presenter/page/areas/events/area_events.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/page/widgets/choice_dates.dart';
import 'package:agendacultural/app/modules/logged/features/schedule/presenter/handler/schedule_state_handler.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final SchedulePageStateHandler _handler = Modular.get();

  @override
  void initState() {
    if (!mounted) super.initState();
    _handler.initialize(context);
  }

  @override
  void dispose() {
    _handler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_handler.store.isLoading) {
          return Center(
            child: CircularProgressIndicator(color: corBackgroundLaranja),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChoiceDatesWidget(
              onTapDate: _handler.onTapSelectDate,
              initialController: _handler.store.initialController,
              finalController: _handler.store.finalController,
            ),
            const SizedBox(height: 20),
            ViewDaysWidget(
              listDatesFilter: _handler.store.listDatesFilter,
              dateSelected: _handler.store.dateSelected,
              onTapDate: _handler.onTapFilterDate,
            ),
            Expanded(
              child: AreaEventsWidget(
                exhibitionEvent: ExhibitionEvent.eventSchedule,
                title: AppLocalizations.of(context)!.schedule_results,
                showAllEvents: true,
                events: _handler.store.eventsFilter,
                spaces: _handler.appStore.spaces,
                categories: _handler.appStore.categories,
                favorites: _handler.appStore.favorites,
                user: _handler.appStore.userLogged,
                onConcludeFavorite: _handler.uploadDataFavorites,
              ),
            ),
          ],
        );
      },
    );
  }
}
