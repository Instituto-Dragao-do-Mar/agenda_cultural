// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';

class NotificacaoController extends HttpClient {
  Future<ListaNotificacoes> NotificacaoGet({
    required String userguidid,
    required String token,
  }) async {
    ListaNotificacoes lista = ListaNotificacoes();
    lista.notificacoes = [];

    String url = "${baseUrlApi}notificacao?p=$userguidid";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaNotificacoes.fromJson(ret);
      } else {
        setErrorMessage(response.body);
      }
    } catch (_) {
      setErrorMessage(_.toString());
    }

    return lista;
  }

  Future<void> NotificacaoMarcaLidaPost({
    required String userguidid,
    String? idnotificacao,
    required String token,
  }) async {
    String url = "${baseUrlApi}notificacao/lida";

    try {
      var parametros = jsonEncode(
        <String, dynamic>{
          'userguidid': userguidid,
          'id': idnotificacao,
        },
      );
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: parametros,
      );
      if (response.statusCode != 200) {
        setErrorMessage(response.body);
      }
    } catch (_) {
      setErrorMessage(_.toString());
    }

    return;
  }
}
