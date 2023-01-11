// ignore_for_file: camel_case_extensions

import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';

enum FiltroData {
  estasemana,
  proximasemana,
  proximomes,
}

extension FiltroDataString on FiltroData {
  String get filtrodatatostring {
    switch (this) {
    
      case FiltroData.estasemana:
        return "Esta semana";
      case FiltroData.proximasemana:
        return "Próxima semana";      
       case FiltroData.proximomes:
        return "Próximo mês";      
      default:
        return "";
    }
  }
}

class Filtro {
  DateTime? dataInicial;
  DateTime? dataFinal;

  FiltroData? filtroDataSelecionado;


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
    this.opcoesClassificacoes,
    this.filtroDataSelecionado,
  });
}
