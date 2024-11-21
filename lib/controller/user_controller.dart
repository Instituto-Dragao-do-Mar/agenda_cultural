import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:agendacultural/model/app_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:agendacultural/model/acesso_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/userSharedPreferences.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';

class UserController extends HttpClient {
  var state = ControllerStates.idle;
  String errorMessage = "";
  TextEditingController emailController = TextEditingController();

  Future<Usuario> login({
    AppModel? app,
    String? email,
    String? senha,
    bool? alterarSenha = false,
  }) async {
    Acesso acesso = Acesso();
    Usuario usuarioRetorno = Usuario();
    errorMessage = "";

    try {
      var body = jsonEncode(
        <String, dynamic>{
          "login": email?.trim(),
          'senha': senha?.trim(),
        },
      );

      state = ControllerStates.loading;
      notifyListeners();

      var response = await http.post(
        Uri.parse('${baseUrlApi}auth'),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        acesso = Acesso.fromJson(ret);
        acesso.expiration = DateTime.now().add(const Duration(days: 1)).toString();

        usuarioRetorno = await getUser(
          token: acesso.signature,
          login: email?.trim(),
        );

        debugPrint("usuario retorno $usuarioRetorno");

        if (usuarioRetorno.ativo != 1) {
          usuarioRetorno.nome = null;
          errorMessage = "Usuário inativado";
          state = ControllerStates.error;
          notifyListeners();
        } else {
          usuarioRetorno.expiration = acesso.expiration;
          usuarioRetorno.signature = acesso.signature;

          app?.setUser(usuarioRetorno);

          await UserSharedPreferences.setUser(
            userguidid: usuarioRetorno.guidid!,
            usertoken: usuarioRetorno.signature!,
            email: acesso.email,
            nome: acesso.nome,
          );

          if (usuarioRetorno.alterarsenhaproximologin == 1) {
            errorMessage = "Alterar Senha";
          }

          state = ControllerStates.success;
          notifyListeners();
        }
      } else {
        if (!alterarSenha!) {
          app?.resetUser();
          await UserSharedPreferences.resetUser();
        }
        errorMessage = response.body;
        state = ControllerStates.error;
        notifyListeners();
      }
    } catch (e) {
      if (!alterarSenha!) {
        app?.resetUser();
        await UserSharedPreferences.resetUser();
      }
      errorMessage = "Acesso inválido (${e.toString()})";
      debugPrint(errorMessage);
      state = ControllerStates.error;
      notifyListeners();
    }

    return usuarioRetorno;
  }

  Future<Usuario> getUserbyPrefData(
    String token,
    String email,
  ) async {
    var user = await getUser(
      token: token,
      login: email.trim(),
    );

    return user;
  }

  Future<Usuario> getUser({
    String? login,
    String? token,
  }) async {
    Usuario user = Usuario();

    try {
      var response = await http.get(
        Uri.parse('${baseUrlApi}usuario?l=$login'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        ListaUsuarios listaUsuarios = ListaUsuarios.fromJson(ret);
        user = listaUsuarios.usuarios!.first;
      } else {
        //print(response.body);
      }
    } catch (e) {
      debugPrint("erro ${e.runtimeType}  ${e.toString()}");
    }

    return user;
  }

  Future<String?> usuariosPost({
    String? nome,
    String? email,
    String? senha,
  }) async {
    String? errorMessage;

    var parametros = jsonEncode(
      <String, dynamic>{"login": "69567689334", 'senha': "jader.aquino"},
    );

    var responseGetToken = await http.post(
      Uri.parse('${baseUrlApi}auth'),
      headers: {
        "Content-Type": "application/json",
      },
      body: parametros,
    );
    Acesso? acesso;
    if (responseGetToken.statusCode == 200) {
      var ret = jsonDecode(responseGetToken.body);
      acesso = Acesso.fromJson(ret);
    }

    String url = "https://coretools.redeinova.com.br/api/hash?senha=$senha";

    var responseCript = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer ${acesso?.signature}',
      },
    );
    var senhaEncrypt = responseCript.body;

    state = ControllerStates.loading;

    var body = jsonEncode(
      <String, dynamic>{
        // "guididoperador": "BFBC1C49-CD9A-4E04-A747-4C1817962D87",
        "login": email?.trim(),
        "nome": nome?.trim(),
        "email": email?.trim(),
        "senha": senhaEncrypt,
        "tipoacesso": "App",
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}usuarios'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
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

  Future<ListaUsuarios> usuariosPut({
    String? guidid,
    String? token,
    AppModel? app,
    String? nome,
    String? email,
    String? senha,
  }) async {
    String url = "https://coretools.redeinova.com.br/api/hash?senha=$senha";

    var responseCript = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var senhaEncrypt = responseCript.body;
    ListaUsuarios lista = ListaUsuarios();

    state = ControllerStates.loading;

    var body = jsonEncode(
      <String, dynamic>{
        "guididoperador": guidid,
        "idusuario": app?.usuarioLogado?.id,
        "nome": nome?.trim(),
        "login": email?.trim(),
        "email": email?.trim(),
        "senha": senhaEncrypt,
      },
    );

    try {
      var response = await http.put(
        Uri.parse('${baseUrlApi}usuarios?u=$guidid'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaUsuarios.fromJson(ret);
        state = ControllerStates.success;
      } else {
        setErrorMessage(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setErrorMessage(e.toString());
    }

    return lista;
  }

  Future<String?> sendRecoverPassword({
    String? email = "",
  }) async {
    String? errorMessage;
    emailController.text = email!;

    var senhaTemporaria = const Uuid().v4().toString().substring(0, 5);

    String urlSenha = "https://coretools.redeinova.com.br/api/hash?senha=$senhaTemporaria";

    var responseCript = await http.get(
      Uri.parse(urlSenha),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );
    var senhaEncrypt = responseCript.body;

    var body = jsonEncode(
      <String, dynamic>{
        // "guididoperador": "BFBC1C49-CD9A-4E04-A747-4C1817962D87",
        "email": email.trim(),
        "senhatemp": senhaTemporaria,
        "senhahash": senhaEncrypt
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}enviaremail'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
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

  Future<String?> usuariosNovaSenha({
    String? novaSenha = "",
  }) async {
    String? errorMessage;

    var body = jsonEncode(
      <String, dynamic>{
        // "guididoperador": "BFBC1C49-CD9A-4E04-A747-4C1817962D87",
        "email": emailController.text.trim(),
        "novasenha": novaSenha,
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${baseUrlApi}resetarsenha'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
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
