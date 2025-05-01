// ignore_for_file: non_constant_identifier_names

class ListaNotificacoes {
  List<Notificacao>? notificacoes;

  ListaNotificacoes({this.notificacoes});

  ListaNotificacoes.fromJson(Map<String, dynamic> json) {
    if (json['notificacoes'] != null) {
      notificacoes = <Notificacao>[];
      json['notificacoes'].forEach((v) {
        notificacoes!.add(Notificacao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notificacoes != null) {
      data['notificacoes'] = notificacoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int NotificacoesNaoLidas() {
    int notificacoesnaolidas = 0;
    if (notificacoes != null && notificacoes!.isNotEmpty) {
      for (Notificacao n in notificacoes!) {
        if (n.lida == 0) {
          notificacoesnaolidas++;
        }
      }
    }
    return notificacoesnaolidas;
  }
}

class Notificacao {
  int? id;
  String? datarecebimento;
  String? usuarioguidid;
  String? eventoguidid;
  int? lida;
  String? nomeevento;
  String? texto;

  Notificacao({
    this.id,
    this.datarecebimento,
    this.usuarioguidid,
    this.eventoguidid,
    this.lida,
    this.nomeevento,
    this.texto,
  });

  Notificacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datarecebimento = json['datarecebimento'];
    usuarioguidid = json['usuarioguidid'];
    eventoguidid = json['eventoguidid'];
    lida = json['lida'];
    nomeevento = json['nomeevento'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['datarecebimento'] = datarecebimento;
    data['usuarioguidid'] = usuarioguidid;
    data['eventoguidid'] = eventoguidid;
    data['lida'] = lida;
    data['nomeevento'] = nomeevento;
    data['texto'] = texto;
    return data;
  }
}
