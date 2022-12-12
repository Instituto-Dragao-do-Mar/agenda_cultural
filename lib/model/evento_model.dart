class ListaEventos {
  List<Evento>? eventos;

  ListaEventos({this.eventos});

  ListaEventos.fromJson(Map<String, dynamic> json) {
    if (json['eventos'] != null) {
      eventos = <Evento>[];
      json['eventos'].forEach((v) {
        eventos!.add(Evento.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eventos != null) {
      data['eventos'] = eventos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Evento {
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
  List<Eventodatas>? eventosdatas;
  List<Eventoimagens>? eventosimagens;
  List<Eventocategorias>? eventoscategorias;

  Evento({
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
  });  

  Evento.fromJson(Map<String, dynamic> json) {
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
    if (json['eventosdatas'] != null) {
      eventosdatas = <Eventodatas>[];
      json['eventosdatas'].forEach((v) {
        eventosdatas!.add(Eventodatas.fromJson(v));
      });
    }
    if (json['eventosimagens'] != null) {
      eventosimagens = <Eventoimagens>[];
      json['eventosimagens'].forEach((v) {
        eventosimagens!.add(Eventoimagens.fromJson(v));
      });
    }
    if (json['eventoscategorias'] != null) {
      eventoscategorias = <Eventocategorias>[];
      json['eventoscategorias'].forEach((v) {
        eventoscategorias!.add(Eventocategorias.fromJson(v));
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

class Eventodatas {
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

  Eventodatas(
      {this.id,
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
      this.urlavatar});

  Eventodatas.fromJson(Map<String, dynamic> json) {
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

class Eventoimagens {
  int? id;
  int? idevento;
  String? idimagem;
  List<ImagemEvento>? imagens;

  Eventoimagens({this.id, this.idevento, this.idimagem, this.imagens});

  Eventoimagens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idevento = json['idevento'];
    idimagem = json['idimagem'];
    if (json['imagens'] != null) {
      imagens = <ImagemEvento>[];
      json['imagens'].forEach((v) {
        imagens!.add(ImagemEvento.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idevento'] = idevento;
    data['idimagem'] = idimagem;
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagemEvento {
  String? id;
  String? base64;
  String? url;
  String? tipo;

  ImagemEvento({this.id, this.base64, this.url, this.tipo});

  ImagemEvento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    base64 = json['base64'];
    url = json['url'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base64'] = base64;
    data['url'] = url;
    data['tipo'] = tipo;
    return data;
  }
}

class Eventocategorias {
  int? id;
  int? idcategoria;
  int? idevento;

  Eventocategorias({this.id, this.idcategoria, this.idevento});

  Eventocategorias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idcategoria = json['idcategoria'];
    idevento = json['idevento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idcategoria'] = idcategoria;
    data['idevento'] = idevento;
    return data;
  }
}
