import 'package:intl/intl.dart';

extension Dates on String {
  int compareDateInDays(String? endDate) {
    DateTime startDate;
    DateTime endDate0;

    startDate = DateTime.parse(this);
    endDate0 = DateTime.parse(endDate!);

    Duration duration = startDate.difference(endDate0);

    return duration.inDays;
  }

  int compareDateInSeconds(String? endDate) {
    DateTime startDate;
    DateTime endDate0;

    startDate = DateTime.parse(this);
    endDate0 = DateTime.parse(endDate!);

    Duration duration = startDate.difference(endDate0);

    return duration.inSeconds;
  }


  String formatDate({String? format}) {
    String defaultFormat = "dd/MM/yyyy";
    String format0 = format == null ? defaultFormat : format;

    if(isEmpty) {
      return "";
    }

    final df = DateFormat(format0,"pt_BR");

    return df.format(DateTime.parse(this));
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}
