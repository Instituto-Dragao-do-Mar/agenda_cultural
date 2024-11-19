class EventDates {
  int? id;
  int? idevento;
  String? datahora;
  int? idespaco;
  String? nome;
  String? horafim;
  String? frequencia;
  String? datainicio;
  String? datafim;
  int? diasemana;
  String? detalhe;
  String? preco;
  int? idexterno;
  String? urlavatar;

  EventDates({
    this.id,
    this.idevento,
    this.datahora,
    this.idespaco,
    this.nome,
    this.horafim,
    this.frequencia,
    this.datainicio,
    this.datafim,
    this.diasemana,
    this.detalhe,
    this.preco,
    this.idexterno,
    this.urlavatar,
  });

  EventDates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idevento = json['idevento'];
    datahora = json['datahora'];
    idespaco = json['idespaco'];
    nome = json['nome'];
    horafim = json['horafim'];
    frequencia = json['frequencia'];
    datainicio = json['datainicio'];
    datafim = json['datafim'];
    diasemana = json['diasemana'];
    detalhe = json['detalhe'];
    preco = json['preco'];
    idexterno = json['idexterno'];
    urlavatar = json['urlavatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idevento'] = idevento;
    data['datahora'] = datahora;
    data['idespaco'] = idespaco;
    data['nome'] = nome;
    data['horafim'] = horafim;
    data['frequencia'] = frequencia;
    data['datainicio'] = datainicio;
    data['datafim'] = datafim;
    data['diasemana'] = diasemana;
    data['detalhe'] = detalhe;
    data['preco'] = preco;
    data['idexterno'] = idexterno;
    data['urlavatar'] = urlavatar;
    return data;
  }
}