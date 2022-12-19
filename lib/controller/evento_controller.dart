import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:http/http.dart' as http;

class EventoController extends BaseController {
  Future<ListaEventos> eventoGet({
    required String userguidid,
  }) async {
    ListaEventos lista = ListaEventos();

    lista.eventos = [];

    String url = "${urlApiIDM}eventos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaEventos.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return lista;
  }

  Future<ListaFavoritos> favoritosGet({
    required String userguidid,
    required String token,
  }) async {
    ListaFavoritos lista = ListaFavoritos();

    lista.favoritos = [];

    if(userguidid.isEmpty && token.isEmpty) return lista;

    String url = "${urlApiIDM}favoritos?g=$userguidid";

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
        lista = ListaFavoritos.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return lista;
  }

  Future<bool> favoritosPost({
    required String userguidid,
    required String token,
    required int idevento,
    required int ativo,
  }) async {
    ListaFavoritos lista = ListaFavoritos();

    lista.favoritos = [];

    String url = "${urlApiIDM}favoritos";

    var operationSucceed = false;

    var _body = jsonEncode(
      <String, dynamic>{
        "guididoperador": userguidid,
        "idevento": idevento,
        "ativo": ativo,
      },
    );

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: _body,
      );
      if (response.statusCode == 200) {
        operationSucceed = true;
        var ret = jsonDecode(response.body);
        lista = ListaFavoritos.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return operationSucceed;
  }
}
