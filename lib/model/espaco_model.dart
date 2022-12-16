class ListaEspacos {
  List<Espaco>? espacos;

  ListaEspacos({this.espacos});

  ListaEspacos.fromJson(Map<String, dynamic> json) {
    if (json['espacos'] != null) {
      espacos = <Espaco>[];
      json['espacos'].forEach((v) {
        espacos!.add(new Espaco.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.espacos != null) {
      data['espacos'] = this.espacos!.map((v) => v.toJson()).toList();
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

  Espaco(
      {this.id,
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
      this.espacosimagens});

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
        espacosimagens!.add(new Espacoimagens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guidid'] = this.guidid;
    data['nome'] = this.nome;
    data['detalhe'] = this.detalhe;
    data['importado'] = this.importado;
    data['aprovado'] = this.aprovado;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['uf'] = this.uf;
    data['publico'] = this.publico;
    data['datacriacao'] = this.datacriacao;
    data['dataatualizacao'] = this.dataatualizacao;
    data['area'] = this.area;
    data['idexternotipoespaco'] = this.idexternotipoespaco;
    data['tags'] = this.tags;
    data['idexterno'] = this.idexterno;
    data['detalhelongo'] = this.detalhelongo;
    data['site'] = this.site;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['horario'] = this.horario;
    data['endereco'] = this.endereco;
    data['acessibilidade'] = this.acessibilidade;
    data['acessibilidade_fisica'] = this.acessibilidadeFisica;
    data['urlavatar'] = this.urlavatar;
    if (this.espacosimagens != null) {
      data['espacosimagens'] =
          this.espacosimagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Espacoimagens {
  int? id;
  int? idespaco;
  String? idimagem;
  List<ImagemEspaco>? imagens;

  Espacoimagens({this.id, this.idespaco, this.idimagem, this.imagens});

  Espacoimagens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idespaco = json['idespaco'];
    idimagem = json['idimagem'];
    if (json['imagens'] != null) {
      imagens = <ImagemEspaco>[];
      json['imagens'].forEach((v) {
        imagens!.add(new ImagemEspaco.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idespaco'] = this.idespaco;
    data['idimagem'] = this.idimagem;
    if (this.imagens != null) {
      data['imagens'] = this.imagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagemEspaco {
  String? id;
  String? base64;
  String? url;
  String? tipo;

  ImagemEspaco({this.id, this.base64, this.url, this.tipo});

  ImagemEspaco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    base64 = json['base64'];
    url = json['url'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['base64'] = this.base64;
    data['url'] = this.url;
    data['tipo'] = this.tipo;
    return data;
  }
}
