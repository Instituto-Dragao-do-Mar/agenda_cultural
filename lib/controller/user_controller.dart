import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:agendacultural/app/core/app_store/app_store.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/access.dart';

enum ControllerStates {
  idle,
  loading,
  success,
  error,
  created,
  unauthorized,
}

class UserController extends HttpClient {
  var state = ControllerStates.idle;
  static String errorMessage = '';
  TextEditingController emailController = TextEditingController();

  Future<User> login({
    required AppStore appStore,
    required String email,
    required String senha,
    required bool alterPassword,
  }) async {
    Access acesso = Access();
    User usuarioRetorno = User();
    errorMessage = '';

    try {
      var body = jsonEncode(
        <String, dynamic>{
          'login': email.trim(),
          'senha': senha.trim(),
        },
      );

      state = ControllerStates.loading;

      var response = await http.post(
        Uri.parse('${baseUrlApi}auth'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        acesso = Access.fromJson(ret);
        acesso.expiration = DateTime.now().add(const Duration(days: 1)).toString();

        usuarioRetorno = await getUser(
          token: acesso.signature ?? '',
          login: email.trim(),
        );

        debugPrint('Usuário retorno $usuarioRetorno');

        if (usuarioRetorno.ativo != 1) {
          usuarioRetorno.nome = null;
          errorMessage = 'Usuário inativado';
          state = ControllerStates.error;
        } else {
          usuarioRetorno.expiration = acesso.expiration;
          usuarioRetorno.signature = acesso.signature;

          appStore.setUser(usuarioRetorno);

          await UserSharedPreferences.setUser(
            userguidid: usuarioRetorno.guidid!,
            usertoken: usuarioRetorno.signature!,
            email: acesso.email,
            nome: acesso.nome,
          );

          if (usuarioRetorno.alterarsenhaproximologin == 1) {
            errorMessage = 'Alterar Senha';
          }

          state = ControllerStates.success;
        }
      } else {
        if (!alterPassword) {
          appStore.setUser(User());
          await UserSharedPreferences.resetUser();
        }

        errorMessage = response.body;
        state = ControllerStates.error;
      }
    } catch (e) {
      if (!alterPassword) {
        appStore.setUser(User());
        await UserSharedPreferences.resetUser();
      }

      errorMessage = 'Acesso inválido (${e.toString()})';
      debugPrint(errorMessage);
      state = ControllerStates.error;
    }

    return usuarioRetorno;
  }

  Future<User> getUserByPrefData({required String token, required String email}) async {
    var user = await getUser(token: token, login: email.trim());

    return user;
  }

  Future<User> getUser({required String login, required String token}) async {
    User user = User();

    try {
      var response = await http.get(
        Uri.parse('${baseUrlApi}usuario?l=$login'),
        headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        ListaUsuarios listaUsuarios = ListaUsuarios.fromJson(ret);
        user = listaUsuarios.usuarios!.first;
      }
    } catch (e) {
      debugPrint('Erro ${e.runtimeType}  ${e.toString()}');
    }

    return user;
  }

  Future<String?> postUsers({
    String? nome,
    String? email,
    String? senha,
  }) async {
    String errorMessage = '';
    Access access = Access();
    String url = 'https://coretools.redeinova.com.br/api/hash?senha=$senha';

    var parameters = jsonEncode(
      <String, dynamic>{
        'login': '69567689334',
        'senha': 'jader.aquino',
      },
    );

    var responseGetToken = await http.post(
      Uri.parse('${baseUrlApi}auth'),
      headers: {'Content-Type': 'application/json'},
      body: parameters,
    );

    if (responseGetToken.statusCode == 200) {
      var ret = jsonDecode(responseGetToken.body);
      access = Access.fromJson(ret);
    }

    var responseCript = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${access.signature ?? ''}',
      },
    );

    var passwordEncrypt = responseCript.body;

    state = ControllerStates.loading;

    var body = jsonEncode(
      <String, dynamic>{
        'login': email?.trim(),
        'nome': nome?.trim(),
        'email': email?.trim(),
        'senha': passwordEncrypt,
        'tipoacesso': 'App',
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}usuarios'),
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

  Future<String?> sendRecoverPassword({String? email = ''}) async {
    String? errorMessage;
    emailController.text = email!;

    var senhaTemporaria = const Uuid().v4().toString().substring(0, 5);

    String urlSenha = 'https://coretools.redeinova.com.br/api/hash?senha=$senhaTemporaria';

    var responseCript = await http.get(
      Uri.parse(urlSenha),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
    var senhaEncrypt = responseCript.body;

    var body = jsonEncode(
      <String, dynamic>{
        'email': email.trim(),
        'senhatemp': senhaTemporaria,
        'senhahash': senhaEncrypt,
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}enviaremail'),
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

  Future<String?> usuariosNovaSenha({String? novaSenha = ''}) async {
    String? errorMessage;

    var body = jsonEncode(
      <String, dynamic>{
        'email': emailController.text.trim(),
        'novasenha': novaSenha,
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
        emailController.clear();
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
