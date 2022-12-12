class ListaEspacos {
  List<Espaco>? espacos;

  ListaEspacos({this.espacos});

  ListaEspacos.fromJson(Map<String, dynamic> json) {
    if (json['espacos'] != null) {
      espacos = <Espaco>[];
      json['espacos'].forEach((v) {
        espacos!.add(Espaco.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (espacos != null) {
      data['espacos'] = espacos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Espaco {
  int? id;
  String? guidid;
  String? nome;
  String? detalhe;
  int? importado;
  int? aprovado;
  double? latitude;
  double? longitude;
  String? cep;
  String? logradouro;
  String? numero;
  String? complemento;
  String? bairro;
  String? cidade;
  String? uf;
  int? publico;
  String? datacriacao;
  String? dataatualizacao;
  String? area;
  String? idexternotipoespaco;
  String? tags;
  int? idexterno;
  String? detalhelongo;
  String? site;
  String? facebook;
  String? instagram;
  String? horario;
  String? endereco;
  String? acessibilidade;
  String? acessibilidadeFisica;
  String? urlavatar;
  List<Espacoimagens>? espacosimagens;

  Espaco({
    this.id,
    this.guidid,
    this.nome,
    this.detalhe,
    this.importado,
    this.aprovado,
    this.latitude,
    this.longitude,
    this.cep,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.uf,
    this.publico,
    this.datacriacao,
    this.dataatualizacao,
    this.area,
    this.idexternotipoespaco,
    this.tags,
    this.idexterno,
    this.detalhelongo,
    this.site,
    this.facebook,
    this.instagram,
    this.horario,
    this.endereco,
    this.acessibilidade,
    this.acessibilidadeFisica,
    this.urlavatar,
    this.espacosimagens,
  });

  Espaco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guidid = json['guidid'];
    nome = json['nome'];
    detalhe = json['detalhe'];
    importado = json['importado'];
    aprovado = json['aprovado'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
    publico = json['publico'];
    datacriacao = json['datacriacao'];
    dataatualizacao = json['dataatualizacao'];
    area = json['area'];
    idexternotipoespaco = json['idexternotipoespaco'];
    tags = json['tags'];
    idexterno = json['idexterno'];
    detalhelongo = json['detalhelongo'];
    site = json['site'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    horario = json['horario'];
    endereco = json['endereco'];
    acessibilidade = json['acessibilidade'];
    acessibilidadeFisica = json['acessibilidade_fisica'];
    urlavatar = json['urlavatar'];
    if (json['espacosimagens'] != null) {
      espacosimagens = <Espacoimagens>[];
      json['espacosimagens'].forEach((v) {
        espacosimagens!.add(Espacoimagens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guidid'] = guidid;
    data['nome'] = nome;
    data['detalhe'] = detalhe;
    data['importado'] = importado;
    data['aprovado'] = aprovado;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['uf'] = uf;
    data['publico'] = publico;
    data['datacriacao'] = datacriacao;
    data['dataatualizacao'] = dataatualizacao;
    data['area'] = area;
    data['idexternotipoespaco'] = idexternotipoespaco;
    data['tags'] = tags;
    data['idexterno'] = idexterno;
    data['detalhelongo'] = detalhelongo;
    data['site'] = site;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['horario'] = horario;
    data['endereco'] = endereco;
    data['acessibilidade'] = acessibilidade;
    data['acessibilidade_fisica'] = acessibilidadeFisica;
    data['urlavatar'] = urlavatar;
    if (espacosimagens != null) {
      data['espacosimagens'] = espacosimagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Espacoimagens {
  int? id;
  int? idespaco;
  String? idimagem;

  Espacoimagens({this.id, this.idespaco, this.idimagem});

  Espacoimagens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idespaco = json['idespaco'];
    idimagem = json['idimagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idespaco'] = idespaco;
    data['idimagem'] = idimagem;
    return data;
  }
}
