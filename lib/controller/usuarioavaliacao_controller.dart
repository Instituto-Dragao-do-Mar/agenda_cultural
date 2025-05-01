// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/usuarioavaliacao_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class UsuarioAvaliacaoController extends BaseController {
  Future<ListaUsuarioAvaliacao> UsuarioAvaliacaoGet({
    required String userguidid,
    required String eventoguidid,
    required String token,
  }) async {
    ListaUsuarioAvaliacao lista = ListaUsuarioAvaliacao();
    lista.usuariosavaliacoes = [];

    String url = "${urlApiIDM}avaliacao?p=$userguidid&e=$eventoguidid";

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
        lista = ListaUsuarioAvaliacao.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (e) {
      setError(e.toString());
    }

    return lista;
  }
  /*
  @userguidid			char(36),
	@eventoguidid		varchar(36) = null,
	@espacoguidid		varchar(36) = null,
	@avaliacao			varchar(10),
	@comentario			varchar(max)
  */

  Future<void> UsuarioAvaliacaoPost({
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
    } catch (e) {
      setError(e.toString());
    }

    return;
  }
}
