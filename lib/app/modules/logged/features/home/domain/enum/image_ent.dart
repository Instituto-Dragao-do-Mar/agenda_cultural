import 'package:agendacultural/app/modules/logged/features/home/domain/enum/image_type.dart';

class ImageEnt {
  TipoImagem? tipoimagem;
  String? base64;
  String? url;

  ImageEnt({
    this.base64,
    this.tipoimagem,
    this.url,
  });
}
