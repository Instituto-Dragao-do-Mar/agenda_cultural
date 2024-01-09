import 'dart:convert';

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/acesso_model.dart';
import '../model/app_model.dart';
import '../shared/userSharedPreferences.dart';

class UsuarioController extends BaseController {
  var state = ControllerStates.idle;
  String errorMessage = "";

  TextEditingController tedEmail = TextEditingController();

  Future<ListaUsuarios> usuarioGet({
    required String userguidid,
  }) async {
    ListaUsuarios lista = ListaUsuarios();
    lista.usuarios = [];

    String url = "${urlApiIDM}usuario";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        lista = ListaUsuarios.fromJson(ret);
      } else {
        setError(response.body);
      }
    } catch (_) {
      setError(_.toString());
    }

    return lista;
  }

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
        Uri.parse('${urlApiIDM}auth'),
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      //print(response.body);

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        acesso = Acesso.fromJson(ret);
        acesso.expiration =
            DateTime.now().add(const Duration(days: 1)).toString();

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
          usuarioRetorno == null;
        }
        errorMessage = response.body;
        state = ControllerStates.error;
        notifyListeners();
      }
    } catch (e) {
      if (!alterarSenha!) {
        app?.resetUser();
        await UserSharedPreferences.resetUser();

        usuarioRetorno == null;
      }
      errorMessage = "Acesso inválido (${e.toString()})";
      debugPrint(errorMessage);
      state = ControllerStates.error;
      notifyListeners();
    }

    return usuarioRetorno;
  }

  Future<Usuario> getUserbyPrefData(String token, String email) async {
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
        Uri.parse('${urlApiIDM}usuario?l=$login'),
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
      Uri.parse('${urlApiIDM}auth'),
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

    ListaUsuarios lista = ListaUsuarios();

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
        Uri.parse('${urlApiIDM}usuarios'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
        var ret = jsonDecode(response.body);
        lista = ListaUsuarios.fromJson(ret);
        state = ControllerStates.success;
      } else {
        errorMessage = response.body;
        setError(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setError(e.toString());
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
        Uri.parse('${urlApiIDM}usuarios?u=$guidid'),
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
        setError(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setError(e.toString());
    }

    return lista;
  }

  Future<String?> sendRecoverPassword({
    String? email = "",
  }) async {
    String? errorMessage;
    tedEmail.text = email!;

    var body = jsonEncode(
      <String, dynamic>{
        // "guididoperador": "BFBC1C49-CD9A-4E04-A747-4C1817962D87",
        "email": email.trim(),
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${urlApiIDM}enviaremail'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
        var ret = jsonDecode(response.body);
        state = ControllerStates.success;
      } else {
        errorMessage = response.body;
        setError(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setError(e.toString());
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
        "email": tedEmail.text.trim(),
        "novasenha": novaSenha,
      },
    );

    try {
      var response = await http.post(
        Uri.parse('${urlApiIDM}resetarsenha'),
        headers: {
          "Content-Type": "application/json",
          // 'Authorization': 'Bearer ${acesso?.signature}}',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        errorMessage = "";
        var ret = jsonDecode(response.body);
        state = ControllerStates.success;
        tedEmail.clear();
      } else {
        errorMessage = response.body;
        setError(response.body);
        state = ControllerStates.error;
      }
    } catch (e) {
      state = ControllerStates.error;
      setError(e.toString());
    }

    return errorMessage;
  }
}
