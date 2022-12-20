import 'dart:convert';

import 'package:agendacultural/controller/base_controller.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/acesso_model.dart';
import '../model/app_model.dart';
import '../shared/userSharedPreferences.dart';

class UsuarioController extends BaseController {
  var state = ControllerStates.idle;
  String errorMessage = "";

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

  Future<Usuario> login(
      {AppModel? app,
      String? email,
      String? senha,
      bool? alterarSenha = false}) async {
    Acesso _acesso = Acesso();
    Usuario _usuarioRetorno = Usuario();
    // var errorMessage = "";

    try {
      var _body = jsonEncode(
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
        body: _body,
      );

      //print(response.body);

      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        _acesso = Acesso.fromJson(ret);
        _acesso.expiration = DateTime.now().add(Duration(days: 1)).toString();

        _usuarioRetorno = await getUser(
          token: _acesso.signature,
          login: email?.trim(),
        );

        debugPrint("usuario retorno $_usuarioRetorno");

        if (_usuarioRetorno.ativo != 1) {
          _usuarioRetorno.nome = null;
          errorMessage = "Usuário inativado";
          state = ControllerStates.error;
          notifyListeners();
        } else {
          _usuarioRetorno.expiration = _acesso.expiration;
          _usuarioRetorno.signature = _acesso.signature;

          app?.setUser(_usuarioRetorno);

          await UserSharedPreferences.setUser(
            userguidid: _usuarioRetorno.guidid!,
            usertoken: _usuarioRetorno.signature!,
          );

          state = ControllerStates.success;
          notifyListeners();
        }
      } else {
        if (!alterarSenha!) {
          app?.resetUser();
          _usuarioRetorno == null;
        }
        errorMessage = response.body;
        state = ControllerStates.error;
        notifyListeners();
      }
    } catch (e) {
      if (!alterarSenha!) {
        app?.resetUser();
        _usuarioRetorno == null;
      }
      errorMessage = "Acesso inválido (${e.toString()})";
      print(errorMessage);
      state = ControllerStates.error;
      notifyListeners();
    }

    return _usuarioRetorno;
  }

  Future<Usuario> getUser({
    String? login,
    String? token,
  }) async {
    Usuario _return = Usuario();

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
        ListaUsuarios _listaUsuarios = ListaUsuarios.fromJson(ret);
        _return = _listaUsuarios.usuarios!.first;
      } else {
        //print(response.body);
      }
    } catch (e) {
      print("erro ${e.runtimeType}  ${e.toString()}");
    }

    return _return;
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

    var _body = jsonEncode(
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
        body: _body,
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

    var _body = jsonEncode(
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
        body: _body,
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
}
