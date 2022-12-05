import 'package:agendacultural/model/imagem_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

ImageProvider widgetImagemExterna({
  required Imagem imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {
  print("********* ${imagem.url} ***********}");
  print("--------------------------------------------");

  return CachedNetworkImageProvider(
    imagem.url!,
    scale: 1,
    
  );
}
