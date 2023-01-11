// ignore_for_file: non_constant_identifier_names

import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/model/localizacao_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/clearMask.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends ChangeNotifier {
  bool categoriasVerTudo = false;

  late ListaCategorias listaCategoria;
  late ListaEventos listaEventos;
  late ListaAcessibilidade listaAcessibilidade;
  late ListaEspacos listaEspacos;
  late Filtro filtro;
  Localizacao? localizacao;
  ListaFavoritos listaFavoritos = ListaFavoritos();

  Usuario? usuarioLogado;

  bool isLog() => (usuarioLogado != null && usuarioLogado?.signature != "");

  AppModel({Usuario? usr}) {
    usuarioLogado = usr ?? Usuario();
    filtro = Filtro(
      filtroDataSelecionado: FiltroData.estasemana,
    );
  }

  void setLocalizacao(double latitude, double longitude) {
    localizacao = Localizacao(
      latitude: latitude,
      longitude: longitude,
    );
  }

  double getLatitude() => (localizacao == null) ? 0.0 : localizacao!.latitude!;
  double getLongitude() =>
      (localizacao == null) ? 0.0 : localizacao!.longitude!;

  setUser(Usuario usr) {
    usuarioLogado = usr;
    notifyListeners();
  }

  resetUser() {
    usuarioLogado = null;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  Future<void> getFavoritos() async {
    listaFavoritos = await EventoController()
        .favoritosGet(userguidid: GetGuidId(), token: GetToken());
  }

  Future<void> getdados() async {
    listaCategoria = await CategoriaController().categoriaGet(
      userguidid: "",
    );
    listaEventos = await EventoController().eventoGet(
      userguidid: "",
    );
    listaEspacos = await EspacoController().espacoGet(
      userguidid: "",
    );

    /*final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;*/

    // Populo o filtro
    filtro = Filtro(
      acessibilidadeSelecionadas: [],
      categoriasSelecionadas: [],
      classificacoesSelecionadas: [],
      dataInicial: DateTime.now(),
      dataFinal: DateTime.now().add(const Duration(days: 30)),
      espacosSelecionados: [],
      ingressoSelecionados: [],
    );

    if (listaEventos.eventos != null && listaEventos.eventos!.isNotEmpty) {
      filtro.opcoesClassificacoes = [];
      listaEventos.eventos!.map(
        (e) {
          if (!filtro.opcoesClassificacoes!
              .any((element) => element == (e.classificacaoetaria ?? ''))) {
            filtro.opcoesClassificacoes!.add(e.classificacaoetaria ?? '');
          }
        },
      );
    }
    if (listaEspacos.espacos != null && listaEspacos.espacos!.isNotEmpty) {
      filtro.opcoesAcessibilidade = [];
      listaEspacos.espacos!.map(
        (e) {
          /*if (!filtro.opcoesClassificacoes!
              .any((element) => element == (e.classificacaoetaria ?? ''))) {
            filtro.opcoesClassificacoes!.add(e.classificacaoetaria ?? '');
          }*/
        },
      );
    }

    await getFavoritos();
  }

  String GetGuidId() => usuarioLogado?.guidid ?? "";

  String GetToken() => usuarioLogado?.signature ?? "";

  List<DateTime> getEventoDatas(Evento e) {
    List<DateTime> ret = [];

    // TRUNCA A DATA PRA NAO TER PROBLEMA DE HORARIO

    if (e.eventosdatas != null && e.eventosdatas!.isNotEmpty) {
      for (Eventodatas d in e.eventosdatas!) {
        ret.add(DateTime.parse(d.datahora!.substring(0, 10)));
      }
    }

    return ret;
  }

  String GetEnderecoEspaco(Espaco espaco) {
    return espaco.endereco ?? "Endereço não informado no espaço.";
  }

  String GetEspacoEvento(Evento evento) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }
    return listaEspacos.espacos!
            .firstWhere(
                (element) => element.id == evento.eventosdatas!.first.idespaco!)
            .nome ??
        '-';
  }

  String GetEnderecoEvento(Evento evento) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return 'Local não informado.';
    }

    if (!listaEspacos.espacos!
        .any((element) => element.id == eventodatas.idespaco)) {
      // print(listaEspacos.espacos!.length);
      return 'Local não localizado (${eventodatas.idespaco}).';
    }

    return listaEspacos.espacos!
            .firstWhere((element) => element.id == eventodatas.idespaco)
            .endereco ??
        "Endereço não informado no espaço.";
  }

  String GetEspacoPrincipal({required Evento evento}) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'x1';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return '';
    }

    if (!listaEspacos.espacos!
        .any((element) => element.id == eventodatas.idespaco)) {
      // print(listaEspacos.espacos!.length);
      return '';
    }

    Espaco e = listaEspacos.espacos!
        .firstWhere((element) => element.id == eventodatas.idespaco);

    if (e.idespacoprincipal == 0) {
      return '';
    }

    if (!listaEspacos.espacos!
        .any((element) => element.id == e.idespacoprincipal)) {
      return '';
      // 'x5 - ${e.idespacoprincipal}';
    }

    return listaEspacos.espacos!
        .firstWhere((element) => element.id == e.idespacoprincipal)
        .nome!
        .capitalize();
  }

  String GetCategoriasEvento(Evento evento) {
    if (evento.eventoscategorias == null || evento.eventoscategorias!.isEmpty) {
      return 'Evento sem Categoria';
    }
    return evento.eventoscategorias!
        .map((e) {
          return listaCategoria.categorias!
              .firstWhere((element) => element.id == e.idcategoria)
              .nome!
              .capitalize();
        })
        .toList()
        .toString()
        .clearMask();
  }
}
