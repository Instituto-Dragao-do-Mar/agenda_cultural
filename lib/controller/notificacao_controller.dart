// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:agendacultural/model/usuarioavaliacao_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class NotificacaoController extends BaseController {

  Future<ListaNotificacoes> NotificacaoGet({
    required String userguidid,
    required String token,
  }) async {
    ListaNotificacoes lista = ListaNotificacoes();
    lista.notificacoes = [];

    String url = "${urlApiIDM}notificacao?p=$userguidid";

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
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return lista;
  }  

  Future<void> NotificacaoMarcaLidaPost({
    required String userguidid,
    String? eventoguidid,
    String? espacoguidid,
    required String avaliacao,
    String? comentario,
    required String token,
  }) async {
    ListaUsuarioAvaliacao lista = ListaUsuarioAvaliacao();
    lista.usuariosavaliacoes = [];

    String url = "${urlApiIDM}avaliacao";

    try {
      //
      var parametros = jsonEncode(
        <String, dynamic>{
          'userguidid': userguidid,
          'eventoguidid': eventoguidid,
          'espacoguidid': espacoguidid,
          'avaliacao': avaliacao,
          'comentario': comentario
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
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return;
  }
}
