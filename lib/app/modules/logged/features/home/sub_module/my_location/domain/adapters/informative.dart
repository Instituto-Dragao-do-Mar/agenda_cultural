class Informative {
  int? order;
  String? name;
  String? description;
  String? isoCode;
  String? wikidataId;
  int? geonameId;

  Informative({this.order, this.name, this.description, this.isoCode, this.wikidataId, this.geonameId});

  Informative.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    name = json['name'];
    description = json['description'];
    isoCode = json['isoCode'];
    wikidataId = json['wikidataId'];
    geonameId = json['geonameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['name'] = name;
    data['description'] = description;
    data['isoCode'] = isoCode;
    data['wikidataId'] = wikidataId;
    data['geonameId'] = geonameId;
    return data;
  }
}