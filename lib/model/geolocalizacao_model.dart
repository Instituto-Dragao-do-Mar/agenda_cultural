class GeoLocalizacao {
  double? latitude;
  double? longitude;
  String? lookupSource;
  String? plusCode;
  String? localityLanguageRequested;
  String? continent;
  String? continentCode;
  String? countryName;
  String? countryCode;
  String? principalSubdivision;
  String? principalSubdivisionCode;
  String? city;
  String? locality;
  String? postcode;
  LocalityInfo? localityInfo;

  GeoLocalizacao(
      {this.latitude,
        this.longitude,
        this.lookupSource,
        this.plusCode,
        this.localityLanguageRequested,
        this.continent,
        this.continentCode,
        this.countryName,
        this.countryCode,
        this.principalSubdivision,
        this.principalSubdivisionCode,
        this.city,
        this.locality,
        this.postcode,
        this.localityInfo});

  String getEndereco() {

    String retorno = "";

    retorno += "" + ( locality ??  "");
    retorno += ", " + ( city ?? "");
    retorno += "- " + ( principalSubdivision ??  "");

    return retorno;
  }

  GeoLocalizacao.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    lookupSource = json['lookupSource'];
    plusCode = json['plusCode'];
    localityLanguageRequested = json['localityLanguageRequested'];
    continent = json['continent'];
    continentCode = json['continentCode'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    principalSubdivision = json['principalSubdivision'];
    principalSubdivisionCode = json['principalSubdivisionCode'];
    city = json['city'];
    locality = json['locality'];
    postcode = json['postcode'];
    localityInfo = json['localityInfo'] != null
        ? new LocalityInfo.fromJson(json['localityInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['lookupSource'] = lookupSource;
    data['plusCode'] = plusCode;
    data['localityLanguageRequested'] = localityLanguageRequested;
    data['continent'] = continent;
    data['continentCode'] = continentCode;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['principalSubdivision'] = principalSubdivision;
    data['principalSubdivisionCode'] = principalSubdivisionCode;
    data['city'] = city;
    data['locality'] = locality;
    data['postcode'] = postcode;
    if (localityInfo != null) {
      data['localityInfo'] = localityInfo!.toJson();
    }
    return data;
  }
}

class LocalityInfo {
  List<Administrative>? administrative;
  List<Informative>? informative;

  LocalityInfo({this.administrative, this.informative});

  LocalityInfo.fromJson(Map<String, dynamic> json) {
    if (json['administrative'] != null) {
      administrative = [];
      json['administrative'].forEach((v) {
        administrative!.add(new Administrative.fromJson(v));
      });
    }
    if (json['informative'] != null) {
      informative = [];
      json['informative'].forEach((v) {
        informative!.add(new Informative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (administrative != null) {
      data['administrative'] =
          administrative!.map((v) => v.toJson()).toList();
    }
    if (informative != null) {
      data['informative'] = informative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

class Informative {
  int? order;
  String? name;
  String? description;
  String? isoCode;
  String? wikidataId;
  int? geonameId;

  Informative(
      {this.order,
        this.name,
        this.description,
        this.isoCode,
        this.wikidataId,
        this.geonameId});

  Informative.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    name = json['name'];
    description = json['description'];
    isoCode = json['isoCode'];
    wikidataId = json['wikidataId'];
    geonameId = json['geonameId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = order;
    data['name'] = name;
    data['description'] = description;
    data['isoCode'] = isoCode;
    data['wikidataId'] = wikidataId;
    data['geonameId'] = geonameId;
    return data;
  }
}
