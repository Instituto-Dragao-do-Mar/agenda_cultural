
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:flutter/material.dart';

class Filtro {
  DateTime? dataInicial;
  DateTime? dataFinal;

  List<Categoria>? categoriasSelecionadas = [];
  List<Espaco>? espacosSelecionados = [];
  List<String>? acessibilidadeSelecionadas = [];
  List<String>? ingressoSelecionados = [];

  List<String>? classificacoesSelecionadas = [];
  List<String>? opcoesClassificacoes;
  List<String>? opcoesAcessibilidade;

  Filtro({
    this.acessibilidadeSelecionadas,
    this.categoriasSelecionadas,
    this.dataFinal,
    this.dataInicial,
    this.espacosSelecionados,
    this.ingressoSelecionados,
    this.classificacoesSelecionadas,
    this.opcoesAcessibilidade,
    this.opcoesClassificacoes
  });
}
