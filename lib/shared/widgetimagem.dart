// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:agendacultural/app/modules/logged/features/home/domain/enum/image_ent.dart';

Image widgetImagemInterna({
  required ImageEnt imagem,
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
  required ImageEnt imagem,
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
