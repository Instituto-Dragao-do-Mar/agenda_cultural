class Administrative {
  int? order;
  int? adminLevel;
  String? name;
  String? description;
  String? isoName;
  String? isoCode;
  String? wikidataId;
  int? geonameId;

  Administrative(
      {this.order,
        this.adminLevel,
        this.name,
        this.description,
        this.isoName,
        this.isoCode,
        this.wikidataId,
        this.geonameId});

  Administrative.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    adminLevel = json['adminLevel'];
    name = json['name'];
    description = json['description'];
    isoName = json['isoName'];
    isoCode = json['isoCode'];
    wikidataId = json['wikidataId'];
    geonameId = json['geonameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order'] = order;
    data['adminLevel'] = adminLevel;
    data['name'] = name;
    data['description'] = description;
    data['isoName'] = isoName;
    data['isoCode'] = isoCode;
    data['wikidataId'] = wikidataId;
    data['geonameId'] = geonameId;
    return data;
  }
}