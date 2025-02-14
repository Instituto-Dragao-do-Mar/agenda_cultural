import 'package:flutter/material.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:agendacultural/app/modules/auth/domain/adapters/user.dart';
import 'package:agendacultural/app/modules/auth/domain/controller/notification_controller.dart';

class AppModel extends ChangeNotifier {
  ListaNotificacoes listaNotificacoes = ListaNotificacoes(notificacoes: []);

  User? usuarioLogado;

  bool isLog() => (usuarioLogado != null && usuarioLogado?.signature != "");

  AppModel({User? usr}) {
    usuarioLogado = usr ?? User();
  }

  setUser(User usr) {
    usuarioLogado = usr;
    notifyListeners();
  }

  resetUser({bool? notify}) {
    usuarioLogado = null;
    if (notify == null || notify) {
      notifyListeners();
    }
  }

  Future<void> getdados() async {
    if (isLog()) {
      listaNotificacoes = await NotificacaoController().getNotifications(
        userguidid: getGuidId(),
        token: getToken(),
      );
    } else {
      listaNotificacoes = ListaNotificacoes(
        notificacoes: [],
      );
    }
  }

  String getGuidId() => usuarioLogado?.guidid ?? '';

  String getToken() => usuarioLogado?.signature ?? '';
}
