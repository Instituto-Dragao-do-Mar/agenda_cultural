// ignore_for_file: camel_case_types

import 'package:agendacultural/model/imagem_model.dart';
import 'package:agendacultural/shared/constrants.dart';
import 'package:flutter/material.dart';

Image widgetImagem({
  required Imagem imagem,
  BoxFit? fit,
  double? height,
  double? width,
}) {
  if (WEB) {
    return Image.network(
      imagem.url!,
      fit: fit,
      width: width,
      height: height,
    );
  } else {
    return Image.network(
      'https://picsum.photos/200/300?random=2',
      fit: fit,
      width: width,
      height: height,
    );
  }
}
