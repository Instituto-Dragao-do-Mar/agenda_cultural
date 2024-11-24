import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ButtonSwitch extends StatefulWidget {
  final bool value;
  final Function(bool)? onChanged;

  const ButtonSwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  void _handleToggle(bool newValue) {
    setState(() {
      _currentValue = newValue;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 48,
      height: 28,
      activeColor: const Color(0xFFE83C3B),
      value: _currentValue,
      onToggle: _handleToggle,
    );
  }
}
