import 'dart:convert';

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class CategoriaController extends BaseController {
  Future<List<Categoria>> categoriaGet() async {
    List<Categoria> list = [];

    String url = "${baseUrlApi}categorias";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['categorias'] as List).map((e) {
          return Categoria.fromJson(e);
        }).toList();
      } else {
        setError("Categoria ${response.body}");
      }
    } catch (_) {
      setError("Categoria ${_.toString()}");
    }

    return list;
  }
}
