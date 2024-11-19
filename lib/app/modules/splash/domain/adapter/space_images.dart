import 'package:agendacultural/app/modules/splash/domain/adapter/space_image.dart';

class SpaceImages {
  int? id;
  int? idespaco;
  String? idimagem;
  List<SpaceImage>? imagens;

  SpaceImages({this.id, this.idespaco, this.idimagem, this.imagens});

  SpaceImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idespaco = json['idespaco'];
    idimagem = json['idimagem'];
    if (json['imagens'] != null) {
      imagens = <SpaceImage>[];
      json['imagens'].forEach((v) {
        imagens!.add(SpaceImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idespaco'] = idespaco;
    data['idimagem'] = idimagem;
    if (imagens != null) {
      data['imagens'] = imagens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}