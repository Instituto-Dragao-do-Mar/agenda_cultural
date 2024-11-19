import 'package:agendacultural/app/modules/splash/domain/adapter/event_image.dart';

class EventImages {
  int? id;
  int? idevento;
  String? idimagem;
  List<EventImage>? imagens;

  EventImages({this.id, this.idevento, this.idimagem, this.imagens});

  EventImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idevento = json['idevento'];
    idimagem = json['idimagem'];
    if (json['imagens'] != null) {
      imagens = <EventImage>[];
      json['imagens'].forEach((v) {
        imagens!.add(EventImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idevento'] = idevento;
    data['idimagem'] = idimagem;
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
