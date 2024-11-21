import 'package:intl/intl.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';

extension Dates on String {
  int compareDateInDays(String? endDate) {
    DateTime _startDate;
    DateTime _endDate;

    _startDate = DateTime.parse(this);
    _endDate = DateTime.parse(endDate!);

    Duration _duration = _startDate.difference(_endDate);

    return _duration.inDays;
  }

  String formatDate({String? format}) {
    String _defaultFormat = "dd/MM/yyyy";
    String _format = format == null ? _defaultFormat : format;

    if(this.isEmpty)
      return "";

    final df = new DateFormat(_format, Dados.idiomaSalvo);

    return df.format(DateTime.parse(this));
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}
