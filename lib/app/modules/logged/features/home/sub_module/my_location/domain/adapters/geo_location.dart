import 'package:agendacultural/app/modules/logged/features/home/sub_module/my_location/domain/adapters/location_info.dart';

class GeoLocation {
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

  static double localAtualLatitude = 0.00;
  static double localAtualLongitude = 0.00;

  GeoLocation({
    this.latitude,
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
    this.localityInfo,
  });

  String getAddress() {
    String address = '';

    address += locality ?? '';
    address += ', ${city ?? ''}';
    address += '- ${principalSubdivision ?? ''}';

    return address;
  }

  GeoLocation.fromJson(Map<String, dynamic> json) {
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
    localityInfo = json['localityInfo'] != null ? LocalityInfo.fromJson(json['localityInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
