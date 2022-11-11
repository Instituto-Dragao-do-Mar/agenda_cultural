import 'package:agendacultural/shared/constrants.dart';
import 'package:flutter/material.dart';

class BaseController extends ChangeNotifier {
  String messageError = "";
  bool _isError = false;

  void setError(String s) {
    debugPrint("");
    debugPrint("==========================================================");
    debugPrint("Erro na controller $s");
    debugPrint("==========================================================");
    debugPrint("");
    messageError = s;
    _isError = true;
  }

  bool isError() => _isError;

  String getError() {
    String r = messageError;
    clearError();
    return r;
  }

  void status401(String? usrGuidId) {
    //BuildContext context = navigatorKey.currentContext!;
    //context.read<AcessoController>().usuarioResetLogin(usrGuidId!);
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      "/login",
      (_) => false,
    );
  }

  void clearError() {
    messageError = "";
    _isError = false;
  }
}
