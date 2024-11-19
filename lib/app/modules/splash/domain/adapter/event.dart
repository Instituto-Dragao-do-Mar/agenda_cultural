import 'package:agendacultural/app/modules/splash/domain/adapter/event_dates.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event_images.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/event_categories.dart';

class Event {
  int? id;
  String? guidid;
  String? nome;
  String? detalhe;
  int? destaque;
  int? importado;
  int? aprovado;
  int? entradagratuita;
  String? urlentrada;
  int? ativo;
  int? idclassificacao;
  String? datahora;
  String? telefone;
  String? linguagem;
  String? datacriacao;
  String? dataatualizacao;
  String? classificacaoetaria;
  int? idexterno;
  String? detalhelongo;
  String? urlavatar;
  List<EventDates>? eventosdatas;
  List<EventImages>? eventosimagens;
  List<EventCategories>? eventoscategorias;
  double? distancia;
  bool? passoupelofiltro;

  Event({
    this.id,
    this.guidid,
    this.nome,
    this.detalhe,
    this.destaque,
    this.importado,
    this.aprovado,
    this.entradagratuita,
    this.urlentrada,
    this.ativo,
    this.idclassificacao,
    this.datahora,
    this.telefone,
    this.linguagem,
    this.datacriacao,
    this.dataatualizacao,
    this.classificacaoetaria,
    this.idexterno,
    this.detalhelongo,
    this.urlavatar,
    this.eventosdatas,
    this.eventosimagens,
    this.eventoscategorias,
    this.distancia,
    this.passoupelofiltro,
  });

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guidid = json['guidid'];
    nome = json['nome'];
    detalhe = json['detalhe'];
    destaque = json['destaque'];
    importado = json['importado'];
    aprovado = json['aprovado'];
    entradagratuita = json['entradagratuita'];
    urlentrada = json['urlentrada'];
    ativo = json['ativo'];
    idclassificacao = json['idclassificacao'];
    datahora = json['datahora'];
    telefone = json['telefone'];
    linguagem = json['linguagem'];
    datacriacao = json['datacriacao'];
    dataatualizacao = json['dataatualizacao'];
    classificacaoetaria = json['classificacaoetaria'];
    idexterno = json['idexterno'];
    detalhelongo = json['detalhelongo'];
    urlavatar = json['urlavatar'];
    distancia = json['distancia'];
    passoupelofiltro = true;
    if (json['eventosdatas'] != null) {
      eventosdatas = <EventDates>[];
      json['eventosdatas'].forEach((v) {
        eventosdatas!.add(EventDates.fromJson(v));
      });
    }
    if (json['eventosimagens'] != null) {
      eventosimagens = <EventImages>[];
      json['eventosimagens'].forEach((v) {
        eventosimagens!.add(EventImages.fromJson(v));
      });
    }
    if (json['eventoscategorias'] != null) {
      eventoscategorias = <EventCategories>[];
      json['eventoscategorias'].forEach((v) {
        eventoscategorias!.add(EventCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guidid'] = guidid;
    data['nome'] = nome;
    data['detalhe'] = detalhe;
    data['destaque'] = destaque;
    data['importado'] = importado;
    data['aprovado'] = aprovado;
    data['entradagratuita'] = entradagratuita;
    data['urlentrada'] = urlentrada;
    data['ativo'] = ativo;
    data['idclassificacao'] = idclassificacao;
    data['datahora'] = datahora;
    data['telefone'] = telefone;
    data['linguagem'] = linguagem;
    data['datacriacao'] = datacriacao;
    data['dataatualizacao'] = dataatualizacao;
    data['classificacaoetaria'] = classificacaoetaria;
    data['idexterno'] = idexterno;
    data['detalhelongo'] = detalhelongo;
    data['urlavatar'] = urlavatar;
    data['distancia'] = distancia;
    if (eventosdatas != null) {
      data['eventosdatas'] = eventosdatas!.map((v) => v.toJson()).toList();
    }
    if (eventosimagens != null) {
      data['eventosimagens'] = eventosimagens!.map((v) => v.toJson()).toList();
    }
    if (eventoscategorias != null) {
      data['eventoscategorias'] =
          eventoscategorias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
