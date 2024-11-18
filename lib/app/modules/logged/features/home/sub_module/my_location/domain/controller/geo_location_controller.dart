import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/domain/adapters/geo_location.dart';

class GeoLocationController extends BaseController {
  final String apiGeoLocation = ("https://api.bigdatacloud.net/data/reverse-geocode-client");

  Future<GeoLocation> getGeoLocation({
    double? latitude,
    double? logitude,
  }) async {
    GeoLocation retorno = GeoLocation();

    String url = "$apiGeoLocation?latitude=$latitude&longitude=$logitude&localityLanguage=pt";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Accept': 'application/json'},
      );

      var ret = json.decode(response.body);

      if (response.statusCode == 200) {
        return retorno = GeoLocation.fromJson(ret);
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
