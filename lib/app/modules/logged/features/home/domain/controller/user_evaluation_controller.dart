import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/adapter/user_evaluation.dart';

class UsuarioAvaliacaoController extends BaseController {
  Future<List<UserEvaluation>> getUserEvaluation({
    required String userGuidId,
    required String eventGuidId,
    required String token,
  }) async {
    List<UserEvaluation> list = [];

    String url = "${baseUrlApi}avaliacao?p=$userGuidId&e=$eventGuidId";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['usuariosavaliacao'] as List).map((e) {
          return UserEvaluation.fromJson(e);
        }).toList();
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return list;
  }

  Future<void> postUserEvaluation({
    required String userGuidId,
    required String eventGuidId,
    required String spaceGuidId,
    required String evaluation,
    required String coment,
    required String token,
  }) async {
    String url = "${baseUrlApi}avaliacao";

    try {
      var parametros = jsonEncode(
        <String, dynamic>{
          'userguidid': userGuidId,
          'eventoguidid': eventGuidId,
          'espacoguidid': spaceGuidId,
          'avaliacao': evaluation,
          'comentario': coment
        },
      );
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
        body: parametros,
      );
      if (response.statusCode != 200) {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return;
  }
}
