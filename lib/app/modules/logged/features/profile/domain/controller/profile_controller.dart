import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/app/core/constants/constants.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';

enum ControllerStates {
  idle,
  loading,
  success,
  error,
  created,
  unauthorized,
}

class ProfileController extends HttpClient {
  var state = ControllerStates.idle;
  static String errorMessage = '';

  Future<String> recoverPassword({required String email}) async {
    String errorMessage = '';

    var body = jsonEncode(
      <String, dynamic>{
        'email': email,
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}resetarsenha'),
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
