class Favorite {
  int? id;
  int? idusuario;
  int? idevento;

  Favorite({this.id, this.idusuario, this.idevento});

  Favorite.fromJson(Map<String, dynamic> json) {
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
