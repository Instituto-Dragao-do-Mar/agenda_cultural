import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/app/core/constants/constants.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';

enum ControllerStates {
  idle,
  success,
  error,
}

class LogController extends HttpClient {
  var state = ControllerStates.idle;

  Future<String> postLog({
    required int idLogTipo,
    double latitude = 0.0,
    double longitude = 0.0,
    required String guidUsuario,
    required String observacao,
  }) async {
    String errorMessage = '';

    var body = jsonEncode(
      <String, dynamic>{
        'idlogtipo': idLogTipo,
        'idorigem': 1,
        'latitude': latitude,
        'longitude': longitude,
        'guidusuario': guidUsuario,
        'observacao': observacao,
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}log'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = '';
        state = ControllerStates.success;
      } else {
        errorMessage = response.body;
        setErrorMessage(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setErrorMessage(e.toString());
    }

    return errorMessage;
  }
}
