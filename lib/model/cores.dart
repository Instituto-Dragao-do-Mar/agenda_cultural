import 'package:flutter/material.dart';

import '../shared/themes.dart';

class Cores {
  static bool contraste = false;

  static void setAltoContraste(bool altoContraste) {
    contraste = altoContraste;
  }

  static void reloadColors() {
    corBgAtual = !contraste ? Colors.white : Colors.black;
    corAppBarAtual = !contraste ? Colors.white : Colors.black;
    corTextAtual = !contraste ? Colors.black : Colors.white;
  }
}
