import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/controller/base_controller.dart';

class EspacoController extends BaseController {
  Future<List<Espaco>> getSpaces() async {
    List<Espaco> list = [];

    String url = "${baseUrlApi}espacos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['espacos'] as List).map((e) {
          return Espaco.fromJson(e);
        }).toList();
      } else {
        setError("Espaco ${response.body}");
      }
    } catch (_) {
      setError("Espaco ${_.toString()}");
    }

    return list;
  }
}
