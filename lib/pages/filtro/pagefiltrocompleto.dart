// ignore_for_file: camel_case_types

import 'package:agendacultural/pages/home/widgets/widgettopo.dart';
import 'package:agendacultural/shared/themes.dart';
import 'package:flutter/material.dart';

class pageFiltroCompleto extends StatefulWidget {
  const pageFiltroCompleto({super.key});

  @override
  State<pageFiltroCompleto> createState() => _pageFiltroCompletoState();
}

class _pageFiltroCompletoState extends State<pageFiltroCompleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corBgAtual,
      appBar: AppBar(
        backgroundColor: corBgAtual,
        elevation: 0,
        leadingWidth: 0,
        title: widgetTopo(),
      ),
      body: Container(),
    );
  }
}
