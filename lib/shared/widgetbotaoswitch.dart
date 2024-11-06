// ignore_for_file: must_be_immutable, camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class widgetBotaoSwitch extends StatefulWidget {
  widgetBotaoSwitch({Key? key, required this.value, this.function})
      : super(key: key);
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
      activeColor: const Color(0xFFE83C3B),
      value: widget.value,
      onToggle: widget.function ??
          (val) {
            setState(() {
              widget.value = val;
            });
          },
    );
  }
}
