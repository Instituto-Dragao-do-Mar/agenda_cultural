import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum FilterDate {
  thisWeek,
  nextWeek,
  nextMonth,
}

String filterDateToString(BuildContext context, FilterDate filterDate) {
  switch (filterDate) {
    case FilterDate.thisWeek:
      return AppLocalizations.of(context)!.home_events_this_week;
    case FilterDate.nextWeek:
      return AppLocalizations.of(context)!.home_events_next_weeek;
    case FilterDate.nextMonth:
      return AppLocalizations.of(context)!.home_events_next_month;
    default:
      return '';
  }
}
