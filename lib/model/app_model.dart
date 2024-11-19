import 'package:flutter/material.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:agendacultural/controller/notificacao_controller.dart';

class AppModel extends ChangeNotifier {
  late Filtro filtro;
  ListaNotificacoes listaNotificacoes = ListaNotificacoes(notificacoes: []);
  TextEditingController tedEspaco = TextEditingController();
  TextEditingController tedPeriodo = TextEditingController();
  TextEditingController tedAcessibilidade = TextEditingController();
  TextEditingController tedClassificacao = TextEditingController();
  TextEditingController tedCategoria = TextEditingController();
  TextEditingController tedIngresso = TextEditingController();

  Usuario? usuarioLogado;

  bool isLog() => (usuarioLogado != null && usuarioLogado?.signature != "");

  AppModel({Usuario? usr}) {
    usuarioLogado = usr ?? Usuario();
    filtro = Filtro(
      filtroDataSelecionado: FiltroData.estasemana,
    );
  }

  setUser(Usuario usr) {
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
      listaNotificacoes = await NotificacaoController().NotificacaoGet(
        userguidid: getGuidId(),
        token: getToken(),
      );
    } else {
      listaNotificacoes = ListaNotificacoes(
        notificacoes: [],
      );
    }

    // Populo o filtro
    filtro = Filtro(
      acessibilidadeSelecionadas: [],
      categoriasSelecionadas: [],
      classificacoesSelecionadas: [],
      dataInicial: DateTime.now(),
      dataFinal: DateTime.now().add(const Duration(days: 30)),
      espacosSelecionados: [],
      ingressoSelecionados: [],
    );
  }

  void aplicatFiltro() {
    // if (listaEventos.eventos != null && listaEventos.eventos!.isNotEmpty) {
    //   for (Event e in listaEventos.eventos!) {
    //     e.passoupelofiltro = true;
    //
    //     /////////////////////////////////////////////////////////////////
    //     /// INGRESSOS
    //     /////////////////////////////////////////////////////////////////
    //
    //     if (tedIngresso.text.isNotEmpty && tedIngresso.text != "Todos") {
    //       for (EventDates ed in e.eventosdatas!) {
    //         e.passoupelofiltro = ((tedIngresso.text == "Gratuito" && (ed.preco ?? '').toUpperCase() != "PAGO") ||
    //             (tedIngresso.text == "Pago" && (ed.preco ?? '').toUpperCase() == "PAGO"));
    //         if (!e.passoupelofiltro!) {
    //           break;
    //         }
    //       }
    //     }
    //
    //     /////////////////////////////////////////////////////////////////
    //     /// ESPACOS
    //     /////////////////////////////////////////////////////////////////
    //
    //     if (e.passoupelofiltro!) {
    //       if (tedEspaco.text.isNotEmpty) {
    //         e.passoupelofiltro = false;
    //         for (EventDates ed in e.eventosdatas!) {
    //           if (ed.idespaco.toString() == tedEspaco.text) {
    //             e.passoupelofiltro = true;
    //           }
    //           if (e.passoupelofiltro!) {
    //             break;
    //           }
    //         }
    //       }
    //     }
    //
    //     /////////////////////////////////////////////////////////////////
    //     /// CATEGORIA
    //     /////////////////////////////////////////////////////////////////
    //
    //     if (e.passoupelofiltro!) {}
    //   }
    // }
  }

  String getGuidId() => usuarioLogado?.guidid ?? "";

  String getToken() => usuarioLogado?.signature ?? "";
}
