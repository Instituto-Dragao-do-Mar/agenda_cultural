class EventCategories {
  int? id;
  int? idcategoria;
  int? idevento;

  EventCategories({this.id, this.idcategoria, this.idevento});

  EventCategories.fromJson(Map<String, dynamic> json) {
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