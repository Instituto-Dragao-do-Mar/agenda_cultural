import 'package:agendacultural/model/imagem_model.dart';
import 'package:flutter/material.dart';

widgetImagemExterna({
  required Imagem imagem,
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
