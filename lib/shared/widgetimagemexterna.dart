import 'package:flutter/material.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/image_ent.dart';

widgetImagemExterna({
  required ImageEnt imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {
 
  return Image.network(
    imagem.url!,
    scale: 1,
    fit: fit,
  );
}
