import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'constantes.dart';

class widgetBotaoSwitch extends StatefulWidget {
  widgetBotaoSwitch({super.key, required this.value, this.function});
  bool value = false;
  Function(bool)? function;

  @override
  _widgetBotaoSwitchState createState() => _widgetBotaoSwitchState();
}

class _widgetBotaoSwitchState extends State<widgetBotaoSwitch> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 48,
      height: 28,
      activeColor: Color(0xFFE83C3B),
      value: widget.value,
      onToggle: widget.function ?? (val) {
        setState(() {
          widget.value = val;
        });
      },
    );
  }
}
