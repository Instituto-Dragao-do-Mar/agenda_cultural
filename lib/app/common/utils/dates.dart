import 'package:intl/intl.dart';
import 'package:agendacultural/app/core/data_preferences/data_preferences.dart';

extension Dates on String {
  String formatDate({String? format}) {
    String defaultFormat = "dd/MM/yyyy";
    String format0 = format ?? defaultFormat;

    if (isEmpty) {
      return "";
    }

    final df = DateFormat(format0, Dados.idiomaSalvo);

    return df.format(DateTime.parse(this));
  }
}
