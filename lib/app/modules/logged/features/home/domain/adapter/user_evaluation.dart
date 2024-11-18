class UserEvaluation {
  int? id;
  String? datahora;
  int? idevento;
  int? idespaco;
  int? avaliacao;
  int? idusuario;
  String? comentario;

  UserEvaluation({
    this.id,
    this.datahora,
    this.idevento,
    this.idespaco,
    this.avaliacao,
    this.idusuario,
    this.comentario,
  });

  UserEvaluation.fromJson(Map<String, dynamic> json) {
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
