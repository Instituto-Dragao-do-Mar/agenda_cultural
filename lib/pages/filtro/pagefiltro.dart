// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/widgetimagem.dart';
import 'package:flutter/material.dart';

class pageFiltro extends StatefulWidget {
  const pageFiltro({super.key});

  @override
  State<pageFiltro> createState() => _pageFiltroState();
}

class _pageFiltroState extends State<pageFiltro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: widgetImagemInterna(
            imagem: Imagem(url: 'seta.png'),
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Evento",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return ListView();
  }
}
