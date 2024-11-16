// ignore_for_file: camel_case_extensions

import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum FiltroData {
  estasemana,
  proximasemana,
  proximomes,
}

extension FiltroDataString on FiltroData {
  String filterDateToString(BuildContext context) {
    switch (this) {
      case FiltroData.estasemana:
        return AppLocalizations.of(context)!.home_events_this_week;
      case FiltroData.proximasemana:
        return AppLocalizations.of(context)!.home_events_next_weeek;
      case FiltroData.proximomes:
        return AppLocalizations.of(context)!.home_events_next_month;
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
