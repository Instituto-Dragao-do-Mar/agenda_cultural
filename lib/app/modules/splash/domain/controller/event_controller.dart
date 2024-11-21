import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/favorite.dart';

class EventController extends HttpClient {
  Future<List<Event>> getEvents() async {
    List<Event> list = [];

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
          return Event.fromJson(e);
        }).toList();
      } else {
        setErrorMessage("Evento ${response.body}");
      }
    } catch (_) {
      setErrorMessage("Evento ${_.toString()}");
    }

    return list;
  }

  Future<List<Favorite>> getFavorites({
    required String userGuidId,
    required String token,
  }) async {
    List<Favorite> list = [];

    if (userGuidId.isEmpty && token.isEmpty) return list;

    String url = "${baseUrlApi}favoritos?g=$userGuidId";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['favoritos'] as List).map((e) {
          return Favorite.fromJson(e);
        }).toList();
      } else {
        setErrorMessage("Favoritos ${response.body}");
      }
    } catch (_) {
      setErrorMessage("Favoritos ${_.toString()}");
    }

    return list;
  }

  Future<bool> postFavorited({
    required String userGuidId,
    required String token,
    required int idEvent,
    required int active,
  }) async {
    String url = "${baseUrlApi}favoritos";

    var operationSucceed = false;

    var body = jsonEncode(
      <String, dynamic>{"guididoperador": userGuidId, "idevento": idEvent, "ativo": active},
    );

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer $token'},
        body: body,
      );
      if (response.statusCode == 200) {
        operationSucceed = true;
      } else {
        setErrorMessage(response.body);
      }
    } catch (_) {
      setErrorMessage(_.toString());
    }

    return operationSucceed;
  }
}
