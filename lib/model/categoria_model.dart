class ListaCategorias {
  List<Categoria>? categorias;

  ListaCategorias({this.categorias});

  ListaCategorias.fromJson(Map<String, dynamic> json) {
    if (json['categorias'] != null) {
      categorias = <Categoria>[];
      json['categorias'].forEach((v) {
        categorias!.add(Categoria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categorias != null) {
      data['categorias'] = categorias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categoria {
  int? id;
  String? nome;
  int? ativa;
  String? guidid;
  List<ImageCategoria>? imagens;
  bool? selecionada = false;

  Categoria({
    this.id,
    this.nome,
    this.ativa,
    this.guidid,
    this.imagens,
    this.selecionada,
  });

  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    ativa = json['ativa'];
    guidid = json['guidid'];
    if (json['imagens'] != null) {
      imagens = <ImageCategoria>[];
      json['imagens'].forEach((v) {
        imagens!.add(ImageCategoria.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['ativa'] = ativa;
    data['guidid'] = guidid;
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    data['selecionada'] = selecionada;
    return data;
  }
}

class ImageCategoria {
  String? id;
  String? base64;
  String? url;
  String? tipo;

  ImageCategoria({this.id, this.base64, this.url, this.tipo});

  ImageCategoria.fromJson(Map<String, dynamic> json) {
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
