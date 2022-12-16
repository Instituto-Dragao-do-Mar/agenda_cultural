class ListaFavoritos {
  List<Favorito>? favoritos;

  ListaFavoritos({this.favoritos});

  ListaFavoritos.fromJson(Map<String, dynamic> json) {
    if (json['favoritos'] != null) {
      favoritos = <Favorito>[];
      json['favoritos'].forEach((v) {
        favoritos!.add(new Favorito.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favoritos != null) {
      data['favoritos'] = this.favoritos!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idusuario'] = this.idusuario;
    data['idevento'] = this.idevento;
    return data;
  }
}
