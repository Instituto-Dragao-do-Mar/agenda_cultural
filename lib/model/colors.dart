import 'package:flutter/material.dart';
import 'package:agendacultural/shared/themes.dart';

class ColorsApp {
  static bool contraste = false;

  static void setAltoContraste(bool altoContraste) => contraste = altoContraste;

  static void reloadColors() {
    corBgAtual = !contraste ? Colors.white : Colors.black;
    corAppBarAtual = !contraste ? Colors.white : Colors.black;
    corTextAtual = !contraste ? Colors.black : Colors.white;
  }
}
