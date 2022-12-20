import 'dart:convert';
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/geolocalizacao_model.dart';
import 'package:http/http.dart' as http;

class GeoLocalizacaoController extends BaseController {
  final String endPointGeoLocalizacao =
      ("https://api.bigdatacloud.net/data/reverse-geocode-client");

  /*
  latitude=-3.74759&longitude=-38.48046&localityLanguage=pt");
   */

  Future<GeoLocalizacao> GeoLocalizacaoGet({
    double? latitude,
    double? logitude,
  }) async {
    GeoLocalizacao retorno = GeoLocalizacao();

    String url =
        "${endPointGeoLocalizacao}?latitude=${latitude}&longitude=${logitude}&localityLanguage=pt";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
      );

      var ret = json.decode(response.body);

      if (response.statusCode == 200) {
        return retorno = GeoLocalizacao.fromJson(ret);
      } else {
        setError('Erro get geocode ${response.body}');
      }
    } catch (_) {
      setError('Erro get geocode ${_.toString()}');
      return retorno;
    }
    return retorno;
  }
}
