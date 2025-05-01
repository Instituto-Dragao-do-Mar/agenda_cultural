import 'dart:convert';

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class CategoriaController extends BaseController {
  Future<ListaCategorias> categoriaGet({
    required String userguidid,
  }) async {
    ListaCategorias lista = ListaCategorias();
    lista.categorias = [];

    String url = "${urlApiIDM}categorias";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaCategorias.fromJson(ret);
      } else {
        setError("Categoria ${response.body}");
      }
    } catch (e) {
      setError("Categoria ${e.toString()}");
      
    }

    return lista;
  }
}
