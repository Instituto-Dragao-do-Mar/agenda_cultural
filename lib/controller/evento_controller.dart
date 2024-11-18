import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/controller/base_controller.dart';

class EventoController extends BaseController {
  Future<List<Evento>> getEvents() async {
    List<Evento> list = [];

    String url = "${baseUrlApi}eventos";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);

        list = (ret['eventos'] as List).map((e) {
          return Evento.fromJson(e);
        }).toList();
      } else {
        setError("Evento ${response.body}");
      }
    } catch (_) {
      setError("Evento ${_.toString()}");
    }

    return list;
  }

  Future<List<Favorito>> getFavorites({
    required String userguidid,
    required String token,
  }) async {
    List<Favorito> list = [];

    if (userguidid.isEmpty && token.isEmpty) return list;

    String url = "${baseUrlApi}favoritos?g=$userguidid";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['favoritos'] as List).map((e) {
          return Favorito.fromJson(e);
        }).toList();
      } else {
        setError("Favoritos ${response.body}");
      }
    } catch (_) {
      setError("Favoritos ${_.toString()}");
    }

    return list;
  }

  Future<bool> postFavorited({
    required String userguidid,
    required String token,
    required int idevento,
    required int ativo,
  }) async {
    String url = "${baseUrlApi}favoritos";

    ListaFavoritos lista = ListaFavoritos();
    lista.favoritos = [];

    var operationSucceed = false;

    var body = jsonEncode(
      <String, dynamic>{"guididoperador": userguidid, "idevento": idevento, "ativo": ativo},
    );

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
        body: body,
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
