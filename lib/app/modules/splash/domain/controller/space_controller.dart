import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';

class SpaceController extends BaseController {
  Future<List<Space>> getSpaces() async {
    List<Space> list = [];

    String url = "${baseUrlApi}espacos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['espacos'] as List).map((e) {
          return Space.fromJson(e);
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
