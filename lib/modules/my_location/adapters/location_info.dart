import 'package:agendacultural/modules/my_location/adapters/informative.dart';
import 'package:agendacultural/modules/my_location/adapters/administrative.dart';

class LocalityInfo {
  List<Administrative>? administrative;
  List<Informative>? informative;

  LocalityInfo({this.administrative, this.informative});

  LocalityInfo.fromJson(Map<String, dynamic> json) {
    if (json['administrative'] != null) {
      administrative = [];
      json['administrative'].forEach((v) {
        administrative!.add(Administrative.fromJson(v));
      });
    }
    if (json['informative'] != null) {
      informative = [];
      json['informative'].forEach((v) {
        informative!.add(Informative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (administrative != null) {
      data['administrative'] = administrative!.map((v) => v.toJson()).toList();
    }
    if (informative != null) {
      data['informative'] = informative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}