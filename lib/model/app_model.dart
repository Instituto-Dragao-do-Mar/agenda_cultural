// ignore_for_file: non_constant_identifier_names

import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/clearMask.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  bool categoriasVerTudo = false;

  late ListaCategorias listaCategoria;
  late ListaEventos listaEventos;
  late ListaAcessibilidade listaAcessibilidade;
  late ListaEspacos listaEspacos;

  Usuario? usuario;

  bool isLog() => (usuario != null);

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
  }

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
