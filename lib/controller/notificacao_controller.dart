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
    } catch (e) {
      setError(e.toString());
    }

    return lista;
  }  

  Future<void> NotificacaoMarcaLidaPost({
    required String userguidid,
    String? idnotificacao,

    required String token,
  }) async {
    ListaUsuarioAvaliacao lista = ListaUsuarioAvaliacao();
    lista.usuariosavaliacoes = [];

    String url = "${urlApiIDM}notificacao/lida";

    try {
      //
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
        setError(response.body);
      }
    } catch (e) {
      setError(e.toString());
    }

    return;
  }
}
