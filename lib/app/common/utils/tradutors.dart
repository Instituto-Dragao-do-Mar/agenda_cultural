import 'package:agendacultural/app/common/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

String getNomeCategoria(String categoria, BuildContext context) {
  switch (categoria) {
    case 'Música':
      return AppLocalizations.of(context)!.categories_1;
    case 'Teatro':
      return AppLocalizations.of(context)!.categories_2;
    case 'Circo':
      return AppLocalizations.of(context)!.categories_3;
    case 'Audiovisual':
      return AppLocalizations.of(context)!.categories_4;
    case 'Artes Integradas':
      return AppLocalizations.of(context)!.categories_5;
    case 'Cultura digital':
      return AppLocalizations.of(context)!.categories_6;
    case 'Cultura indígena':
      return AppLocalizations.of(context)!.categories_7;
    case 'Cultura Indígena':
      return AppLocalizations.of(context)!.categories_7;
    case 'Cultura popular':
      return AppLocalizations.of(context)!.categories_8;
    case 'Formação':
      return AppLocalizations.of(context)!.categories_9;
    case 'Dança':
      return AppLocalizations.of(context)!.categories_10;
    case 'Literatura':
      return AppLocalizations.of(context)!.categories_11;
    case 'Outros':
      return AppLocalizations.of(context)!.categories_12;
    case 'Artes Visuais':
      return AppLocalizations.of(context)!.categories_13;
    case 'Cultura Alimentar':
      return AppLocalizations.of(context)!.categories_14;
    case 'Cultura Afro-brasileira':
      return AppLocalizations.of(context)!.categories_15;
    case 'Cultura Afrobrasileira':
      return AppLocalizations.of(context)!.categories_15;
    case 'Esporte':
      return AppLocalizations.of(context)!.categories_16;
    case 'Humor':
      return AppLocalizations.of(context)!.categories_17;
    case 'Jogos':
      return AppLocalizations.of(context)!.categories_18;
    case 'Meio Ambiente':
      return AppLocalizations.of(context)!.categories_19;
    case 'Moda':
      return AppLocalizations.of(context)!.categories_20;
    case 'Gestão Cultural':
      return AppLocalizations.of(context)!.categories_21;
    default:
      return categoria;
  }
}

String getNomeAcessib(String acessiblidade, BuildContext context) {
  switch (acessiblidade) {
    case 'Elevador':
      return AppLocalizations.of(context)!.accessibility_1;
    case 'Elevador adaptado':
      return AppLocalizations.of(context)!.accessibility_2;
    case 'Rampa de acesso':
      return AppLocalizations.of(context)!.accessibility_3;
    case 'Sinalização tátil':
      return AppLocalizations.of(context)!.accessibility_4;
    case 'Vaga de estacionamento exclusiva para idosos':
      return AppLocalizations.of(context)!.accessibility_5;
    case 'Corrimão nas escadas e rampas':
      return AppLocalizations.of(context)!.accessibility_6;
    case 'Banheiros adaptados':
      return AppLocalizations.of(context)!.accessibility_7;
    case 'Bebedouro adaptado':
      return AppLocalizations.of(context)!.accessibility_8;
    case 'Sanitário adaptado':
      return AppLocalizations.of(context)!.accessibility_9;
    case 'Cadeira de rodas para uso do visitante':
      return AppLocalizations.of(context)!.accessibility_10;
    case 'Vaga de estacionamento exclusiva para deficientes':
      return AppLocalizations.of(context)!.accessibility_11;
    case 'Circuito de visitação adaptado':
      return AppLocalizations.of(context)!.accessibility_12;
    default:
      return acessiblidade;
  }
}