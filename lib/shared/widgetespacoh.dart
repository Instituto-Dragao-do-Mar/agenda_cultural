// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class widgetEspacoH extends StatelessWidget {
  const widgetEspacoH({super.key, this.altura});

  final double? altura;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura ?? 10,
    );
  }
}
