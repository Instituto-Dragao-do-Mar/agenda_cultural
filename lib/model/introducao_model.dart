// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agendacultural/model/imagem_model.dart';
import 'package:flutter/material.dart';

class ListaIntroducao {
  List<Introducao>? introducoes;

  ListaIntroducao({
    this.introducoes,
  });
}

class Introducao {
  Widget? widget;
  int? ordem;
  Imagem? imagem;

  Introducao({
    this.widget,
    this.ordem,
    this.imagem,
  });
}
