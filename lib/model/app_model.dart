// ignore_for_file: non_constant_identifier_names
import 'package:agendacultural/controller/notificacao_controller.dart';
import 'package:agendacultural/model/notificacao_model.dart';
import 'package:flutter/material.dart';
import 'package:agendacultural/controller/categoria_controller.dart';
import 'package:agendacultural/controller/espaco_controller.dart';
import 'package:agendacultural/controller/evento_controller.dart';
import 'package:agendacultural/model/acessibilidade_model.dart';
import 'package:agendacultural/model/categoria_model.dart';
import 'package:agendacultural/model/espaco_model.dart';
import 'package:agendacultural/model/evento_model.dart';
import 'package:agendacultural/model/favorito_model.dart';
import 'package:agendacultural/model/filtro_model.dart';
import 'package:agendacultural/model/localizacao_model.dart';
import 'package:agendacultural/model/usuario_model.dart';
import 'package:agendacultural/shared/extensions/capitalize.dart';
import 'package:agendacultural/shared/extensions/clearMask.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppModel extends ChangeNotifier {
  bool categoriasVerTudo = false;

  late ListaCategorias listaCategoria;
  late ListaEventos listaEventos;
  late ListaAcessibilidade listaAcessibilidade;
  late ListaEspacos listaEspacos;
  late Filtro filtro;
  ListaNotificacoes listaNotificacoes = ListaNotificacoes(notificacoes: []);

  Localizacao? localizacao;
  ListaFavoritos listaFavoritos = ListaFavoritos();

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

  void setLocalizacao(double latitude, double longitude) {
    localizacao = Localizacao(
      latitude: latitude,
      longitude: longitude,
    );
  }

  double getLatitude() => (localizacao == null) ? 0.0 : localizacao!.latitude!;

  double getLongitude() => (localizacao == null) ? 0.0 : localizacao!.longitude!;

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

  void notify() {
    notifyListeners();
  }

  Future<void> getFavoritos() async {
    listaFavoritos = await EventoController().favoritosGet(
      userguidid: GetGuidId(),
      token: GetToken(),
    );
  }

  Future<void> getdados() async {
    listaCategoria = await CategoriaController().categoriaGet(
      userguidid: isLog() ? GetGuidId() : "",
    );
    listaEventos = await EventoController().eventoGet(
      userguidid: isLog() ? GetGuidId() : "",
    );

    // listaEventos.eventos?.forEach((element) {
    //   element.eventosdatas
    //       ?.sort((a, b) => (a.datahora?.compareDateInDays(b.datafim))!);
    // });
    await sortEventos();

    listaEspacos = await EspacoController().espacoGet(
      userguidid: isLog() ? GetGuidId() : "",
    );
    if (isLog()) {
      listaNotificacoes = await NotificacaoController().NotificacaoGet(
        userguidid: GetGuidId(),
        token: GetToken(),
      );
    } else {
      listaNotificacoes = ListaNotificacoes(
        notificacoes: [],
      );
    }

    /*final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;*/

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

    if (listaEventos.eventos != null && listaEventos.eventos!.isNotEmpty) {
      filtro.opcoesClassificacoes = [];
      listaEventos.eventos!.map(
        (e) {
          if (!filtro.opcoesClassificacoes!.any((element) => element == (e.classificacaoetaria ?? ''))) {
            filtro.opcoesClassificacoes!.add(e.classificacaoetaria ?? '');
          }
        },
      );
    }
    if (listaEspacos.espacos != null && listaEspacos.espacos!.isNotEmpty) {
      filtro.opcoesAcessibilidade = [];
      listaEspacos.espacos!.map(
        (e) {
          /*if (!filtro.opcoesClassificacoes!
              .any((element) => element == (e.classificacaoetaria ?? ''))) {
            filtro.opcoesClassificacoes!.add(e.classificacaoetaria ?? '');
          }*/
        },
      );
    }

    await getFavoritos();
  }

  void AplicarFiltro() {
    if (listaEventos.eventos != null && listaEventos.eventos!.isNotEmpty) {
      for (Evento e in listaEventos.eventos!) {
        e.passoupelofiltro = true;

        /////////////////////////////////////////////////////////////////
        /// INGRESSOS
        /////////////////////////////////////////////////////////////////

        if (tedIngresso.text.isNotEmpty && tedIngresso.text != "Todos") {
          for (Eventodatas ed in e.eventosdatas!) {
            e.passoupelofiltro = ((tedIngresso.text == "Gratuito" && (ed.preco ?? '').toUpperCase() != "PAGO") ||
                (tedIngresso.text == "Pago" && (ed.preco ?? '').toUpperCase() == "PAGO"));
            if (!e.passoupelofiltro!) {
              break;
            }
          }
        }

        /////////////////////////////////////////////////////////////////
        /// ESPACOS
        /////////////////////////////////////////////////////////////////

        if (e.passoupelofiltro!) {
          if (tedEspaco.text.isNotEmpty) {
            e.passoupelofiltro = false;
            for (Eventodatas ed in e.eventosdatas!) {
              if (ed.idespaco.toString() == tedEspaco.text) {
                e.passoupelofiltro = true;
              }
              if (e.passoupelofiltro!) {
                break;
              }
            }
          }
        }

        /////////////////////////////////////////////////////////////////
        /// CATEGORIA
        /////////////////////////////////////////////////////////////////

        if (e.passoupelofiltro!) {}
      }
    }
  }

  String GetGuidId() => usuarioLogado?.guidid ?? "";

  String GetToken() => usuarioLogado?.signature ?? "";

  List<DateTime> getEventoDatas(Evento e) {
    List<DateTime> ret = [];

    // TRUNCA A DATA PRA NAO TER PROBLEMA DE HORARIO

    if (e.eventosdatas != null && e.eventosdatas!.isNotEmpty) {
      for (Eventodatas d in e.eventosdatas!) {
        ret.add(DateTime.parse(d.datahora!.substring(0, 10)));
      }
    }

    return ret;
  }

  String GetEnderecoEspaco(Espaco espaco) {
    return espaco.endereco ?? "Endereço não informado no espaço.";
  }

  String GetEspacoEvento(Evento evento) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }

    var espaco = listaEspacos.espacos!.firstWhere((element) => element.id == evento.eventosdatas!.first.idespaco!);

    if (espaco.idespacoprincipal == 0) {
      return espaco.nome ?? '';
    } else {
      var idEspacoPrincipal = espaco.idespacoprincipal;
      Espaco? espacoPrincipal;
      if (listaEspacos.espacos!.any((element) => element.id == idEspacoPrincipal)) {
        espacoPrincipal = listaEspacos.espacos!.firstWhere((element) => element.id == idEspacoPrincipal);
      }
      if (espacoPrincipal != null) {
        return espacoPrincipal.nome ?? '';
      } else {
        return espaco.nome ?? '';
      }
    }
  }

  String GetEnderecoEvento(Evento evento) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'Nenhum endereço localizado.';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return 'Local não informado.';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == eventodatas.idespaco)) {
      return 'Local não localizado (${eventodatas.idespaco}).';
    }

    var espaco = listaEspacos.espacos!.firstWhere((element) => element.id == eventodatas.idespaco);

    if (espaco.idespacoprincipal == 0) {
      return espaco.endereco ?? 'Endereço não informado no espaço.';
    } else {
      var idEspacoPrincipal = espaco.idespacoprincipal;
      Espaco? espacoPrincipal;
      if (listaEspacos.espacos!.any((element) => element.id == idEspacoPrincipal)) {
        espacoPrincipal = listaEspacos.espacos!.firstWhere((element) => element.id == idEspacoPrincipal);
      }
      if (espacoPrincipal != null) {
        return espacoPrincipal.endereco ?? 'Endereço não informado no espaço.';
      } else {
        return espaco.endereco ?? 'Endereço não informado no espaço.';
      }
    }
  }

  String GetEspacoPrincipal({required Evento evento}) {
    if (evento.eventosdatas == null || evento.eventosdatas!.isEmpty) {
      return 'x1';
    }

    Eventodatas eventodatas = evento.eventosdatas!.first;

    if (eventodatas.idespaco == null) {
      return '';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == eventodatas.idespaco)) {
      // print(listaEspacos.espacos!.length);
      return '';
    }

    Espaco e = listaEspacos.espacos!.firstWhere((element) => element.id == eventodatas.idespaco);

    if (e.idespacoprincipal == 0) {
      return '';
    }

    if (!listaEspacos.espacos!.any((element) => element.id == e.idespacoprincipal)) {
      return '';
      // 'x5 - ${e.idespacoprincipal}';
    }

    return listaEspacos.espacos!.firstWhere((element) => element.id == e.idespacoprincipal).nome!.capitalize();
  }

  String GetCategoriasEvento(Evento evento) {
    if (evento.eventoscategorias == null || evento.eventoscategorias!.isEmpty) {
      return 'Evento sem Categoria';
    }
    return evento.eventoscategorias!
        .map((e) {
          return listaCategoria.categorias!.firstWhere((element) => element.id == e.idcategoria).nome!.capitalize();
        })
        .toList()
        .toString()
        .clearMaskWithSpaces();
  }

  Future sortEventos() async {
    listaEventos.eventos?.sort((a, b) {
      var dataHoraA = a.eventosdatas?.first.datahora;
      var dataHoraB = b.eventosdatas?.first.datahora;
      var dataA = DateTime.parse(dataHoraA!).toLocal();
      var dataB = DateTime.parse(dataHoraB!).toLocal();

      var compareResultado =
          DateTime(dataA.year, dataA.month, dataA.day).compareTo(DateTime(dataB.year, dataB.month, dataB.day));
      if (compareResultado != 0) {
        return compareResultado;
      }

      var diasParaFimA = calcularDiasParaFim(a.eventosdatas?.first.datafim, dataHoraA);
      var diasParaFimB = calcularDiasParaFim(b.eventosdatas?.first.datafim, dataHoraB);

      return diasParaFimA.compareTo(diasParaFimB);
    });
  }

  int calcularDiasParaFim(String? dataFim, String? dataInicio) {
    if (dataFim != null) {
      var dataFimDateTime = DateTime.parse(dataFim);
      var dataInicioDateTime = DateTime.parse(dataInicio!);
      var diasParaFim = dataFimDateTime.day - dataInicioDateTime.day;
      return diasParaFim;
    }
    return 0;
  }

  String getNomeCategoria(String categoria, BuildContext context) {
    switch (categoria) {
      case 'Música':
        return AppLocalizations.of(context)!.categories_1;
      case 'Teatro':
        return AppLocalizations.of(context)!.categories_2;
      case 'Circo':
        return AppLocalizations.of(context)!.categories_3;
      case 'Audiovisual':
        return AppLocalizations.of(context)!.categories_4;
      case 'Artes Integradas':
        return AppLocalizations.of(context)!.categories_5;
      case 'Cultura digital':
        return AppLocalizations.of(context)!.categories_6;
      case 'Cultura indígena':
        return AppLocalizations.of(context)!.categories_7;
      case 'Cultura Indígena':
        return AppLocalizations.of(context)!.categories_7;
      case 'Cultura popular':
        return AppLocalizations.of(context)!.categories_8;
      case 'Formação':
        return AppLocalizations.of(context)!.categories_9;
      case 'Dança':
        return AppLocalizations.of(context)!.categories_10;
      case 'Literatura':
        return AppLocalizations.of(context)!.categories_11;
      case 'Outros':
        return AppLocalizations.of(context)!.categories_12;
      case 'Artes Visuais':
        return AppLocalizations.of(context)!.categories_13;
      case 'Cultura Alimentar':
        return AppLocalizations.of(context)!.categories_14;
      case 'Cultura Afro-brasileira':
        return AppLocalizations.of(context)!.categories_15;
      case 'Cultura Afrobrasileira':
        return AppLocalizations.of(context)!.categories_15;
      case 'Esporte':
        return AppLocalizations.of(context)!.categories_16;
      case 'Humor':
        return AppLocalizations.of(context)!.categories_17;
      case 'Jogos':
        return AppLocalizations.of(context)!.categories_18;
      case 'Meio Ambiente':
        return AppLocalizations.of(context)!.categories_19;
      case 'Moda':
        return AppLocalizations.of(context)!.categories_20;
      case 'Gestão Cultural':
        return AppLocalizations.of(context)!.categories_21;
      default:
        return categoria;
    }
  }

  String getNomeAcessib(String acessiblidade, BuildContext context) {
    switch (acessiblidade) {
      case 'Elevador':
        return AppLocalizations.of(context)!.accessibility_1;
      case 'Elevador adaptado':
        return AppLocalizations.of(context)!.accessibility_2;
      case 'Rampa de acesso':
        return AppLocalizations.of(context)!.accessibility_3;
      case 'Sinalização tátil':
        return AppLocalizations.of(context)!.accessibility_4;
      case 'Vaga de estacionamento exclusiva para idosos':
        return AppLocalizations.of(context)!.accessibility_5;
      case 'Corrimão nas escadas e rampas':
        return AppLocalizations.of(context)!.accessibility_6;
      case 'Banheiros adaptados':
        return AppLocalizations.of(context)!.accessibility_7;
      case 'Bebedouro adaptado':
        return AppLocalizations.of(context)!.accessibility_8;
      case 'Sanitário adaptado':
        return AppLocalizations.of(context)!.accessibility_9;
      case 'Cadeira de rodas para uso do visitante':
        return AppLocalizations.of(context)!.accessibility_10;
      case 'Vaga de estacionamento exclusiva para deficientes':
        return AppLocalizations.of(context)!.accessibility_11;
      case 'Circuito de visitação adaptado':
        return AppLocalizations.of(context)!.accessibility_12;
      default:
        return acessiblidade;
    }
  }
}
