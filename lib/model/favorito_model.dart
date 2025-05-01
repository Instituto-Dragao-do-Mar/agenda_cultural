class ListaFavoritos {
  List<Favorito>? favoritos;

  ListaFavoritos({this.favoritos});

  ListaFavoritos.fromJson(Map<String, dynamic> json) {
    if (json['favoritos'] != null) {
      favoritos = <Favorito>[];
      json['favoritos'].forEach((v) {
        favoritos!.add(Favorito.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (favoritos != null) {
      data['favoritos'] = favoritos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorito {
  int? id;
  int? idusuario;
  int? idevento;

  Favorito({this.id, this.idusuario, this.idevento});

  Favorito.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idusuario = json['idusuario'];
    idevento = json['idevento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idusuario'] = idusuario;
    data['idevento'] = idevento;
    return data;
  }
}
