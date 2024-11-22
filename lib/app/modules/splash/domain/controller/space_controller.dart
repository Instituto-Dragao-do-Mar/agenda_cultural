import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/app/core/constants/constants.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/space.dart';

class SpaceController extends HttpClient {
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
        setErrorMessage("Espaco ${response.body}");
      }
    } catch (_) {
      setErrorMessage("Espaco ${_.toString()}");
    }

    return list;
  }
}
