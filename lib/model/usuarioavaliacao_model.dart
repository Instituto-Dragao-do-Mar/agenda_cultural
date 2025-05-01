class ListaUsuarioAvaliacao {
  List<UsuariosAvaliacao>? usuariosavaliacoes;

  ListaUsuarioAvaliacao({this.usuariosavaliacoes});

  ListaUsuarioAvaliacao.fromJson(Map<String, dynamic> json) {
    if (json['usuariosavaliacao'] != null) {
      usuariosavaliacoes = <UsuariosAvaliacao>[];
      json['usuariosavaliacao'].forEach((v) {
        usuariosavaliacoes!.add(UsuariosAvaliacao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usuariosavaliacoes != null) {
      data['usuariosavaliacao'] =
          usuariosavaliacoes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsuariosAvaliacao {
  int? id;
  String? datahora;
  int? idevento;
  int? idespaco;
  int? avaliacao;
  int? idusuario;
  String? comentario;

  UsuariosAvaliacao(
      {this.id,
      this.datahora,
      this.idevento,
      this.idespaco,
      this.avaliacao,
      this.idusuario,
      this.comentario});

  UsuariosAvaliacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datahora = json['datahora'];
    idevento = json['idevento'];
    idespaco = json['idespaco'];
    avaliacao = json['avaliacao'];
    idusuario = json['idusuario'];
    comentario = json['comentario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['datahora'] = datahora;
    data['idevento'] = idevento;
    data['idespaco'] = idespaco;
    data['avaliacao'] = avaliacao;
    data['idusuario'] = idusuario;
    data['comentario'] = comentario;
    return data;
  }
}
