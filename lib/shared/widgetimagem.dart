// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:flutter/material.dart';

Image widgetImagemInterna({
  required Imagem imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {
  //print("//////////// ${imagem.url} //////////}");
  return Image.asset(
    'imagens/${imagem.url!}',
    width: width,
    height: height,
    fit: fit,
  );
}

widgetImagemInternaProvider({
  required Imagem imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {
  //print("//////////// ${imagem.url} //////////}");
  return Image.asset(
    'imagens/${imagem.url!}',
    width: width,
    height: height,
    fit: fit,
  ).image;
}
