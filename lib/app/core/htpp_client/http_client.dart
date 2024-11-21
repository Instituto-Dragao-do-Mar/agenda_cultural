import 'package:flutter/material.dart';

class HttpClient extends ChangeNotifier {
  String messageError = '';

  void setErrorMessage(String s) {
    debugPrint('');
    debugPrint('==========================================================');
    debugPrint('Erro na controller $s');
    debugPrint('==========================================================');
    debugPrint('');
    messageError = s;
  }
}
