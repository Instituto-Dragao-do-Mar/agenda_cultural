// ignore_for_file: non_constant_identifier_names

class ListaNotificacoes {
  List<Notificacao>? notificacoes;

  ListaNotificacoes({this.notificacoes});

  ListaNotificacoes.fromJson(Map<String, dynamic> json) {
    if (json['notificacoes'] != null) {
      notificacoes = <Notificacao>[];
      json['notificacoes'].forEach((v) {
        notificacoes!.add(new Notificacao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificacoes != null) {
      data['notificacoes'] = this.notificacoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int NotificacoesNaoLidas() {
    int notificacoesnaolidas = 0;
    if (notificacoes != null && notificacoes!.isNotEmpty) {
      for (Notificacao n in notificacoes!) {
        if (n.lida == 1) {
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

  Notificacao(
      {this.id,
      this.datarecebimento,
      this.usuarioguidid,
      this.eventoguidid,
      this.lida,
      this.nomeevento});

  Notificacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datarecebimento = json['datarecebimento'];
    usuarioguidid = json['usuarioguidid'];
    eventoguidid = json['eventoguidid'];
    lida = json['lida'];
    nomeevento = json['nomeevento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['datarecebimento'] = this.datarecebimento;
    data['usuarioguidid'] = this.usuarioguidid;
    data['eventoguidid'] = this.eventoguidid;
    data['lida'] = this.lida;
    data['nomeevento'] = this.nomeevento;
    return data;
  }
}
