import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class EspacoController extends BaseController {
  Future<ListaEspacos> espacoGet({
    required String userguidid,
  }) async {
    ListaEspacos lista = ListaEspacos();

    lista.espacos = [];

    String url = "${urlApiIDM}espacos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaEspacos.fromJson(ret);
      } else {
        setError("Espaco ${response.body}");
      }
    } catch (e) {
      setError("Espaco ${e.toString()}");
    }

    return lista;
  }
}
