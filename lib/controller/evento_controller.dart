import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class EventoController extends BaseController {
  Future<ListaEventos> eventoGet({
    required String userguidid,
  }) async {
    ListaEventos lista = ListaEventos();

    lista.eventos = [];

    String url = "${urlApiIDM}eventos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaEventos.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }
   
    return lista;
  }
}
