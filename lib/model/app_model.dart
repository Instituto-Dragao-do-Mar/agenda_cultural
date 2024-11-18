// ignore_for_file: non_constant_identifier_names
import 'package:agendacultural/controller/notificacao_controller.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/clearMask.dart';

class AppModel extends ChangeNotifier {
  late ListaCategorias listaCategoria;
  late ListaEventos listaEventos;
  late ListaEspacos listaEspacos;
  late Filtro filtro;
  ListaNotificacoes listaNotificacoes = ListaNotificacoes(notificacoes: []);
  ListaFavoritos listaFavoritos = ListaFavoritos();
  TextEditingController tedEspaco = TextEditingController();
  TextEditingController tedPeriodo = TextEditingController();
  TextEditingController tedAcessibilidade = TextEditingController();
  TextEditingController tedClassificacao = TextEditingController();
  TextEditingController tedCategoria = TextEditingController();
  TextEditingController tedIngresso = TextEditingController();

  Usuario? usuarioLogado;

  bool isLog() => (usuarioLogado != null && usuarioLogado?.signature != "");

  AppModel({Usuario? usr}) {
    usuarioLogado = usr ?? Usuario();
    filtro = Filtro(
      filtroDataSelecionado: FiltroData.estasemana,
    );
  }

  setUser(Usuario usr) {
    usuarioLogado = usr;
    notifyListeners();
  }

  resetUser({bool? notify}) {
    usuarioLogado = null;
    if (notify == null || notify) {
      notifyListeners();
    }
  }

  Future<void> getdados() async {
    if (isLog()) {
      listaNotificacoes = await NotificacaoController().NotificacaoGet(
        userguidid: GetGuidId(),
        token: GetToken(),
      );
    } else {
      listaNotificacoes = ListaNotificacoes(
        notificacoes: [],
      );
    }

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
  }

  void AplicarFiltro() {
    if (listaEventos.eventos != null && listaEventos.eventos!.isNotEmpty) {
      for (Evento e in listaEventos.eventos!) {
        e.passoupelofiltro = true;

        /////////////////////////////////////////////////////////////////
        /// INGRESSOS
        /////////////////////////////////////////////////////////////////

        if (tedIngresso.text.isNotEmpty && tedIngresso.text != "Todos") {
          for (Eventodatas ed in e.eventosdatas!) {
            e.passoupelofiltro = ((tedIngresso.text == "Gratuito" && (ed.preco ?? '').toUpperCase() != "PAGO") ||
                (tedIngresso.text == "Pago" && (ed.preco ?? '').toUpperCase() == "PAGO"));
            if (!e.passoupelofiltro!) {
              break;
            }
          }
        }

        /////////////////////////////////////////////////////////////////
        /// ESPACOS
        /////////////////////////////////////////////////////////////////

        if (e.passoupelofiltro!) {
          if (tedEspaco.text.isNotEmpty) {
            e.passoupelofiltro = false;
            for (Eventodatas ed in e.eventosdatas!) {
              if (ed.idespaco.toString() == tedEspaco.text) {
                e.passoupelofiltro = true;
              }
              if (e.passoupelofiltro!) {
                break;
              }
            }
          }
        }

        /////////////////////////////////////////////////////////////////
        /// CATEGORIA
        /////////////////////////////////////////////////////////////////

        if (e.passoupelofiltro!) {}
      }
    }
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
    //isso retorna sempre o nome do espaco principal
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }

    var espaco = listaEspacos.espacos!.firstWhere((element) => element.id == evento.eventosdatas!.first.idespaco!);

    if (espaco.idespacoprincipal == 0) {
      return espaco.nome ?? '';
    } else {
      var idEspacoPrincipal = espaco.idespacoprincipal;
      Espaco? espacoPrincipal;
      if (listaEspacos.espacos!.any((element) => element.id == idEspacoPrincipal)) {
        espacoPrincipal = listaEspacos.espacos!.firstWhere((element) => element.id == idEspacoPrincipal);
      }
      if (espacoPrincipal != null) {
        return espacoPrincipal.nome ?? '';
      } else {
        return espaco.nome ?? '';
      }
    }
  }

  String GetEnderecoEvento(Evento evento) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return 'Local não informado.';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == eventodatas.idespaco)) {
      return 'Local não localizado (${eventodatas.idespaco}).';
    }

    var espaco = listaEspacos.espacos!.firstWhere((element) => element.id == eventodatas.idespaco);

    if (espaco.idespacoprincipal == 0) {
      return espaco.endereco ?? 'Endereço não informado no espaço.';
    } else {
      var idEspacoPrincipal = espaco.idespacoprincipal;
      Espaco? espacoPrincipal;
      if (listaEspacos.espacos!.any((element) => element.id == idEspacoPrincipal)) {
        espacoPrincipal = listaEspacos.espacos!.firstWhere((element) => element.id == idEspacoPrincipal);
      }
      if (espacoPrincipal != null) {
        return espacoPrincipal.endereco ?? 'Endereço não informado no espaço.';
      } else {
        return espaco.endereco ?? 'Endereço não informado no espaço.';
      }
    }
  }

  String GetEspacoPrincipal({required Evento evento}) {
    //isso aqui retorna o nome do espaco em que o evento ocorrerá, pode não ser principal
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'x1';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return '';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == eventodatas.idespaco)) {
      return '';
    }

    Espaco e = listaEspacos.espacos!.firstWhere((element) => element.id == eventodatas.idespaco);

    if (e.idespacoprincipal == 0) {
      return '';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == e.idespacoprincipal)) {
      return '';
    }

    return listaEspacos.espacos!.firstWhere((element) => element.id == e.idespacoprincipal).nome!.capitalize();
  }

  String GetCategoriasEvento(Evento evento) {
    if (evento.eventoscategorias == null || evento.eventoscategorias!.isEmpty) {
      return 'Evento sem Categoria';
    }
    return evento.eventoscategorias!
        .map((e) {
          return listaCategoria.categorias!.firstWhere((element) => element.id == e.idcategoria).nome!.capitalize();
        })
        .toList()
        .toString()
        .clearMaskWithSpaces();
  }
}
