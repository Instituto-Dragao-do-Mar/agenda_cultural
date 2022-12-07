import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:flutter/cupertino.dart';

class AppModel extends ChangeNotifier {
  bool categoriasVerTudo = false;

  late ListaCategorias listaCategoria;
  late ListaEventos listaEventos;
  late ListaAcessibilidade listaAcessibilidade;

  Future<void> getdados() async {
    listaCategoria = await CategoriaController().categoriaGet(
      userguidid: "",
    );
    listaEventos = await EventoController().eventoGet(
      userguidid: "",
    );
  }

  List<DateTime> getEventoDatas(Evento e) {
    List<DateTime> ret = [];

    // TRUNCA A DATA PRA NAO TER PROBLEMA DE HORARIO

    if (e.eventosdatas != null && e.eventosdatas!.isNotEmpty) {
      for (Eventodatas d in e.eventosdatas!) {
        ret.add(DateTime.parse(e.datahora!.substring(0,10)));
      }
    }

    return ret;
  }
}
