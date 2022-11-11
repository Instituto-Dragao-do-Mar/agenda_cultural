// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class widgetEspacoV extends StatelessWidget {
  const widgetEspacoV({super.key, this.largura});

  final double? largura;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largura ?? 10,
    );
  }
}
